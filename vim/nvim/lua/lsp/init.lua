local nvim_lsp = require('lspconfig')
-- local util = require("lspconfig/util")
-- local diagnostic = require('diagnostic')
local completion = require('completion')
local lsp_status = require('lsp-status')

lsp_status.config({
    status_symbol = " ",
    indicator_info = "‼ ",
    indicator_errors = "✗",
    indicator_hint = "ﯧ ",
    indicator_warnings = " "
})
lsp_status.register_progress()
nvim_lsp.util.default_config.capabilities =
    vim.tbl_extend('keep', nvim_lsp.util.default_config.capabilities or {},
                   lsp_status.capabilities)

vim.lsp.handlers["textDocument/publishDiagnostics"] =
    vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
        -- Enable underline, use default values
        underline = true,
        -- Enable virtual text, override spacing to 4
        virtual_text = {spacing = 4},
        -- Use a function to dynamically turn signs off
        -- and on, using buffer local variables
        -- Disable a feature
        update_in_insert = true

    })

local chain_complete_list = {
    default = {
        default = {
            {complete_items = {'lsp', 'snippet'}},
            {complete_items = {'buffers'}}
        },
        string = {{complete_items = {'path', 'buffers'}}},
        comment = {{completion_items = {'buffers'}}}
    }
}

local on_attach = function(client)

    -- diagnostic.on_attach()
    -- passing in a table with on_attach function
    completion.on_attach({
        sorting = 'alphabet',
        matching_strategy_list = {'exact', 'substring', 'fuzzy', 'all'},
        chain_complete_list = chain_complete_list
        -- completion_enable_auto_hover = 0
        -- completion_enbale_auto_signature = 0
    })

    lsp_status.on_attach(client)

    vim.api.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",
                            {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>",
                            {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "gD",
                            "<cmd>lua vim.lsp.buf.implementation()<CR>",
                            {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "<c-k>",
                            "<cmd>lua vim.lsp.buf.signature_help()<CR>",
                            {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "1gD",
                            "<cmd>lua vim.lsp.buf.type_definition()<CR>",
                            {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>",
                            {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "g0",
                            "<cmd>lua vim.lsp.buf.document_symbol()<CR>",
                            {noremap = true, silent = true})
    vim.api.nvim_set_keymap("n", "gW",
                            "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>",
                            {noremap = true, silent = true})
end

local system_name
if vim.fn.has("mac") == 1 then
    system_name = "macOS"
elseif vim.fn.has("unix") == 1 then
    system_name = "Linux"
elseif vim.fn.has('win32') == 1 then
    system_name = "Windows"
else
    print("Unsupported system for sumneko")
end

-- lua
local sumneko_root_path =
    '/Users/keyv/Unsync/codebase/ClionProjects/lua-language-server'
local sumneko_binary = sumneko_root_path .. "/bin/" .. system_name ..
                           "/lua-language-server"
nvim_lsp.sumneko_lua.setup {
    cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
    on_attach = on_attach,
    settings = {
        Lua = {
            completion = {
                -- keywordSnippet = "Disable";
            },
            runtime = {version = "LuaJIT"},
            diagnostics = {
                enable = true,
                globals = {
                    "vim", "Color", "c", "Group", "g", "s", "describe", "it",
                    "before_each", "after_each"
                }
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {
                    [vim.fn.expand('$VIMRUNTIME/lua')] = true,
                    [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true
                }
            }
        }
    }
}

nvim_lsp.sourcekit.setup {
    settings = {serverArguments = {"--completion-server-side-filtering"}},
    on_attach = on_attach,
    cmd = {"xcrun", "sourcekit-lsp"},
    filetypes = {"swift"}
}
nvim_lsp.gopls.setup {on_attach = on_attach}
nvim_lsp.rust_analyzer.setup {on_attach = on_attach}
nvim_lsp.clangd.setup {
    cmd = {'clangd', '--background-index', "--clang-tidy"},
    init_options = {clangdFileStatus = true},
    on_attach = on_attach
}

nvim_lsp.dockerls.setup {
    cmd = {'node', 'docker-language-server', "--stdio"},
    on_attach = on_attach
}

nvim_lsp.cmake.setup {
    cmd = {'node', 'cmake-language-server', "--stdio"},
    on_attach = on_attach
}

nvim_lsp.bashls.setup {on_attach = on_attach}

-- python
-- nvim_lsp.pyls_ms.setup {
--    cmd = {
--        "dotnet", "exec",
--        "/Users/keyv/Unsync/codebase/RiderProjects/python-language-server/output/bin/Debug/Microsoft.Python.LanguageServer.dll"
--    },
--    init_options = {analysisUpdates = true, asyncStartup = true},
--    settings = {python = {workspaceSymbols = {enabled = true}}},
--    on_attach = on_attach
-- }
nvim_lsp.pyright.setup {on_attach = on_attach}

nvim_lsp.vimls.setup {on_attach = on_attach}
nvim_lsp.tsserver.setup {
    cmd = {'node', 'typescript-language-server', "--stdio"},
    on_attach = on_attach
}
nvim_lsp.denols.setup {on_attach = on_attach}
nvim_lsp.texlab.setup {
    filetypes = {'tex', 'bib', 'plaintex'},
    settings = {
        forwardSearch = {args = {"%l", "%p", "%f"}},
        chktex = {onEdit = true, onOpenAndSave = true},
        lint = {onChange = true}
    },
    on_attach = on_attach
}

nvim_lsp.yamlls.setup {}
