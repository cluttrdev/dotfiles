vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
    pattern = "*/templates/*.yaml,*/templates/*.tpl",
    callback = function() vim.opt_local.filetype = "helm" end
})

require("mason").setup()

require("mason-lspconfig").setup({
    ensure_installed = {
        "ansiblels",
        "bashls",
        "bufls",
        -- "clangd",
        -- "csharp_ls",
        "cssls",
        "dockerls",
        "gopls",
        "html",
        -- "helm_ls",
        "jsonls",
        "tsserver",
        "lua_ls",
        "marksman",
        "terraformls",
        "yamlls",
    },

    automatic_installation = true,
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

    if client.supports_method("textDocument/formatting") then
        vim.keymap.set("n", "gf", function() vim.lsp.buf.format() end, opts)
    end
end

local lspconfig = require("lspconfig")

local servers_with_default_config = {
    "ansiblels",
    "bashls",
    "bufls",
    -- "clangd",
    "csharp_ls",
    "cssls",
    "dockerls",
    "gopls",
    "html",
    -- "helm_ls",
    "jsonls",
    "tsserver",
    "marksman",
    "terraformls",
    "yamlls",
}

for _, server_name in ipairs(servers_with_default_config) do
    lspconfig[server_name].setup({
        on_attach = lsp_attach,
        capabilities = lsp_capabilities,
    })
end

lspconfig["csharp_ls"].setup({
    on_attach = function(client, bufnr)
        lsp_attach(client, bufnr)

        -- Disable semantic highlighting (results in errors for omnisharp (only?))
        client.server_capabilities.semanticTokensProvider = nil
    end,
    capabilities = lsp_capabilities,
})

lspconfig["lua_ls"].setup({
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

lspconfig["pyright"].setup({
    on_attach = lsp_attach,
    capabilities = lsp_capabilities,
    settings = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    },
})

