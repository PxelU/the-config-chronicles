return {
  {
  "ellisonleao/gruvbox.nvim",
  lazy = false,           -- Load immediately because colorscheme should be ready early
  priority = 1000,        -- High priority to load before other plugins
  enabled = false,
  opts = {
    terminal_colors = true,
    undercurl = true,
    underline = true,
    bold = true,
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = false,
      folds = true,
    },
    strikethrough = true,
    invert_selection = false,
    invert_signs = false,
    invert_tabline = false,
    invert_intend_guides = false,
    inverse = true,
    contrast = "",
    palette_overrides = {},
    overrides = {},
    dim_inactive = false,
    transparent_mode = false,
  },
  config = function(_, opts)
    require("gruvbox").setup(opts)  -- Setup gruvbox with options
    vim.cmd.colorscheme("gruvbox")   -- Apply the colorscheme
  end,
},
  {
    "rebelot/kanagawa.nvim",
    lazy = false,           -- Load immediately because colorscheme should be ready early
    priority = 1000,        -- High priority to load before other plugins
    enabled = true,
    config = function()
      require("kanagawa").setup()
      local hour = tonumber(os.date("%H"))

      if hour >= 8 and hour < 18 then
        vim.cmd("colorscheme kanagawa-wave")
      else
        vim.cmd("colorscheme kanagawa-dragon")
      end
    end
  }
}

