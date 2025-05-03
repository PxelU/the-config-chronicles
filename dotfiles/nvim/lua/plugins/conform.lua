return {
  "stevearc/conform.nvim",
  opts = {}, -- You can pass options here if needed; currently empty
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        lua = { "stylua" },
        python = { "black" },
        -- You can add more filetypes and formatters here
        -- Conform will run multiple formatters sequentially if specified
      },
      -- Optional: you can add other Conform settings here, e.g.:
      -- format_on_save = true,
      -- notify = true,
    })
  end,
}
