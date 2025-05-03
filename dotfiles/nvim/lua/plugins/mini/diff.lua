return {
  "echasnovski/mini.diff",
  version = false,
  event = "BufReadPost",  -- Lazy-load after buffer read
  config = function()
    require("mini.diff").setup()
  end,
}
