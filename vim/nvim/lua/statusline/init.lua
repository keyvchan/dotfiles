-- local utils = require('statusline/utils')
-- local git = require('git')
-- local ts = require('nvim-treesitter')
local lsp_status = require('lsp-status')
local icons = require('nvim-web-devicons')

local function lint_lsp(buf)
    local result = ''
    if #vim.lsp.buf_get_clients(buf) > 0 then
        result = result .. lsp_status.status()
    end
    return result
end

local mode_table = {
    n = 'Normal',
    no = 'N·Operator Pending',
    v = 'Visual',
    V = 'V·Line',
    ['^V'] = 'V·Block',
    s = 'Select',
    S = 'S·Line',
    ['^S'] = 'S·Block',
    i = 'Insert',
    R = 'Replace',
    Rv = 'V·Replace',
    c = 'Command',
    cv = 'Vim Ex',
    ce = 'Ex',
    r = 'Prompt',
    rm = 'More',
    ['r?'] = 'Confirm',
    ['!'] = 'Shell',
    t = 'Terminal'
}

local function get_mode(mode) return string.upper(mode_table[mode] or 'V-Block') end

local function filename(buf_name, win_id)
    local base_name = vim.fn.fnamemodify(buf_name, [[:~:.]])
    local space = math.min(60, math.floor(0.6 * vim.fn.winwidth(win_id)))
    if string.len(base_name) <= space then
        return base_name
    else
        return vim.fn.pathshorten(base_name)
    end
end

local function update_colors(mode)
    if mode == 'n' then
        vim.cmd [[hi StatuslineAccent guibg=#98C379 gui=bold guifg=#272822]]
        vim.cmd [[hi StatuslineModePowerlineSymbol guifg=#98C379 gui=bold guibg=none]]
    elseif mode == 'i' then
        vim.cmd [[hi StatuslineAccent guibg=#61AFEF gui=bold guifg=#272822]]
        vim.cmd [[hi StatuslineModePowerlineSymbol guifg=#61AFEF gui=bold guibg=none]]
    elseif mode == 'R' then
        vim.cmd [[hi StatuslineAccent guibg=#c678dd gui=bold guifg=#272822]]
        vim.cmd [[hi StatuslineModePowerlineSymbol guifg=#c678dd gui=bold guibg=none]]
    elseif mode == 'c' then
        vim.cmd [[hi StatuslineAccent guibg=#61afef gui=bold guifg=#272822]]
        vim.cmd [[hi StatuslineModePowerlineSymbol guifg=#61AFEF gui=bold guibg=none]]
    elseif mode == 't' then
        vim.cmd [[hi StatuslineAccent guibg=#e9e9e9 gui=bold guifg=#272822]]
        vim.cmd [[hi StatuslineModePowerlineSymbol guifg=#e9e9e9 gui=bold guibg=none]]
    else
        vim.cmd [[hi StatuslineAccent guibg=#e9e9e9 gui=bold guifg=#272822]]
        vim.cmd [[hi StatuslineModePowerlineSymbol guifg=#e9e9e9 gui=bold guibg=none]]
    end

    if vim.bo.modified then
        vim.cmd [[hi StatuslineFilename guifg=#d75f5f gui=bold guibg=none]]
    else
        vim.cmd [[hi StatuslineFilename guifg=#e9e9e9 gui=bold guibg=none]]
    end

    -- vim.cmd [[hi StatuslineFileType guifg=#e9e9e9 gui=bold guibg=#8F908A]]
    vim.cmd [[hi StatuslineFileType guifg=#e9e9e9 gui=bold guibg=none]]
    vim.cmd [[hi StatuslineLint guifg=#272822 gui=bold guibg=#ff8c00]]
    vim.cmd [[hi StatuslineLineCol guifg=#272822 gui=bold guibg=#98c379]]

    vim.cmd [[hi StatuslineLSPPowerlineSymbol guifg=#ff8c00 gui=bold guibg=none]]

end

local function set_modified_symbol(modified)
    if modified then
        vim.cmd [[hi StatuslineModified guibg=none gui=bold guifg=#d75f5f]]
        return '  ●'
    else
        vim.cmd [[ hi StatuslineModified guibg=none gui=bold guifg=#afaf00]]
        return ''
    end
end

local function get_paste() return vim.o.paste and 'PASTE ' or '' end

local function get_readonly_space()
    return ((vim.o.paste and vim.bo.readonly) and ' ' or '') and '%r' ..
               (vim.bo.readonly and ' ' or '')
end

local function get_powerline_symbol_right() return '\u{e0b0}' end

local function status()
    local mode = vim.fn.mode()
    local win_id = vim.fn.win_getid()
    local buf_nr = vim.fn.winbufnr(win_id)
    local buf_name = vim.fn.bufname(buf_nr)
    local file_name = vim.api.nvim_buf_get_name(buf_name)
    file_name = vim.api.nvim_call_function('fnamemodify', {file_name, ":p:t"})
    local extension = vim.fn.resolve(vim.fn.fnamemodify(file_name, ":e"))

    update_colors(mode)
    local line_components = {}
    table.insert(line_components,
                 '%#StatuslineAccent# ' .. get_mode(mode) .. ' ')
    table.insert(line_components, '%#StatuslineModePowerlineSymbol#' ..
                     get_powerline_symbol_right() .. ' ')
    table.insert(line_components,
                 '%#StatuslineFiletype# ' .. icons.get_icon(extension) .. " ")
    table.insert(line_components, '%#StatuslineModified#' ..
                     set_modified_symbol(vim.bo.modified))
    table.insert(line_components, '%#StatuslineFilename# ' ..
                     filename(buf_name, win_id) .. ' %<')
    table.insert(line_components, '%#StatuslineFilename# ' .. get_paste())
    table.insert(line_components, get_readonly_space())
    -- local ts_component = ts.statusline(60)
    -- if ts_component ~= nil then
    --   table.insert(line_components, ts_component .. ' ')
    -- end
    table.insert(line_components, '%#StatuslineLint#' .. lint_lsp(buf_nr))
    table.insert(line_components, '%#StatuslineLSPPowerlineSymbol#' ..
                     get_powerline_symbol_right() .. ' ')
    table.insert(line_components, '%#StatuslineFiletype#' .. '%=')
    table.insert(line_components,
                 '%#StatuslineLineCol# (%l/%L, %#StatuslineLineCol# %c) %<')
    return table.concat(line_components, '')
end

local function update()
    for i = 1, vim.fn.winnr('$') do vim.wo.statusline = status() end
end

return {status = status, update = update}
