require("conform").setup({
  formatters_by_ft = {
    python = { "isort", "black" },
    yaml = { "prettier" },
    lua = { "stylua" },
  },
  format_on_save = function(bufnr)
    local ok_fts = { lua = true }
    if ok_fts[vim.bo[bufnr].filetype] then
      return { timeout_ms = 1000, lsp_fallback = true }
    end
  end,
})

vim.keymap.set("n", "<leader>tf", function()
  require("conform").format({ async = true, lsp_fallback = true })
end)

require("lint").linters_by_ft = {
  yaml       = { "yamllint" },
  dockerfile = { "hadolint" },
  sh         = { "shellcheck" },
  bash       = { "shellcheck" },
  terraform  = {},
  python     = {},
  markdown   = {},
}


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
