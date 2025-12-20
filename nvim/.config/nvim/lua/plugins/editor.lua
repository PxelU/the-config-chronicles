-- Editor enhancements: syntax highlighting, code manipulation
-- Add: treesitter parsers, text objects, code folding, etc.

return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    main = "nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
      auto_install = true,
      highlight = { enable = true },
    },
  },
}
