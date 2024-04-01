-- local map = vim.keymap.set
local M = {}

M.dap = {
  plugin = true,
  n = {
    ["<leader>db"] = {
      "<cmd> DapToggleBreakpoint <CR>",
      "Add breakpoint at line",
    },
    ["<leader>dr"] = {
      "<cmd> DapContinue <CR>",
      "Start or continue the debugger",
    }
  }
}

M.general = {
  n = {
    ["<C-a>"] = {
      "ggVG",
      "Select all file",
    }
  }
}

return M
