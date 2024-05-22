vim.g.mapleader = " "

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
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>q", [["_d]])

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

-- Execute main project file
vim.keymap.set("n", "<leader>x", "<cmd>silent !tmux split-window -v executioner<CR>")
-- Execute tests of actual project
vim.keymap.set("n", "<leader>t", "<cmd>silent !tmux split-window -v executioner -t<CR>")
-- Disable arrows movement
vim.keymap.set('', '<Up>', '<Nop>')
vim.keymap.set('', '<Down>', '<Nop>')
vim.keymap.set('', '<Left>', '<Nop>')
vim.keymap.set('', '<Right>', '<Nop>')

vim.keymap.set("n", "<C-h>", "<cmd><C-U>TmuxNavigateLeft<cr>")
vim.keymap.set("n", "<C-j>", "<cmd><C-U>TmuxNavigateDown<cr>")
vim.keymap.set("n", "<C-k>", "<cmd><C-U>TmuxNavigateUp<cr>")
vim.keymap.set("n", "<C-l>", "<cmd><C-U>TmuxNavigateRight<cr>")
vim.keymap.set("n", "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>")


vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")

-- Remap ; to :
vim.keymap.set("n", ";", ":")



-- Remap <C-s>
vim.keymap.set("n", "<C-s>", "<cmd>w<CR>")


-- Fugitive
vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>p", function()
    vim.cmd.Git('push')
end, opts)

-- rebase always
vim.keymap.set("n", "<leader>P", function()
    vim.cmd.Git({ 'pull', '--rebase' })
end, opts)

-- add current project
vim.keymap.set("n", "<leader>gA", function()
    vim.cmd.Git('add %')
end, opts)

-- add all
vim.keymap.set("n", "<leader>ga", function()
    vim.cmd.Git('add .')
end, opts)

-- commit
vim.keymap.set("n", "<leader>gc", function()
    vim.cmd.Git('commit')
end, opts)

-- NOTE: It allows me to easily set the branch i am pushing and any tracking
-- needed if i did not set the branch up correctly
vim.keymap.set("n", "<leader>t", ":Git push -u origin ", opts);

-- Refactoring keybinds
vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set("n", "<leader>rI", ":Refactor inline_func")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

vim.keymap.set('n', '<leader>/', function()
    -- You can pass additional configuration to Telescope to change the theme, layout, etc.
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
    })
end, { desc = '[/] Fuzzily search in current buffer' })



-- Add visual keymap so that when in visual mode, selected text get searched globally
vim.keymap.set("v", "*", ":<C-u>call VisualSelection('f')<CR>", { noremap = true, silent = true })


-- Add keymap to go back to previous buffer with backspace
vim.keymap.set("n", "<BS>", "<C-o>")
