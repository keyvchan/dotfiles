require("telescope").setup {
  defaults = {
    color_devicons = true,
    prompt_prefix = "🔍 ",
    file_ignore_patterns = {
      -- git
      ".git/.*", -- rust
      "target/.*",
    },
  },
}
