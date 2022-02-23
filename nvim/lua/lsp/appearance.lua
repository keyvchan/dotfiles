vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticVirtualTextError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticVirtualTextWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "‼", texthl = "DiagnosticVirtualTextInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "ﯧ", texthl = "DiagnosticVirtualTextHint" })
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_enable_underline = 1
