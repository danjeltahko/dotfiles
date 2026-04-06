require("nvchad.configs.lspconfig").defaults()

local servers = {
  "pyright",
  "dockerls",
  "ts_ls",
  "rust_analyzer",
  "sourcekit",
  "html",
  "cssls",
  "gopls",
}
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers

