local null_ls = require("null-ls")
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})


null_ls.setup({
    sources = {
        -- null_ls.builtins.formatting.stylua,
        --  null_ls.builtins.diagnostics.mypy,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.diagnostics.ruff,
        -- null_ls.builtins.diagnostics.black,
        -- null_ls.builtins.diagnostics.isort,
        -- null_ls.builtins.diagnostics.ruff,
        -- null_ls.builtins.completion.spell,
    },
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({
                group = augroup,
                buffer = bufnr,
            })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ bufnr = bufnr })
                end,
            })
        end
    end,
})
