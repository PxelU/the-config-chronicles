vim.g.mapleader = ' '

require('packages')
require('ui')
require('lsp')
require('tools')

local opt = vim.opt
local map = vim.keymap.set

-- ==========================================================================
-- 1. INDENTATION
-- ==========================================================================
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true
opt.breakindent = true
opt.autocomplete = true

-- ==========================================================================
-- 2. UI & VISUALS
-- ==========================================================================
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.showmode = false
opt.termguicolors = true

opt.colorcolumn = "100" 

opt.list = true
opt.listchars = {
  tab = "» ",
  trail = "·",
}

-- ==========================================================================
-- 3. BEHAVIOR
-- ==========================================================================
opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.timeoutlen = 1000
opt.scrolloff = 8
opt.undofile = true
opt.clipboard = "unnamedplus"


-- Core editor keymaps (non-plugin specific)
map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<space>ae", ":!ansible-vault encrypt %<CR>", { desc = "[A]nsible [E]ncrypt" })
map("n", "<space>ad", ":!ansible-vault decrypt %<CR>", { desc = "[A]nsible [D]ecrypt" })
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix" })
map("n", "<leader>f", function()
  require("conform").format()
end)
map("n", "<leader>pl", function()
  vim.pack.update (nil, {offline=true})
end)
map("n", "<leader>pu", function()
  vim.pack.update()
end, { desc = "Pack: Update" })

-- Autocommands
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()
    require("lint").try_lint()
  end,
})
