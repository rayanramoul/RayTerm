return {
  -- add rose-pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    options = {
      transparent = true,
    },
  },
  -- Configure LazyVim to load rose-pine
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
