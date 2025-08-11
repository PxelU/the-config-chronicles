vim.filetype.add({
  pattern = {
    [".*/ansible%-[^/]+/.+%.ya?ml"] = "yaml.ansible",
  },
})

vim.filetype.add({
  pattern = {
    ['%.gitlab%-ci%.ya?ml'] = "yaml.gitlab",
  },
})
