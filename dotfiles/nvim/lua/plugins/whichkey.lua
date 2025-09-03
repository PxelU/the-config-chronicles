return {
  "folke/which-key.nvim",
  event = "VimEnter",
  config = function()
    local wk = require("which-key")
    require("which-key").setup({})
    require("which-key").add({
      { "<leader>a", group = "[A]nsible" },
      { "<leader>e", group = "[E]dit" },
      { "<leader>f", group = "[F]ind" },
      { "<leader>o", group = "[O]pen Terminal" },
      })
  end,
}

