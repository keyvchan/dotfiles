local M = {}

local config_root = vim.uv.fs_realpath(vim.fn.stdpath("config"))
if not config_root then
	return M
end

-- The default layout keeps dotfiles/ and acp.nvim/ as sibling checkouts.
-- ACP_NVIM_DEV_ROOT can override that without committing a machine-local path.
local developer_root = vim.fs.dirname(vim.fs.dirname(config_root))
local source_root = vim.fs.normalize(vim.env.ACP_NVIM_DEV_ROOT or vim.fs.joinpath(developer_root, "acp.nvim"))
local runtime_dir = vim.fs.joinpath(source_root, "lua", "acp")
local sync_script = vim.fs.joinpath(source_root, "scripts", "update-local-plugin.sh")
if vim.fn.isdirectory(runtime_dir) ~= 1 or vim.fn.executable(sync_script) ~= 1 then
	return M
end

local handles = {}
local poller
local generation = 0
local syncing = false
local rerun = false
local watching = false
local polling = false
local watcher_error
local poller_error
local last_error
local last_sync

local function notify(message, level)
	vim.notify(message, level or vim.log.levels.INFO, { title = "acp.nvim dev" })
end

local function reload_plugin()
	local loaded, reload = pcall(require, "acp.reload")
	if not loaded then
		return false, reload
	end
	local ok, reloaded, err = pcall(reload.reload, { silent = true })
	if not ok then
		return false, reloaded
	end
	return reloaded, err
end

local schedule_sync

local function source_fingerprint()
	local files = vim.fn.globpath(runtime_dir, "**/*.lua", false, true)
	table.sort(files)
	local parts = {}
	for _, path in ipairs(files) do
		local stat = vim.uv.fs_stat(path)
		if stat then
			local mtime = stat.mtime or {}
			table.insert(parts, table.concat({
				path:sub(#runtime_dir + 2),
				tostring(stat.size or 0),
				tostring(mtime.sec or 0),
				tostring(mtime.nsec or 0),
			}, ":"))
		end
	end
	return table.concat(parts, "\n")
end

local observed_fingerprint = source_fingerprint()

local function sync_plugin()
	if syncing then
		rerun = true
		return
	end
	syncing = true
	local started, start_err = pcall(vim.system, { sync_script }, { text = true }, vim.schedule_wrap(function(result)
		syncing = false
		if result.code == 0 then
			local reloaded, reload_err = reload_plugin()
			if reloaded then
				last_error = nil
				last_sync = os.time()
				notify("Synchronized and reloaded acp.nvim")
			else
				last_error = tostring(reload_err or "Unknown reload failure")
				notify(last_error, vim.log.levels.ERROR)
			end
		else
			local stderr = tostring(result.stderr or "")
			local stdout = tostring(result.stdout or "")
			local message = stderr ~= "" and stderr or stdout
			last_error = message ~= "" and message or "Failed to synchronize acp.nvim"
			notify(last_error, vim.log.levels.ERROR)
		end
		if rerun then
			rerun = false
			schedule_sync()
		end
	end))
	if not started then
		syncing = false
		last_error = tostring(start_err)
		notify(last_error, vim.log.levels.ERROR)
	end
end

schedule_sync = function()
	generation = generation + 1
	local ticket = generation
	vim.defer_fn(function()
		if ticket == generation then
			sync_plugin()
		end
	end, 200)
end

local function detect_changes()
	local fingerprint = source_fingerprint()
	if fingerprint ~= observed_fingerprint then
		observed_fingerprint = fingerprint
		schedule_sync()
	end
end

local function start_watcher(flags)
	local handle, create_err = vim.uv.new_fs_event()
	if not handle then
		return false, tostring(create_err or "Could not create a filesystem watcher")
	end
	local callback = vim.schedule_wrap(function(err)
		if err then
			watcher_error = tostring(err)
			watching = false
			pcall(handle.stop, handle)
			if not handle:is_closing() then
				pcall(handle.close, handle)
			end
			notify(("Filesystem watcher stopped: %s; polling remains active"):format(watcher_error), vim.log.levels.WARN)
			return
		end
		detect_changes()
	end)
	local ok, result, start_err = pcall(handle.start, handle, runtime_dir, flags, callback)
	if ok and result ~= nil then
		table.insert(handles, handle)
		watching = true
		return true
	end
	pcall(handle.close, handle)
	return false, tostring(ok and start_err or result)
end

-- A recursive libuv watcher can report EMFILE asynchronously on macOS. Watch
-- the top-level directory for the fast path; the fingerprint poller below also
-- covers nested modules and coalesced or dropped filesystem events.
local watcher_started, watcher_err = start_watcher({})
if not watcher_started then
	watcher_error = watcher_err
	notify(("Could not watch %s: %s"):format(runtime_dir, watcher_error), vim.log.levels.WARN)
end

local poller_create_err
poller, poller_create_err = vim.uv.new_timer()
if poller then
	local ok, result, start_err = pcall(poller.start, poller, 1000, 1000, vim.schedule_wrap(detect_changes))
	if ok and result ~= nil then
		polling = true
	else
		pcall(poller.close, poller)
		poller = nil
		poller_error = tostring(ok and start_err or result)
		notify(("Could not start the acp.nvim fallback poller: %s"):format(poller_error), vim.log.levels.WARN)
	end
else
	poller_error = tostring(poller_create_err or "Could not create the acp.nvim fallback poller")
	notify(poller_error, vim.log.levels.WARN)
end

function M.stop()
	generation = generation + 1
	for _, watcher in ipairs(handles) do
		pcall(watcher.stop, watcher)
		if not watcher:is_closing() then
			pcall(watcher.close, watcher)
		end
	end
	handles = {}
	watching = false
	if poller then
		pcall(poller.stop, poller)
		if not poller:is_closing() then
			pcall(poller.close, poller)
		end
		poller = nil
	end
	polling = false
end

function M.status()
	return {
		source_root = source_root,
		runtime_dir = runtime_dir,
		watching = watching,
		polling = polling,
		watcher_error = watcher_error,
		poller_error = poller_error,
		syncing = syncing,
		last_sync = last_sync,
		last_error = last_error,
	}
end

vim.api.nvim_create_user_command("AcpDevSync", sync_plugin, {
	force = true,
	desc = "Synchronize and hot-reload the local acp.nvim checkout",
})
vim.api.nvim_create_user_command("AcpDevStatus", function()
	local status = M.status()
	notify(table.concat({
		("Watcher: %s"):format(status.watching and "active" or "inactive"),
		("Fallback poller: %s"):format(status.polling and "active" or "inactive"),
		("Watcher error: %s"):format(status.watcher_error or "none"),
		("Poller error: %s"):format(status.poller_error or "none"),
		("Sync: %s"):format(status.syncing and "running" or "idle"),
		("Source: %s"):format(status.source_root),
		("Last sync: %s"):format(status.last_sync and os.date("%Y-%m-%d %H:%M:%S", status.last_sync) or "never"),
		("Last error: %s"):format(status.last_error or "none"),
	}, "\n"))
end, {
	force = true,
	desc = "Show local acp.nvim development watcher status",
})

local group = vim.api.nvim_create_augroup("DotfilesAcpDev", { clear = true })
vim.api.nvim_create_autocmd("VimLeavePre", {
	group = group,
	callback = M.stop,
	desc = "Stop the local acp.nvim development watcher",
})

-- Always reconcile the source checkout on startup. This covers edits made while
-- Neovim was closed; the transactional reload also makes this safe if a chat is
-- opened before the asynchronous synchronization completes.
sync_plugin()

return M
