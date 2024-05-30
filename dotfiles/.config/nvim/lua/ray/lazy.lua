return {
    { 'nvim-telescope/telescope.nvim', tag = '0.1.3', dependencies = { 'nvim-lua/plenary.nvim' } }, { 'rose-pine/neovim', name = 'rose-pine' }, {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "rust", "typescript", "python" },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
},
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            scope = { show_start = false, show_end = false },
            indent = { tab_char = "▎" }
        }
    },
    { "norcalli/nvim-colorizer.lua",   {} },
    -- lazy.nvim
    -- { "catppuccin/nvim",                         name = "catppuccin", priority = 1000 },
    -- { 'rose-pine/neovim',                        name = 'rose-pine' },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    { 'nvim-tree/nvim-tree.lua' },
    { 'nvim-treesitter/nvim-treesitter-context', {} },
    { 'akinsho/bufferline.nvim',                 version = "*", dependencies = 'nvim-tree/nvim-web-devicons' },
    { 'ThePrimeagen/harpoon' },
    {
        "ThePrimeagen/refactoring.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("refactoring").setup()
        end,
    },
    { 'mbbill/undotree' },
    { 'github/copilot.vim' },
    { 'stevearc/conform.nvim' },
    -- Fugitive is a Git wrapper so awesome, it should be illegal
    {
        'tpope/vim-fugitive', {}
    },
    { 'mfussenegger/nvim-lint' },
    { 'f-person/git-blame.nvim',          {} },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'VonHeikemen/lsp-zero.nvim',        branch = 'v3.x' },
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs and related tools to stdpath for Neovim
            { 'williamboman/mason.nvim',           config = true }, -- NOTE: Must be loaded before dependants
            { 'williamboman/mason-lspconfig.nvim', opt = { automatic_installation = true, } },
            'WhoIsSethDaniel/mason-tool-installer.nvim',

            -- Useful status updates for LSP.
            -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
            { 'j-hui/fidget.nvim', opts = {} },

            -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
            -- used for completion, annotations and signatures of Neovim apis
            { 'folke/neodev.nvim', opts = {} },
        },
    },
    { 'hrsh7th/cmp-nvim-lsp' },
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            "friendly-snippets",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-cmdline",
        },
    },
    { 'simrat39/rust-tools.nvim', ft = "rust", dependencies = { 'neovim/nvim-lspconfig' } },
    { 'hrsh7th/cmp-path' },
    { 'rmagatti/auto-session' },
    { 'nvim-lualine/lualine.nvim' },
    { 'kmontocam/nvim-conda' },
    {
        'gelguy/wilder.nvim',
        config = function()
            modes = { ':', '/', '?' }
        end
    },
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },
    { 'hrsh7th/cmp-cmdline', {} },
    {
        'christoomey/vim-tmux-navigator',
        cmd = {
            "TmuxNavigateLeft",
            "TmuxNavigateDown",
            "TmuxNavigateUp",
            "TmuxNavigateRight",
            "TmuxNavigatePrevious",
        },
        keys = {
            { "<C-h>",  "<cmd><C-U>TmuxNavigateLeft<cr>" },
            { "<C-j>",  "<cmd><C-U>TmuxNavigateDown<cr>" },
            { "<C-k>",  "<cmd><C-U>TmuxNavigateUp<cr>" },
            { "<C-l>",  "<cmd><C-U>TmuxNavigateRight<cr>" },
            { "<C-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
        },
        lazy = false
    },
    {
        "aserowy/tmux.nvim",
        config = function() return require("tmux").setup() end
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {

                sync_root_with_cwd = true,
                respect_buf_cwd = true,
                update_focused_file = {
                    enable = true,
                    update_root = true
                },
            }
        end
    },
    {
        'nvimdev/lspsaga.nvim',
        config = function()
            require('lspsaga').setup({})
        end,
        dependencies = {
            'nvim-treesitter/nvim-treesitter', -- optional
            'nvim-tree/nvim-web-devicons',     -- optional
        },
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
    },
    {
        'ggandor/leap.nvim',
        config = function()
            require('leap').create_default_mappings()
        end,
    },
    { 'onsails/lspkind.nvim' },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
        "chrisgrieser/nvim-puppeteer",
        lazy = false, -- plugin lazy-loads itself. Can also load on filetypes.
    },
    {
        'stevearc/dressing.nvim',
        opts = {},
    },
    {
        'tzachar/highlight-undo.nvim',
        opts = {
        },
    },
    { 'sindrets/diffview.nvim' },
    { 'ErichDonGubler/lsp_lines.nvim' },
    {
        "folke/todo-comments.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        }
    },
    { 'm-demare/hlargs.nvim', {} },
    { 'richardbizik/nvim-toc' }, --  TOC: Table of Content generator
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = '+' },
                    change = { text = '~' },
                    delete = { text = '_' },
                    topdelete = { text = '‾' },
                    changedelete = { text = '~' },
                },
            })
        end,
    },
    { 'akinsho/git-conflict.nvim',    version = "*", config = true },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp"
    },
    { "rafamadriz/friendly-snippets", },
}
