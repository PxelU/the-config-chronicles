return {
  "mfussenegger/nvim-lint",
  config = function()
    -- Clear all linters by default; configure linters per filetype as needed
    require("lint").linters_by_ft = {}

    -- Optional: You can set up autocommands here to run lint on save or cursor hold
    -- vim.api.nvim_create_autocmd({ "BufWritePost", "CursorHold" }, {
    --   callback = function()
    --     require("lint").try_lint()
    --   end,
    -- })
  end,
}
