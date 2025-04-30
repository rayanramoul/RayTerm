-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
--
-- -- Set clipboard to unnamed

-- Set colorcolumn
vim.api.nvim_set_option("colorcolumn", "120")
vim.opt.textwidth = 120

-- Jump to last edit position on opening file
vim.cmd([[

  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

]])
-- Open Snacks explorer automatically on directory
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    local arg = vim.fn.argv(0)
    if arg and vim.fn.isdirectory(arg) == 1 then
      vim.cmd("cd " .. arg)
      require("snacks").picker.explorer()
    end
  end,
})

vim.g.snacks_animate = false
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
