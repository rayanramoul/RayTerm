require("ray")
local lazypath = vim.fn.stdpath("data" ) .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup(require("ray.lazy", opts))
vim.cmd([[colorscheme rose-pine]])
-- vim.cmd([[colorscheme tokyonight-night]])
-- vim.cmd([[colorscheme catppuccin-mocha]])
vim.api.nvim_set_hl(0, "Normal", {bg = "none"})
vim.api.nvim_set_hl(0, "NormalFloat", {bg = "none"})
