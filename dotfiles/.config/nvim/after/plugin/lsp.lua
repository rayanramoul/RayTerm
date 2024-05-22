local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.configure('gdscript', {
    force_setup = true, -- because the LSP is global. Read more on lsp-zero docs about this.
    single_file_support = true,
    -- cmd = {'ncat', '127.0.0.1', '6008'}, -- the important trick for Windows!
    -- root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
    filetypes = { 'gd', 'gdscript', 'gdscript3' }
})



-- Fix Undefined global 'vim'
-- lsp.nvim_workspace()
-- lsp.setup_servers({'lua_ls', 'rust_analyzer', 'tsserver', "anakinls" })
require('lspconfig').eslint.setup({
    --- ...
    on_attach = function(client, bufnr)
        vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
        })
    end,
})
require('lspconfig').lua_ls.setup({})
require('lspconfig').tsserver.setup({})
require('lspconfig').html.setup({})
require('lspconfig').dockerls.setup({})
require('lspconfig').cssls.setup({
    capabilities = capabilities,
})

local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)



local rust_tools = require('rust-tools')

rust_tools.setup({
    server = {
        on_attach = function(_, bufnr)
            vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, { buffer = bufnr })
        end
    }
})
-- require('lspconfig').anakin_language_server.setup{}
require('lspconfig').pyright.setup {
    settings = {
        pyright = { autoImportCompletion = true, },
    }
}
require('lspconfig').ruff_lsp.setup {
    init_options = {
        settings = {
            -- Any extra CLI arguments for `ruff` go here.
            args = {},
        }
    }
}


-- YAML SCHEMES
require('lspconfig').yamlls.setup {
    settings = {
        yaml = {
            schemas = {
                ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
                ["https://gitlab.com/gitlab-org/gitlab/-/raw/master/app/assets/javascripts/editor/schema/ci.json"] = ".gitlab-ci.yml"
            },
        },
    }
}
local cmp = require('cmp')


local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<S-Tab>'] = cmp.mapping.select_prev_item(cmp_select),
    -- ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    -- ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
    ['<Tab>'] = cmp.mapping(function(fallback)
        if cmp.visible() then
            cmp.select_next_item()
        elseif require('luasnip').expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes('<Plug>luasnip-expand-or-jump', true, true, true), '')
        elseif vim.b._copilot_suggestion ~= nil then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes(vim.fn['copilot#Accept'](), true, true, true), '')
        else
            fallback()
        end
    end, {
        'i',
        's',
    }),
    -- ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' },
        { name = 'path' }
    }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
        { name = 'path' }
    }, {
        {
            name = 'cmdline',
            option = {
                ignore_cmds = { 'Man', '!' }
            }
        }
    })
})

-- THEMING CMP
local lspkind = require('lspkind')
cmp.setup({
    mapping = cmp_mappings,
    window = {
        documentation = cmp.config.window.bordered(),
        completion = {
            winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
            col_offset = -3,
            side_padding = 0,
            border = 'rounded',
            scrollbar = '║',
        },
    },
    formatting = {
        fields = { "kind", "abbr", "menu" },
        format = function(entry, vim_item)
            local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            local strings = vim.split(kind.kind, "%s", { trimempty = true })
            kind.kind = " " .. (strings[1] or "") .. " "
            kind.menu = "    (" .. (strings[2] or "") .. ")"

            return kind
        end,
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "path" },
        { name = "luasnip" },
        { name = "nvim_lua" },
    }
})

-- AUTO COMPLETION
-- cmp_mappings['<Tab>'] = nil
-- cmp_mappings['<S-Tab>'] = nil

-- lsp.setup_nvim_cmp({
--   mapping = cmp_mappings
-- })

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})


local function quickfix()
    vim.lsp.buf.code_action({
        filter = function(a) return a.isPreferred end,
        apply = true
    })
end


lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    -- vim.keymap.set("n", "gr", "<cmd>Telescope lsp_definitions<cr>", opts)
    -- vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    -- feed lsp.buf.references() to telescope
    vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
    --  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<leader>qf', quickfix, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
