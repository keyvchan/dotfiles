require("lsp.keymap")
require("lsp.appearance")

require("lsp.formatter")

local util = require("lspconfig.util")
local configs = require("lspconfig.configs")

-- configs.tsls = {
-- 	default_config = {
-- 		cmd = { "/Users/keyv/Codebases/ClionProjects/tsls/target/debug/tsls" },
-- 		filetypes = { "c" },
-- 		root_dir = util.find_git_ancestor,
--
-- 		single_file_support = true,
-- 	},
-- }
-- require("lspconfig").tsls.setup({})

require("lsp.formatter")
