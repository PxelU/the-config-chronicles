-- init.lua: Entry point for Neovim configuration

-- Load plugin manager and plugins
require("config.lazy")       -- Setup lazy.nvim plugin manager and plugins
require("plugins")           -- Load all plugin configurations

-- Load basic Neovim settings and customizations
require("config.options")        -- General options
require("config.keymaps")        -- Key mappings
require("config.autocommands")  -- Autocommands

-- Notify that config loaded successfully
vim.notify("Neovim config loaded successfully!", vim.log.levels.INFO)
