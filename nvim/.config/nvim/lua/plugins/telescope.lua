return {
  "nvim-telescope/telescope.nvim",
  tag = "v0.2.1",
  enabled = true,
  dependencies = {
    "nvim-lua/plenary.nvim",
    {"nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-smart-history.nvim",
    "kkharji/sqlite.lua",
  },
  build = "make",
  config = function()
    local telescope = require("telescope")
    local themes = require("telescope.themes")
    local builtin = require("telescope.builtin")

    local data = assert(vim.fn.stdpath"data")
    -- Setup telescope with ui-select extension dropdown theme
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
          path = vim.fs.joinpath(data, "telescope_history.sqlite3"),
          limit = 100,
        },
        ["ui-select"] = {
          themes.get_dropdown {},
        },
      },
    })

    -- Load extensions safely
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "smart_history")
    pcall(telescope.load_extension, "ui-select")

    vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
    vim.keymap.set("n", "<leader>fg",
    function()
      builtin.live_grep
      {
        additional_args = function()
          return {
            "--hidden",
            "--glob", "!.git"
          }
        end
      }
    end,
    { desc = "[F]ind by =G]rep" })
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
    end,
    { desc = "[/] Fuzzily search in current buffer" })
  end,
}
