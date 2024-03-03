local telescope = require('telescope')

telescope.setup {
    pickers = {
        find_files = {
            hidden = true
        }
    }
}

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<C-p>", "<cmd>lua require'telescope.builtin'.find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<cr>", {})
vim.keymap.set("n", "<leader>pf", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
