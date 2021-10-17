local nvim_lsp = require "lspconfig"
local lsp_status = require "lsp-status"
local compe = require "compe"
local signature_help = require "lsp_signature"

lsp_status.config {
  status_symbol = " ",
  indicator_info = "‼ ",
  indicator_errors = "✗",
  indicator_hint = "ﯧ ",
  indicator_warnings = " ",
}
lsp_status.register_progress()
nvim_lsp.util.default_config.capabilities = vim.tbl_extend(
  "keep",
  nvim_lsp.util.default_config.capabilities or {},
  lsp_status.capabilities
)

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  -- Enable underline, use default values
  underline = true,
  -- Enable virtual text, override spacing to 4
  virtual_text = { spacing = 4, source = "always" },
  -- Use a function to dynamically turn signs off
  -- and on, using buffer local variables
  -- Disable a feature
  update_in_insert = true,
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
  -- Use a sharp border with `FloatBorder` highlights
  border = "single",
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })

compe.setup {
  enabled = true,
  autocomplete = true,
  debug = false,
  min_length = 1,
  preselect = "disable",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  documentation = true,

  source = {
    path = true,
    buffer = true,
    nvim_lsp = true,
    spell = { filetypes = { "markdown", "tex", "text", "md" } },
  },
}
vim.api.nvim_command "inoremap <silent><expr> <C-Space> compe#complete()"
vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", { expr = true })
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", { expr = true })
local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
  local col = vim.fn.col "." - 1
  if col == 0 or vim.fn.getline("."):sub(col, col):match "%s" then
    return true
  else
    return false
  end
end
--
-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn["compe#complete"]()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

local on_attach = function(client)
  lsp_status.on_attach(client)

  vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", { noremap = true, silent = true })

  signature_help.on_attach {
    bind = true, -- This is mandatory, otherwise border config won't get registered.
    -- If you want to hook lspsaga or other signature handler, pls set to false
    doc_lines = 2, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
    -- set to 0 if you DO NOT want any API comments be shown
    -- This setting only take effect in insert mode, it does not affect signature help in normal
    -- mode, 10 by default

    floating_window = false, -- show hint in a floating window, set to false for virtual text only mode

    floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
    -- will set to true when fully ested, set to false will use whichever side has more space
    -- this setting will be helpful if you do not want the PUM and floating win overlap
    fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
    hint_enable = true, -- virtual hint enable
    hint_prefix = "\u{27a5} ", -- Panda for parameter
    hint_scheme = "String",
    use_lspsaga = false, -- set to true if you want to use lspsaga popup
    hi_parameter = "Search", -- how your parameter will be highlight
    max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
    -- to view the hiding contents
    max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
    transpancy = 10, -- set this value if you want the floating windows to be transpant (100 fully transpant), nil to disable(default)
    handler_opts = {
      border = "shadow", -- double, single, shadow, none
    },

    trigger_on_newline = false, -- set to true if you need multiple line parameter, sometime show signature on new line can be confusing, set it to false for #58
    extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
    -- deprecate !!
    -- decorator = {"`", "`"}  -- this is no longer needed as nvim give me a handler and it allow me to highlight active parameter in floating_window
    zindex = 200, -- by default it will be on top of all floating windows, set to 50 send it to bottom
    debug = false, -- set to true to enable debug logging
    log_path = "debug_log_file_path", -- debug log path

    padding = "", -- character to pad on left and right of signature can be ' ', or '|'  etc

    shadow_blend = 36, -- if you using shadow as border use this set the opacity
    shadow_guibg = "Black", -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
    timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
    toggle_key = nil, -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
  }
end

local system_name
if vim.fn.has "mac" == 1 then
  system_name = "macOS"
elseif vim.fn.has "unix" == 1 then
  system_name = "Linux"
elseif vim.fn.has "win32" == 1 then
  system_name = "Windows"
else
  print "Unsupported system for sumneko"
end

-- lua
local sumneko_root_path = "/Users/keyv/Unsync/codebases/ClionProjects/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name .. "/lua-language-server"
nvim_lsp.sumneko_lua.setup {
  cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
  on_attach = on_attach,
  settings = {
    Lua = {
      completion = {
        -- keywordSnippet = "Disable";
      },
      runtime = { version = "LuaJIT" },
      diagnostics = {
        enable = true,
        globals = {
          "vim",
          "Color",
          "c",
          "Group",
          "g",
          "s",
          "describe",
          "it",
          "before_each",
          "after_each",
        },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
      },
    },
  },
}

nvim_lsp.sourcekit.setup {
  settings = { serverArguments = { "--completion-server-side-filtering" } },
  on_attach = on_attach,
  cmd = { "xcrun", "sourcekit-lsp" },
  filetypes = { "swift" },
}
nvim_lsp.gopls.setup {
  on_attach = on_attach,
}
nvim_lsp.rust_analyzer.setup {
  on_attach = on_attach,
  settings = {
    ["rust-analyzer"] = {
      assist = {
        importGranularity = "module",
        importPrefix = "by_self",
      },
      cargo = {
        loadOutDirsFromCheck = true,
        allFeatures = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
}
nvim_lsp.clangd.setup {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  init_options = { clangdFileStatus = true },
  on_attach = on_attach,
}

nvim_lsp.dockerls.setup {
  cmd = { "node", "docker-language-server", "--stdio" },
  on_attach = on_attach,
}

nvim_lsp.cmake.setup {
  cmd = {
    "node",
    "cmake-language-server",
    "--stdio",
  },
  on_attach = on_attach,
}

nvim_lsp.bashls.setup { on_attach = on_attach }

nvim_lsp.pyright.setup {
  settings = {
    python = {
      pythonPath = "python3",
      analysis = {
        disableOrganizeImports = false,
      },
    },
  },
  on_attach = on_attach,
}

nvim_lsp.vimls.setup { on_attach = on_attach }
nvim_lsp.denols.setup { on_attach = on_attach }
nvim_lsp.texlab.setup {
  filetypes = { "tex", "bib", "plaintex" },
  settings = {
    forwardSearch = { args = { "%l", "%p", "%f" } },
    chktex = { onEdit = true, onOpenAndSave = true },
    lint = { onChange = true },
  },
  on_attach = on_attach,
}

nvim_lsp.yamlls.setup {}
nvim_lsp.diagnosticls.setup {}
nvim_lsp.tsserver.setup {}
nvim_lsp.zeta_note.setup {
  cmd = { "/Users/keyv/.local/bin/zeta-note" },
}
