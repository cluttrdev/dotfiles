require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "ansiblels",
        "bashls",
        "bufls",
        -- "clangd",
        "omnisharp",
        "cssls",
        "dockerls",
        "gopls",
        "html",
        -- "helm_ls",
        "jsonls",
        "tsserver",
        -- "lua_ls",
        "marksman",
        "pylsp",
        "terraformls",
        "yamlls",
    }
})

local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_attach = function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set('n', 'K', function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi", function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "gn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("n", "ga", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set({"n", "i"}, "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

    -- Disable semantic highlighting (results in errors for omnisharp (only?))
    client.server_capabilities.semanticTokensProvider = nil
end

local lspconfig = require("lspconfig")
require("mason-lspconfig").setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
        })
    end,
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*/templates/*.yaml,*/templates/*.tpl",
    callback = function() vim.opt_local.filetype = "helm" end
})
