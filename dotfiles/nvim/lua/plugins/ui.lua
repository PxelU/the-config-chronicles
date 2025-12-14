-- UI: colorscheme, statusline, visual enhancements
-- Keep it minimal - only what improves readability

return { 
  {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    integration = {
      gitsings = true,
      which_key = false
    }
  },
  config = function()
    vim.cmd.colorscheme("catppuccin-mocha")
  end
  },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
      options = {
        theme = "catppuccin"
      }
    }
  },
}
