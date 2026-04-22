require("mason").setup({})

vim.filetype.add({
  extension = {
    gotmpl = "gotmpl",
  },
  pattern = {
    [".*/templates/.*%.tpl"] = "helm",
    [".*/templates/.*%.ya?ml"] = "helm",
    ["helmfile.*%.ya?ml"] = "helm",
  },
})
vim.treesitter.language.register("gotmpl", "helm")

vim.lsp.config("helm_ls", {
  cmd = { "helm_ls", "serve" },
  filetypes = { "helm" },
  settings = {
    ["helm-ls"] = {
      logLevel = "info",
      valuesFiles = {
        mainValuesFile = "values.yaml",
        additionalValuesFilesGlobPattern = "values*.yaml",
      },
      yamlls = {
        enabled = true,
        diagnosticsLimit = 50,
        showDiagnosticsDirectly = false,
        path = "yaml-language-server",
      },
    },
  },
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = { checkThirdParty = false },
    },
  },
})
vim.lsp.config("yamlls", {
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

vim.lsp.enable({
  "ansiblels",
  "bashls",
  "dockerls",
  "gopls",
  "lua_ls",
  "pyright",
  "terraformls",
  "yamlls",
  "gitlab_ci_ls",
  "jinja_lsp",
  "helm_ls",
})
