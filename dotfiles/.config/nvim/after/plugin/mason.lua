require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

require("mason-lspconfig").setup{
    ensure_installed = {
        'rust_analyzer',
        'eslint',
        'lua_ls',
        'html',
        'azure_pipelines_ls',
        'pyright',
        'ruff_lsp',
        'yamlls',
        'pylsp',
            },
    automatic_installation = true,
}
