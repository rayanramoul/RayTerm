vim.g.mapleader = " "
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<leader>pv", ":NvimTreeOpen<CR>")
-- this is for move commands, when highlighting we can move the corresponding lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")



vim.keymap.set("n", "J", "mzJ`z")

-- Allow half page jumpings to keep the cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Allows search terms to keep cursor in the middle 
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
-- Allow to copy paste and dont have the buffer reinitialized after pasting
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- interactions with the system copy buffers
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>q", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
-- allo to jump between projects
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quick Fix Navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- Replace the work you are on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- Make the current file executable
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- Execute current file
-- vim.keymap.set("n", "<leader><leader>", function()
--     vim.cmd("so")
-- end)

-- Execute main project file
vim.keymap.set("n", "<leader>x", "<cmd>silent !tmux split-window -v executioner<CR>")
-- Execute tests of actual project
vim.keymap.set("n", "<leader>t", "<cmd>silent !tmux split-window -v executioner -t<CR>")
-- Disable arrows movement
vim.keymap.set('', '<Up>', '<Nop>')
vim.keymap.set('', '<Down>', '<Nop>')
vim.keymap.set('', '<Left>', '<Nop>')
vim.keymap.set('', '<Right>', '<Nop>')


-- Debugger remaps
vim.keymap.set("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
vim.keymap.set("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>")
vim.keymap.set("n", "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>")
vim.keymap.set("n", "<leader>dl", "<cmd>lua require'dap'.run_last()<CR>")
vim.keymap.set("n", "<leader>ds", "<cmd>lua require'dap'.step_over()<CR>")
vim.keymap.set("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>")
vim.keymap.set("n", "<leader>do", "<cmd>lua require'dap'.step_out()<CR>")
vim.keymap.set("n", "<leader>du", "<cmd>lua require'dap'.up()<CR>")
vim.keymap.set("n", "<leader>dd", "<cmd>lua require'dap'.down()<CR>")
vim.keymap.set("n", "<leader>de", "<cmd>lua require'dap'.disconnect()<CR>")
vim.keymap.set("n", "<leader>dk", "<cmd>lua require'dap'.close()<CR>")

-- Mapping for dap ui
vim.keymap.set("n", "<leader>dui", "<cmd>lua require'dapui'.toggle()<CR>")
vim.keymap.set("n", "<leader>duh", "<cmd>lua require'dapui'.hover()<CR>")
vim.opt.colorcolumn = "80"
vim.keymap.set("n", "<leader>duf", "<cmd>lua require'dapui'.float_element()<CR>")


-- Remaps for tmux vim plugin
-- vim.keymap.set("n", "<C-h>", "<cmd>lua require('tmux').move_left()<CR>")
-- vim.keymap.set("n", "<C-j>", "<cmd>lua require('tmux').move_bottom()<CR>")
-- vim.keymap.set("n", "<C-k>", "<cmd>lua require('tmux').move_top()<CR>")
-- vim.keymap.set("n", "<C-l>", "<cmd>lua require('tmux').move_right()<CR>")
-- remap following keys with vim.keymap.set
-- { "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
--             { "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
--             { "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
--             { "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
--             { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
vim.keymap.set("n", "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>")
vim.keymap.set("n", "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>")

-- Remap lazygit.nvim to <leader>gg
vim.keymap.set("n", "<leader>gg", "<cmd>lua require('lazygit').lazygit()<CR>")
vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>")
-- Remap ; to :
vim.keymap.set("n", ";", ":")


-- Doge doc generationv
vim.keymap.set("n", "<leader>doc", '<Plug>(doge-generate)')

-- Remap <C-s>
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")


-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);


-- Refactoring keybinds
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set( "n", "<leader>rI", ":Refactor inline_func")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")
