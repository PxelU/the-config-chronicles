return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- Update parsers on install/update
  -- Optional: lazy-load on buffer read to speed up startup
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html",
      },
      sync_install = false,  -- Install parsers asynchronously
      highlight = {
        enable = true,       -- Enable syntax highlighting
      },
      indent = {
        enable = true,       -- Enable indentation based on treesitter
      },
    })
  end,
}
