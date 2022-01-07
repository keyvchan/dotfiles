vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files)
vim.keymap.set("n", "<leader>lg", require("telescope.builtin").live_grep)

-- lsp stuff
vim.keymap.set("n", "<leader>qf", require("telescope.builtin").quickfix)
vim.keymap.set("n", "<leader>lca", require("telescope.builtin").lsp_code_actions)
vim.keymap.set("n", "<leader>gd", require("telescope.builtin").lsp_definitions)
vim.keymap.set("n", "<leader>gi", require("telescope.builtin").lsp_implementations)
vim.keymap.set("n", "<leader>td", require("telescope.builtin").lsp_type_definitions)
vim.keymap.set("n", "<leader>gr", require("telescope.builtin").lsp_references)

-- extensions
vim.keymap.set("n", "<leader><leader>", require("telescope").extensions.find_pickers.find_pickers)
vim.keymap.set("n", "<leader>fb", require("telescope").extensions.file_browser.file_browser)
