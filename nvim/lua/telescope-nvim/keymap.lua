local builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", builtin.find_files)
vim.keymap.set("n", "<leader>fg", builtin.git_files)
vim.keymap.set("n", "<leader>lg", builtin.live_grep)

-- lsp stuff
vim.keymap.set("n", "<leader>qf", builtin.quickfix)
vim.keymap.set("n", "<leader>lca", builtin.lsp_code_actions)
vim.keymap.set("n", "gd", builtin.lsp_definitions)
vim.keymap.set("n", "gi", builtin.lsp_implementations)
vim.keymap.set("n", "td", builtin.lsp_type_definitions)
vim.keymap.set("n", "gr", builtin.lsp_references)

-- extensions
vim.keymap.set("n", "<leader><leader>", require("telescope").extensions.find_pickers.find_pickers)
vim.keymap.set("n", "<leader>fb", require("telescope").extensions.file_browser.file_browser)
