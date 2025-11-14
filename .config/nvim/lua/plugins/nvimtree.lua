return {
  "nvim-tree/nvim-tree.lua",
  opts = function()
    -- Get the default options from NvChad
    local config = require "nvchad.configs.nvimtree"

    -- Override git icons
    config.renderer.icons.glyphs.git = {
      unstaged = "✗",
      staged = "✓",
      unmerged = "",
      renamed = "➜",
      untracked = "?", -- Change this to your preferred symbol
      deleted = "",
      ignored = "◌",
    }

    return config
  end,
}
