return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
  },
  config = function()
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "bashls" },  -- add all servers you want
      automatic_installation = true,
    })

    local lspconfig = require("lspconfig")

    -- Setup bashls with config from lsp_configs/bashls.lua
    lspconfig.bashls.setup(require("plugins.lsp_configs.bash"))

    -- Setup lua_ls with config from lsp_configs/lua.lua
    lspconfig.lua_ls.setup(require("plugins.lsp_configs.lua"))
  end,
}

