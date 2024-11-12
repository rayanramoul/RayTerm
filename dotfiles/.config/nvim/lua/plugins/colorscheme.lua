return {
  -- add rose-pine
  {
    "rose-pine/neovim",
    name = "rose-pine",
    options = {
      transparent = true,
    },
    -- opts = {
    --   variant = "auto",
    --   dark_variant = "main",
    --   styles = {
    --     transparency = true,
    --   },
    -- },
  },
  -- Configure LazyVim to load rose-pine
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "rose-pine",
    },
  },
}
