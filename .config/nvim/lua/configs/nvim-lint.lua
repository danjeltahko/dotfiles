-- https://github.com/mfussenegger/nvim-lint
-- Linting configuration using nvim-lint
local lint = require "lint"
-- local parser = require "lint.parser"

lint.linters_by_ft = {
  python = { "ruff", "pylint" },
  go = { "golangcilint" },
}

lint.linters.pylint.args = {
  "-f",
  "json",
  "--from-stdin",
  "--disable=import-error",
  "--disable=missing-module-docstring",
  "--disable=line-too-long",
  function()
    return vim.api.nvim_buf_get_name(0)
  end,
}

-- Create autocommand to run linting
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "TextChanged", "InsertLeave" }, {
  callback = function()
    lint.try_lint()
  end,
})

return {}

