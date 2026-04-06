local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- Update all LSP servers with foldingRange capability
-- for _, server in ipairs { "pyright", "dockerls", "ts_ls", "rust_analyzer", "sourcekit", "html", "cssls", "gopls" } do
--   require("lspconfig")[server].setup {
--     capabilities = capabilities,
--   }
-- end

require("ufo").setup {
  provider_selector = function(bufnr, filetype, buftype)
    return { "lsp", "indent" }
  end,
}

-- Keymaps
vim.keymap.set("n", "zR", require("ufo").openAllFolds, { noremap = true })
vim.keymap.set("n", "zM", require("ufo").closeAllFolds, { noremap = true })
vim.keymap.set("n", "zr", require("ufo").openFoldsExceptKinds, { noremap = true })
vim.keymap.set("n", "zm", require("ufo").closeFoldsWith, { noremap = true })

