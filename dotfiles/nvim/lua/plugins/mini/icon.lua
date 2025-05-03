return {
  "echasnovski/mini.icons",
  version = false,
  event = "VeryLazy",  -- Load during idle time after startup
  config = function()
    require("mini.icons").setup()
  end,
}

