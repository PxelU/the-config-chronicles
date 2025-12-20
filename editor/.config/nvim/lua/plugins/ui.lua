-- UI: colorscheme, statusline, visual enhancements
-- Keep it minimal - only what improves readability

return { 
  {
  "ellisonleao/gruvbox.nvim",
  name = "gruvebox",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.cmd.colorscheme("gruvbox")
  end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {}
  },
}
