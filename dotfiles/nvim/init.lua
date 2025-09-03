-- init.lua: Entry point for Neovim configuration
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- Bootstrap lazy.nvim if not installed
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({"git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath,})
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end

vim.opt.rtp:prepend(lazypath)

-- Set leader keys early for correct mappings
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Setup lazy.nvim with plugin specs imported from plugins folder
require("lazy").setup({
  spec = {
    { import = "plugins" },  -- Import plugin specs from lua/plugins/init.lua
  },
  checker = {
    enabled = true,          -- Automatically check for plugin updates
  },
})

-- Loan basic Neovim settings and customizations
--
require("config.options")        -- General options 
require("config.keymaps")        -- Key mappings
require("config.autocommands")  -- Autocommands
require("config.filetypes")  -- Filetypes
require("config.terminal")  -- Terminal
require("config.lspconfig")
