local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")

local opts = {
  sources = {
    null_ls.builtins.diagnostics.mypy.with({
      extra_args = { "--ignore-missing-imports" },
    }),
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.formatting.black,
    -- Add prettier for html, css, javascript & typescript
    null_ls.builtins.formatting.prettier.with({
      filetypes={"json", "html", "css", "javascript", "typescript"}
    }),
    -- Add ESLint for JavaScript/TypeScript linting
    null_ls.builtins.diagnostics.eslint_d.with({
      filetypes = {"javascript", "typescript"},
    }),
  },
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function ()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
return opts
