vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt

opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true
opt.breakindent = true
opt.autocomplete = true

opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.showmode = false
opt.termguicolors = true

opt.colorcolumn = "100"

opt.list = true
opt.listchars = { tab = "» ", trail = "·" }

opt.ignorecase = true
opt.smartcase = true
opt.updatetime = 250
opt.timeoutlen = 1000
opt.scrolloff = 8
opt.undofile = true
opt.clipboard = "unnamedplus"

local map = vim.keymap.set

map("n", "<Esc>", "<cmd>nohlsearch<CR>")
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic quickfix" })
map("n", "<space>ae", ":!ansible-vault encrypt %<CR>", { desc = "[A]nsible [E]ncrypt" })
map("n", "<space>ad", ":!ansible-vault decrypt %<CR>", { desc = "[A]nsible [D]ecrypt" })
map("n", "<leader>pl", function()
  vim.pack.update(nil, { offline = true })
end)
map("n", "<leader>pu", function()
  vim.pack.update()
end, { desc = "Pack: Update" })

require("packages")
require("ui")
require("navigation")
require("lsp")
require("quality")
require("treesitter")
