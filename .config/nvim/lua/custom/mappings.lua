local M = {}

M.general = {

  i = {
    ["jj"] = { "<ESC>", "Escape insert mode"},
  },

  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "window left"},
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "window right"},
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "window down"},
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "window up"},
    -- ChatGPT related
    ["<leader>gpt"] = { "<cmd> :ChatGPT <CR>", "Open up ChatGPT chat window" },
    ["<leader>gpti"] = { "<cmd> :ChatGPTEditWithInstructions <CR>", "Open up ChatGPT to edit code"},
    -- Peek.nvim related
    ["<leader>P"] = { "<cmd> PeekOpen<CR>", "Open markdown preview"},
    ["<leader>O"] = { "<cmd> PeekClose<CR>", "Close markdown preview"},

    ["E"] = { "$", "Move to end of line" },
    ["B"] = { "^", "Move to beginning of line" },
  },

}

return M
