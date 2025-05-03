-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

vim.api.nvim_set_hl(0, "AvanteConflictCurrent", {
    fg = nil,
    bg = "#2ea043", -- soft green (VSCode-like)
  })
  
  vim.api.nvim_set_hl(0, "AvanteConflictIncoming", {
    fg = nil,
    bg = "#6f1313", -- soft red (VSCode-like)
  })
