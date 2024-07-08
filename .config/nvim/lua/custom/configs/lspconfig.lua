local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.dockerls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "dockerfile" },
})

lspconfig.groovyls.setup({
  cmd = {"$HOME/.local/share/nvim/mason/packages/groovy-language-server", "--stdio"},
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "groovy", "jenkins" },
})

lspconfig.html.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "html" },
})

lspconfig.cssls.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "css" },
})

lspconfig.tsserver.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "javascript", "typescript" },
})
