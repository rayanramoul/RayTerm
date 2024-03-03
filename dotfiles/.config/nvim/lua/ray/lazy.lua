
return {
  {'nvim-telescope/telescope.nvim', tag = '0.1.3', dependencies = { 'nvim-lua/plenary.nvim' } }, { 'rose-pine/neovim', name = 'rose-pine' }, {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate", 
  config = function ()
      local configs = require("nvim-treesitter.configs")

      configs.setup({
          ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "rust", "typescript", "python"},
          sync_install = false,
          highlight = { enable = true },
          indent = { enable = true },
        })

    end
    },
{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {},
    config = function()
            require("ibl").setup({indent = { highlight = highlight }})
    end,
},
{'andweeb/presence.nvim'},
{"norcalli/nvim-colorizer.lua"},
    {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      -- config
        theme='hyper',
        config={
            header= require('ray.ascii'),
                }
    }
  end,
  dependencies = { {'nvim-tree/nvim-web-devicons'}}
},
    -- lazy.nvim
    {"MunifTanjim/nui.nvim"},
    {"rcarriga/nvim-notify"},
{
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    "rcarriga/nvim-notify",
    }
},
    -- { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    { 'rose-pine/neovim', name = 'rose-pine' }, 
    {'nvim-tree/nvim-tree.lua'},
    {'mfussenegger/nvim-dap'},
    {'terrortylor/nvim-comment'},
    {'nvim-treesitter/nvim-treesitter-context'},
    {'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons'},
    {'liuchengxu/vista.vim'},
    {
        'mfussenegger/nvim-dap-python',
        ft = {'python'},
        dependencies = {
            {
                'mfussenegger/nvim-dap',
                'rcarriga/nvim-dap-ui',
            },
        },
        config = function()
            require('dap-python').setup('~/.pyenv/versions/debugpy/bin/python')
        end,

    },
    {
        'rcarriga/nvim-dap-ui',
        dependencies = {
            {'mfussenegger/nvim-dap'},
        },
        config = function()
            local dap = require('dap')
            local dapui = require('dapui')
            dapui.setup() -- enables the UI
            dap.listeners.after.event_initialized['dapui_config'] = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated['dapui_config'] = function()
                dapui.close()
            end
            dap.listeners.before.event_exited['dapui_config'] = function()
                dapui.close()
            end
        end,
    },
    {'theprimeagen/harpoon'},
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
	{'mbbill/undotree'},
	{'github/copilot.vim'},
    {'andweeb/presence.nvim'},
    -- Fugitive is a Git wrapper so awesome, it should be illegal
	{'tpope/vim-fugitive'},
	{
        'williamboman/mason.nvim',
        opts = {
            ensure_installed = {
            "eslint",
            "prettier",
            "black",
            "cmake",
            "pyright",
            "svelte",
           "tsls",
            "debugpy",
            "flake8",
            "black",
            "python-lsp-server",
            "isort",
            },
        },
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
      end,
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
    {'averms/black-nvim'},
    {'mfussenegger/nvim-lint'},
	{'williamboman/mason-lspconfig.nvim'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'lukas-reineke/lsp-format.nvim', dependencies = {'neovim/nvim-lspconfig'}},
    {'simrat39/rust-tools.nvim', ft="rust", dependencies={'neovim/nvim-lspconfig'} },
    {'L3MON4D3/LuaSnip'},
    {'hrsh7th/cmp-path'},
    {'rmagatti/auto-session'},
    {'nvim-lualine/lualine.nvim'},
    {'kmontocam/nvim-conda'},
    {'gelguy/wilder.nvim'},
    {'lewis6991/gitsigns.nvim'},
    {
        "nvimdev/guard.nvim",
    -- Builtin configuration, optional
        dependencies = {
        "nvimdev/guard-collection",
    }
    },
    {'hrsh7th/cmp-cmdline'},
    {'christoomey/vim-tmux-navigator', lazy=false},
    { "aserowy/tmux.nvim",
    config = function() return require("tmux").setup() end
    }, 
    {
        "kdheepak/lazygit.nvim",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
      "karb94/neoscroll.nvim",
      config = function ()
        require('neoscroll').setup {}
      end
    },
    {"ahmedkhalf/project.nvim",
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
    {'nvim-tree/nvim-web-devicons'},
    },
    {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    opts = {} -- this is equalent to setup({}) function
},
    {"windwp/nvim-ts-autotag"},
    {"MunifTanjim/prettier.nvim"},
    {'ggandor/leap.nvim'},
    {
        'kkoomen/vim-doge',
        config = function()
            vim.cmd('call doge#install()')
        end,
    },
    {'onsails/lspkind.nvim'},
    {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
    },
    {
      "roobert/tailwindcss-colorizer-cmp.nvim",
      -- optionally, override the default options:
      config = function()
        require("tailwindcss-colorizer-cmp").setup({
          color_square_width = 2,
        })
      end
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
    {'sindrets/diffview.nvim'},
    {'ErichDonGubler/lsp_lines.nvim'},
    {
      "folke/todo-comments.nvim",
      dependencies = { "nvim-lua/plenary.nvim" },
      opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    },
    {'m-demare/hlargs.nvim'},
    {'richardbizik/nvim-toc'},--  TOC: Table of Content generator
    {
    "ziontee113/icon-picker.nvim",
        config = function()
            require("icon-picker").setup({ disable_legacy_commands = true })

            local opts = { noremap = true, silent = true }

            vim.keymap.set("n", "<Leader><Leader>i", "<cmd>IconPickerNormal<cr>", opts)
            vim.keymap.set("n", "<Leader><Leader>y", "<cmd>IconPickerYank<cr>", opts) --> Yank the selected icon into register
            vim.keymap.set("i", "<C-i>", "<cmd>IconPickerInsert<cr>", opts)
        end
    },
    {'edluffy/hologram.nvim', { }},
    {
      "HakonHarnes/img-clip.nvim",
      event = "BufEnter",
      opts = {
        -- add options here
        -- or leave it empty to use the default settings
      },
      keys = {
        -- suggested keymap
        { "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste clipboard image" },
      }
    },
}


