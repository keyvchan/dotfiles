local nvim_lsp = require('nvim_lsp')
local diagnostic = require('diagnostic')
local completion = require('completion')
local lsp_status = require('lsp-status')

local chain_complete_list = {
  default = {
    {complete_items = {'lsp', 'snippet'}},
    {complete_items = {'path'}, triggered_only = {'/'}},
    {complete_items = {'buffers'}},
  },
  string = {
    {complete_items = {'path'}, triggered_only = {'/'}},
  },
  comment = {},
}

local on_attach = function(client)

  diagnostic.on_attach()
  -- passing in a table with on_attach function
  completion.on_attach(
	    {
			 sorting = 'alphabet',
			 matching_strategy_list = {'exact', 'fuzzy'},
			 chain_complete_list = chain_complete_list,
		}
	)
	lsp_status.on_attach(client)
end

nvim_lsp.sourcekit.setup {
	on_attach = on_attach;
	cmd = {"sourcekit-lsp"};
	filetypes = {"swift"};
}
nvim_lsp.gopls.setup{
	on_attach = on_attach;
}
nvim_lsp.rust_analyzer.setup{
	on_attach = on_attach,
	callbacks = lsp_status.extensions.clangd.setup(),
	init_options = {
		clangdFileStatus = true
	},
	capabilities = lsp_status.capabilities
}
nvim_lsp.clangd.setup{
	on_attach = on_attach;
}
nvim_lsp.sumneko_lua.setup{
  on_attach= on_attach;
  settings = {
    Lua = {
      completion = {
        keywordSnippet = "Disable";
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
}
nvim_lsp.dockerls.setup{
	on_attach = on_attach;
}
nvim_lsp.cmake.setup{
	on_attach = on_attach;
}
nvim_lsp.bashls.setup{
	on_attach = on_attach;
}
nvim_lsp.pyls_ms.setup{
	on_attach = on_attach;
}
nvim_lsp.vimls.setup{
	on_attach = on_attach;
}
nvim_lsp.tsserver.setup{
	on_attach = on_attach;
}

