local plugins = {
  {
    "christoomey/vim-tmux-navigator",
    lazy=false,
  },
  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    },

    config = function()
      require("chatgpt").setup()
    end,
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {"python", "javascript", "typescript", "html", "css", "json"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "mypy",
        "ruff",
        "pyright",
        "black",
        "prettier",
        "dockerfile-language-server",
        "groovy-language-server",
        "html-lsp",
        "css-lsp",
        "eslint-lsp",
        "typescript-language-server",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "renerocksai/telekasten.nvim",
    dependencies = {"nvim-telescope/telescope.nvim"},

    config = function ()
      require("telekasten").setup({
        home = vim.fn.expand("~/zettelkasten"),
      })
    end,
  },
  {
    'toppair/peek.nvim',
    event = { "BufRead", "BufNewFile" },
    build = "deno task --quiet build:fast",
    config = function()
      require('peek').setup({
        auto_load = true,
        close_on_bdelete = true,
        syntax = true,
        theme = 'dark',
        update_on_change = true,
        app = { '/Applications/Google Chrome.app/Contents/MacOS/Google Chrome', '--new-window' },
        filetype = { 'markdown', "html" },
        throttle_at = 200000,
        throttle_time = 'auto',
      })
      vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
      vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})
    end,
  },
  {
    "turbio/bracey.vim",
    cmd = {"Bracey", "BraceyStop", "BraceyReload", "BraceyEval"},
    config = function()
      vim.g.bracey_refresh_on_save = 1
      vim.g.bracey_auto_start_browser = 1
    end
  },
}
return plugins
