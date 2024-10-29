return {
  -- add rose-pine
  {
    -- "rose-pine/neovim",
    "EdenEast/nightfox.nvim",
    -- name = "rose-pine",
    name = "carbonfox",
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
      colorscheme = "carbonfox",
    },
  },
}
