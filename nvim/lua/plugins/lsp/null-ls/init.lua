local M = {
"nvimtools/none-ls.nvim",
  event = "VeryLazy",
}

function M.config()
  local null_ls = require("null-ls")

  require("null-ls").setup({
      debug = true,
    sources = {
      -- formatting
      null_ls.builtins.formatting.black,
      -- null_ls.builtins.formatting.clang_format.with({
      --   filetypes = { "cpp", "c" },
      -- }),
      null_ls.builtins.formatting.stylua,
      null_ls.builtins.formatting.prettierd.with({
        extra_filetypes = { "toml" },
      }),
      null_ls.builtins.formatting.shfmt.with({
        extra_filetypes = { "zsh" },
      }),
      null_ls.builtins.formatting.swiftformat,

      null_ls.builtins.formatting.goimports,

      -- diagnostics
      -- null_ls.builtins.diagnostics.golangci_lint,
      null_ls.builtins.diagnostics.checkmake,

      -- code actions
      null_ls.builtins.hover.dictionary.with({
        extra_filetypes = { "norg", "gitcommit" },
      }),
    },
  })
  require("plugins.lsp.null-ls.formatter")
end

return M
