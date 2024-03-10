local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.configure('gdscript', {
    force_setup = true, -- because the LSP is global. Read more on lsp-zero docs about this.
    single_file_support = true,
    -- cmd = {'ncat', '127.0.0.1', '6008'}, -- the important trick for Windows!
    -- root_dir = require('lspconfig.util').root_pattern('project.godot', '.git'),
    filetypes = {'gd', 'gdscript', 'gdscript3' }
})
-- lsp.ensure_installed({
--   'tsserver',
--   'rust_analyzer',
-- })

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
require('lspconfig').svelte.setup{}
--require('lspconfig').rust_analyzer.setup{
--  settings = {
--    ['rust-analyzer'] = {
--      diagnostics = {
--        enable = false;
--      }
--    }
--  }
--}
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)



local rust_tools = require('rust-tools')

rust_tools.setup({
  server = {
    on_attach = function(_, bufnr)
      vim.keymap.set('n', '<leader>ca', rust_tools.hover_actions.hover_actions, {buffer = bufnr})
    end
  }
})
-- require('lspconfig').anakin_language_server.setup{}
require('lspconfig').pyright.setup{
    settings = {
        pyright = {autoImportCompletion = true,},
    }
}
require('lspconfig').ruff_lsp.setup{
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
 -- Setup through
 -- pipx install "python-lsp-server[all]"
 -- pipx install python-lsp-isort pylsp-mypy python-lsp-black python-lsp-ruff
require"lspconfig".pylsp.setup {
    filetypes = {"python"},
    settings = {
        -- configurationSources = {"flake8"},
	formatCommand = {"black"},
        pylsp = {
    plugins = {
        -- formatter options
        black = { enabled = true },
        yapf = { enabled = false },
        -- linter options
        pycodestyle = { enabled = true },
        -- type checker
        pylsp_mypy = { enabled = true },
        -- auto-completion options
        jedi_completion = { fuzzy = false, enabled=false},
        -- import sorting
        pyls_isort = { enabled = true },
    },
    },
    }
}
local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
  ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
  -- ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
  ['<Tab>'] = cmp.mapping.select_next_item(cmp_select),
  ['<CR>'] = cmp.mapping.confirm({ select = true }),
  ["<C-Space>"] = cmp.mapping.complete(),
})

-- `/` cmdline setup.
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
        { name = 'buffer' }
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
    { name = 'nvim_lsp' },
    { name = 'buffer' },
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
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
  vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
  vim.keymap.set('n', '<leader>qf', quickfix, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
