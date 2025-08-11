return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.8",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "BurntSushi/ripgrep",
    "nvim-telescope/telescope-fzf-native.nvim",
  },
  build = "make",
  config = function()
    local telescope = require("telescope")
    local themes = require("telescope.themes")
    local builtin = require("telescope.builtin")

    -- Setup telescope with ui-select extension dropdown theme
    telescope.setup({
      extensions = {
        ["ui-select"] = {
          themes.get_dropdown(),
        },
      },
    })

    -- Load extensions safely
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "ui-select")

    -- Keymaps for Telescope builtin functions
--    vim.keymap.set("n", "<leader>sf", builtin.find_files, { desc = "[S]earch [F]iles" })
--   vim.keymap.set("n", "<leader>sg", builtin.live_grep, { desc = "[S]earch by [G]rep" })
--    vim.keymap.set("n", "<leader><leader>", builtin.buffers, { desc = "Find existing buffers" })
--    vim.keymap.set("n", "<leader>sn", function()
--      builtin.find_files({ cwd = vim.fn.stdpath("config") })
--    end, { desc = "[S]earch [N]eovim files" })
--    vim.keymap.set("n", "<leader>/", function()
--      builtin.current_buffer_fuzzy_find(themes.get_dropdown({
--        winblend = 10,
--        previewer = false,
--      }))
--    end, { desc = "[/] Fuzzily search in current buffer" })
  end,
}

