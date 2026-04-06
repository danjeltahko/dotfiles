-- Formatting configuration using conform.nvim
local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format" },
    rust = { "rustfmt", lsp_format = "fallback" },
    css = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    go = { "gofmt" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

return options

