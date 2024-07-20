return {
  -- add gruvbox
  -- { "rose-pine/neovim" },
  -- { "projekt0n/github-nvim-theme" },
  { "tiagovla/tokyodark.nvim" },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "rose-pine",
      -- colorscheme = "github_dark_default",
      colorscheme = "tokyodark",
    },
  },
}
