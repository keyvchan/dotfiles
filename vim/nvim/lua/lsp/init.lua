local nvim_lsp = require('lspconfig')
local util = require("lspconfig/util")
-- local diagnostic = require('diagnostic')
local completion = require('completion')
local lsp_status = require('lsp-status')

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    -- Enable underline, use default values
    underline = true,
    -- Enable virtual text, override spacing to 4
    virtual_text = {
      spacing = 4,
    },
    -- Use a function to dynamically turn signs off
    -- and on, using buffer local variables
    -- Disable a feature
    update_in_insert = true,
  }
)

local chain_complete_list = {
  default = {
    default = {
      {complete_items = {'lsp', 'snippet', 'buffers'}},
    },
    string = {
      {complete_items = {'path', 'buffers'}},
    },
    comment = {
      completion_items = {'buffers'}
    },
  }
}

local capabilities = lsp_status.capabilities
lsp_status.config({
  kind_labels = vim.g.completion_customize_lsp_label,
  select_symbol = function(cursor_pos, symbol)
    if symbol.valueRange then
      local value_range = {
        ['start'] = {character = 0, line = vim.fn.byte2line(symbol.valueRange[1])},
        ['end'] = {character = 0, line = vim.fn.byte2line(symbol.valueRange[2])}
      }

      return util.in_range(cursor_pos, value_range)
    end
  end,
  current_function = false
}
)
lsp_status.register_progress()


local on_attach = function(client)

  -- diagnostic.on_attach()
  -- passing in a table with on_attach function
  completion.on_attach(
  {
    sorting = 'alphabet',
    matching_strategy_list = {'exact', 'substring', 'fuzzy'},
    chain_complete_list = chain_complete_list,
  }
  )
  lsp_status.on_attach(client)

  vim.fn.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "1gD", "<cmd>lua vim.lsp.buf.type_definition()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", {noremap = true, silent = true})
  vim.fn.nvim_set_keymap("n", "gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>", {noremap = true, silent = true})
end


nvim_lsp.sourcekit.setup {
  on_attach = on_attach;
  cmd = {"xcrun", "sourcekit-lsp"};
  filetypes = {"swift"};
  capabilities = capabilities,
}
nvim_lsp.gopls.setup{
  on_attach = on_attach;
  capabilities = capabilities
}
nvim_lsp.rust_analyzer.setup{
  on_attach = on_attach,
  init_options = {
    clangdFileStatus = true
  },
  capabilities = capabilities
}
nvim_lsp.clangd.setup{
  cmd = {'clangd', '--background-index', "--clang-tidy"},
  handlers = lsp_status.extensions.clangd.setup();
  init_options = {
    clangdFileStatus = true
  };
  on_attach = on_attach;
}
nvim_lsp.sumneko_lua.setup{
  on_attach= on_attach;
  settings = {
    Lua = {
      completion = {
        -- keywordSnippet = "Disable";
      };
      runtime = {
        version = "LuaJIT";
      };
      diagnostics={
        enable=true,
        globals={
          "vim", "Color", "c", "Group", "g", "s", "describe", "it", "before_each", "after_each"
        },
      },
    },
  };
  capabilities = capabilities
}
nvim_lsp.dockerls.setup{
  cmd = {'node', 'docker-language-server', "--stdio"},
  on_attach = on_attach;
  capabilities = capabilities
}
nvim_lsp.cmake.setup{
  cmd = {'node', 'cmake-language-server', "--stdio"},
  on_attach = on_attach;
  capabilities = capabilities
}
nvim_lsp.bashls.setup{
  on_attach = on_attach;
  capabilities = capabilities
}
nvim_lsp.pyls_ms.setup{
  handlers = lsp_status.extensions.pyls_ms.setup();
  on_attach = on_attach;
  capabilities = capabilities
}
nvim_lsp.vimls.setup{
  on_attach = on_attach;
  capabilities = capabilities
}
nvim_lsp.tsserver.setup{
  cmd = {'node', 'typescript-language-server', "--stdio"},
  on_attach = on_attach;
  capabilities = capabilities
}
-- nvim_lsp.pyright.setup{
--   cmd = {'node', 'pyright-languageserver', "--stdio"},
--   root_dir = function(fname)
--     return util.root_pattern(".git", "setup.py",  "setup.cfg", "pyproject.toml", "requirements.txt")(fname) or
--       util.path.dirname(fname)
--   end,
--   on_attach = on_attach,
--   capabilities = capabilities
-- }

