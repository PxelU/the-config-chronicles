require("conform").setup({
  formatters_by_ft = {
    python = { "isort", "black" },
    yaml = { "prettier" },
    lua = { "stylua" },
  },
})
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})

-- Auto Format on Buffer write
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "*",
--   callback = function(args)
--     require("conform").format({ bufnr = args.buf })
--   end,
-- })
