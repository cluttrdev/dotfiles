local null_ls = require("null-ls")

local sources = {
    null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.formatting.black,
}

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
null_ls.setup({
    sources = sources,

    -- Formatting on buffer write
    on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = augroup,
                buffer = bufnr,
                callback = function()
                    vim.lsp.buf.format({ async = false })
                end,
            })
        end
    end
})

-- use mason-null-ls to auto install registered sources
require("mason-null-ls").setup({
    ensure_installed = nil,  -- primary source of truth is null-ls
    automatic_installation = true,
})
