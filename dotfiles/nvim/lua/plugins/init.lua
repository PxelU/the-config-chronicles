return {
  -- UI plugins
  { import = "plugins.ui" },

  -- LSP plugins and configs
  { import = "plugins.lsp" },

  -- Mini plugins
  { import = "plugins.mini" },

  -- Other individual plugins
  { "stevearc/conform.nvim" },
  { "mfussenegger/nvim-lint" },
  { "nvim-telescope/telescope.nvim" },
  { "nvim-treesitter/nvim-treesitter" },
}
