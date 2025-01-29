return {
  {
    -- "folke/tokyonight.nvim",
    -- "nyoom-engineering/oxocarbon.nvim",
    "rose-pine/neovim",
    lazy = false,
    priority = 1000,
    config = function()
      require("rose-pine").setup({
        styles = {
          transparency = true, -- Enable transparency
        },
      })
    end,
  },
  -- Configure LazyVim to load rose-pine
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
