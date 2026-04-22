vim.pack.add({
  -- UI
  {src='https://github.com/ellisonleao/gruvbox.nvim'},
  {src='https://github.com/nvim-tree/nvim-web-devicons'},
  {src='https://github.com/nvim-lualine/lualine.nvim'},
  -- Git
  {src='https://github.com/tpope/vim-fugitive'},
  {src='https://github.com/lewis6991/gitsigns.nvim'},
  -- LSP/Treesitter
  {src='https://github.com/mason-org/mason.nvim'},
  {src='https://github.com/romus204/tree-sitter-manager.nvim'},
  {src='https://github.com/neovim/nvim-lspconfig'},
  -- Telescope
  {src='https://github.com/nvim-telescope/telescope.nvim', version = 'v0.2.1'},
  {src='https://github.com/nvim-lua/plenary.nvim'},
  {src='https://github.com/nvim-telescope/telescope-smart-history.nvim'},
  {src='https://github.com/nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
  {src='https://github.com/nvim-telescope/telescope-ui-select.nvim'},
  {src='https://github.com/kkharji/sqlite.lua'},
  -- Lint & Format
  {src='https://github.com/mfussenegger/nvim-lint'},
  {src='https://github.com/stevearc/conform.nvim'},
})
