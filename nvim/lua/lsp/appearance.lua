-- vim.fn.sign_define("LspDiagnosticsSignError", { text = "✗", texthl = "LspDiagnosticsVirtualTextError" })
-- vim.fn.sign_define("LspDiagnosticsSignWarning", { text = "", texthl = "LspDiagnosticsVirtualtextWarning" })
-- vim.fn.sign_define("LspDiagnosticsSignInformation", { text = "‼", texthl = "LspDiagnosticsVirtualtextInformation" })
-- vim.fn.sign_define("LspDiagnosticsSignHint", { text = "ﯧ", texthl = "LspDiagnosticsVirtualTextHint" })

vim.fn.sign_define("DiagnosticSignError", { text = "✗", texthl = "DiagnosticVirtualTextError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = "", texthl = "DiagnosticVirtualTextWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = "‼", texthl = "DiagnosticVirtualTextInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = "ﯧ", texthl = "DiagnosticVirtualTextHint" })
vim.g.diagnostic_enable_virtual_text = 1
vim.g.diagnostic_enable_underline = 1
