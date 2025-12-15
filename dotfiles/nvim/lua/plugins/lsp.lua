-- LSP: language servers for code intelligence
-- Add servers to ensure_installed, add schemas to yamlls for validation

return {
  {
    "williamboman/mason.nvim",
    opts = {},
  },

  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "ansiblels",
        "bashls",
        "dockerls",
        "gopls",
        "jinja_lsp",
        "lua_ls",
        "pyright",
        "terraformls",
        "yamlls",
      },
    },
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()

      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            diagnostics = { globals = { 'vim' } },
            workspace = { checkThirdParty = false },
          },
        },
      })

      vim.lsp.config('yamlls', {
        settings = {
          yaml = {
            schemas = {
              -- Ansible
              ["https://raw.githubusercontent.com/ansible/schemas/main/f/ansible-tasks.json"] = {
                "**/tasks/*.yml",
                "**/tasks/*.yaml",
                "**/handlers/*.yml",
                "**/handlers/*.yaml",
              },
              ["https://raw.githubusercontent.com/ansible/schemas/main/f/ansible-vars.json"] = {
                "**/vars/*.yml",
                "**/vars/*.yaml",
                "**/defaults/*.yml",
                "**/defaults/*.yaml",
              },
              ["https://raw.githubusercontent.com/ansible/schemas/main/f/ansible-meta.json"] = {
                "**/meta/*.yml",
                "**/meta/*.yaml",
              },
              ["https://raw.githubusercontent.com/ansible/schemas/main/f/ansible-playbook.json"] = {
                "*playbook*.yml",
                "*playbook*.yaml",
              },

              -- CI/CD
              ["https://json.schemastore.org/gitlab-ci.json"] = ".gitlab-ci.yml",
              ["https://json.schemastore.org/github-workflow.json"] = ".github/workflows/*",

              -- Docker Compose
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] = {
                "docker-compose*.yml",
                "docker-compose*.yaml",
                "compose.yml",
                "compose.yaml",
              },

              -- Kubernetes (FluxCD, manifests, CRDs) - put LAST so specific ones win
              kubernetes = {
                "**/k8s/**/*.yaml",
                "**/kubernetes/**/*.yaml",
                "**/manifests/**/*.yaml",
                "deployment*.yaml",
                "service*.yaml",
                "ingress*.yaml",
                "configmap*.yaml",
                "namespace*.yaml",
                "ingressroute*.yaml",
              },
            },
          },
        },
      })
    end,
  },
  {
  vim.filetype.add({
  pattern = {
    ['.*%.sh%.j2$'] = 'jinja.sh'
  },
}),
}
}
