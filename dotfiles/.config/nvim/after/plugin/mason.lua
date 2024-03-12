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
        'typescript-language-server',
        'rust-analyzer',
        'eslint-lsp',
        'lua-language-server',
        'html-lsp',
        'dockerfile-language-server',
        'css-language-server',
        'azure-pipelines-language=server',
        'hydra-lsp',
        'pyright',
        'ruff-lsp',
        'yaml-language-server',
        'python-language-server',
            },
    automatic_installation = true,
}
