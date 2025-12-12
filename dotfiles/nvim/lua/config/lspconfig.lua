local servers = {
  bashls     = "bash",
  lua_ls     = "lua",
  pyright    = "python",
  yamlls     = "yaml",
  dockerls   = "docker",
  ansible    = "ansible",
  gitlab_ci_ls = "gitlab",
  gopls      = "go"
}

for server, file in pairs(servers) do
  vim.lsp.config[server] = require("plugins.lsp_configs." .. file)
  vim.lsp.enable(server)
end
