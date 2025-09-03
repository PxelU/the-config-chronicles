return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- Update parsers on install/update
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = {
        enable = true,
      },
    })
  end,
}
