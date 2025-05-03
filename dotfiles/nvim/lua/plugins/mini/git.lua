return {
  "echasnovski/mini-git",
  version = false,
  main = "mini.git",
  event = "BufReadPost",  -- Lazy-load after opening a buffer
  config = function()
    require("mini.git").setup()
  end,
}
