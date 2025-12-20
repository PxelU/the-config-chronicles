local opt = vim.opt

-- ==========================================================================
-- 1. INDENTATION
-- ==========================================================================
opt.expandtab = true
opt.tabstop = 2
opt.shiftwidth = 2
opt.softtabstop = 2
opt.smartindent = true
opt.breakindent = true

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
