-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "chadracula",
}

M.ui = {
  statusline = {
    theme = "default",
    separator_style = "block",
    order = {
      "mode",
      "file",
      "git",
      "%=",
      "lsp_msg",
      "%=",
      "diagnostics",
      "lsp",
      "cursor",
      "cwd",
    },
  },
}

M.nvdash = {
  load_on_startup = true,
  header = {
    "        .-.                   ",
    "       /_ _\\                  ",
    "       |o^o|                  ",
    "       \\ _ /                  ",
    "      .-'-'-.                 ",
    "    /`)  .  (`\\               ",
    "   / /|.-'-.|\\ \\              ",
    '   \\ \\| (_) |/ /  .-""-.      ',
    "    \\_\\'-.-'/_/  /[] _ _\\     ",
    "    /_/ \\_/ \\_\\ _|_o_LII|_    ",
    "      |'._.'|  / | ==== | \\   ",
    "      |  |  |  |_| ==== |_|   ",
    '       \\_|_/    ||" ||  ||    ',
    "       |-|-|    ||LI  o ||    ",
    "       |_|_|    ||'----'||    ",
    "      /_/ \\_\\  /__|    |__\\   ",
    "                              ",
    "                              ",
  },
  buttons = {
    { txt = "  Find File", keys = "ff", cmd = "Telescope find_files" },
    { txt = "  Recent Files", keys = "fo", cmd = "Telescope oldfiles" },
    { txt = "󰈭  Find Word", keys = "fw", cmd = "Telescope live_grep" },
    -- { txt = "󱥚  Themes", keys = "th", cmd = ":lua require('nvchad.themes').open()" },
    -- { txt = "  Mappings", keys = "ch", cmd = "NvCheatsheet" },
    --
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashFooter",
      no_gap = true,
    },
    { txt = "─", hl = "NvDashFooter", no_gap = true, rep = true },
  },
}

return M
