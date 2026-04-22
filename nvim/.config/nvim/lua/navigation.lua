local themes = require("telescope.themes")
local builtin = require("telescope.builtin")
local telescope = require("telescope")

telescope.setup({
  pickers = {
    find_files = {
      hidden = true,
    },
  },
  extensions = {
    warp_results = true,
    fzf = {},
    history = {
      path = vim.fs.joinpath(vim.fn.stdpath("data"), "telescope_history.sqlite3"),
      limit = 100,
    },
    ["ui-select"] = {
      themes.get_dropdown({}),
    },
  },
})
telescope.load_extension("fzf")
telescope.load_extension("smart_history")
telescope.load_extension("ui-select")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
vim.keymap.set("n", "<leader>fg", function()
  builtin.live_grep({
    additional_args = function()
      return {
        "--hidden",
        "--glob",
        "!.git",
      }
    end,
  })
end, { desc = "[F]ind by =G]rep" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "[F]ind [H]elp" })
vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })
vim.keymap.set("n", "<leader>en", function()
  builtin.find_files({ cwd = vim.fn.stdpath("config") })
end, { desc = "[E]dit [N]eovim files" })
vim.keymap.set("n", "<leader>/", function()
  builtin.current_buffer_fuzzy_find(themes.get_dropdown({
    winblend = 10,
    previewer = false,
  }))
end, { desc = "[/] Fuzzily search in current buffer" })
