vim.o.guifont = "Maple Mono,Monaco Nerd Font:h16"
-- vim.g.neovide_transparency = 0
vim.g.neovide_floating_blur_amount_x = 3.0
vim.g.neovide_floating_blur_amount_y = 3.0
vim.keymap.set({ "i", "n" }, "<D-s>", "<cmd>w!<cr>", { noremap = true, silent = true })
-- vim.g.neovide_background_color = "#212223"
-- vim.api.nvim_set_hl(0, "Normal", { bg = "#212223", blend = 40 })
vim.opt.winblend = 20

vim.keymap.set({ "i", "n" }, "<D-v>", "<C-R>+", { noremap = true, silent = true })
require("configs.theme")

vim.keymap.set({ "i", "n" }, "<D-b>", "<cmd>Neotree toggle<cr>", { noremap = true, silent = true })
