local M = {}

M.setups = {}

M.setups.lua_ls = {
   -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
   on_init = function(client)
      local path = client.workspace_folders[1].name
      if vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc') then
         return
      end

      client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
         runtime = {
            -- Tell the language server which version of Lua you're using
            -- (most likely LuaJIT in the case of Neovim)
            version = 'LuaJIT'
         },
         -- Make the server aware of Neovim runtime files
         workspace = {
            checkThirdParty = false,
            library = {
               vim.env.VIMRUNTIME
            },
         },
      })
   end,
   settings = {
      Lua = {},
   },
}


return {
   {
      "neovim/nvim-lspconfig",
      dependencies = {
         "williamboman/mason.nvim",
         "williamboman/mason-lspconfig.nvim",
         --
         "towolf/vim-helm"  -- syntax highlighting
      },
      config = function()
         -- It's important that you set up the plugins in this order:
         require("mason").setup({})
         require("mason-lspconfig").setup({
            -- Whether servers that are set up (via lspconfig) should be automatically installed if they're not already installed.
            -- This setting has no relation with the `ensure_installed` setting.
            -- Can either be:
            --   - false: Servers are not automatically installed.
            --   - true: All servers set up via lspconfig are automatically installed.
            --   - { exclude: string[] }: All servers set up via lspconfig, except the ones provided in the list, are automatically installed.
            automatic_installation = true,
         })

         local lspconfig = require("lspconfig")
         lspconfig.bashls.setup({})
         lspconfig.clangd.setup({})
         lspconfig.csharp_ls.setup({})
         lspconfig.gopls.setup({})
         lspconfig.graphql.setup({})
         lspconfig.helm_ls.setup({})
         lspconfig.html.setup({})
         lspconfig.lua_ls.setup(M.setups.lua_ls)
         lspconfig.ruff.setup({})
         lspconfig.pyright.setup({})

         vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
               local bufnr = args.buf

               local opts = { buffer = bufnr, remap = false }

               vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
               vim.keymap.set("n", "<leader>ld", function() vim.lsp.buf.definition() end, opts)
               vim.keymap.set("n", "<leader>lD", function() vim.lsp.buf.declaration() end, opts)
               vim.keymap.set("n", "<leader>li", function() vim.lsp.buf.implementation() end, opts)
               vim.keymap.set("n", "<leader>lr", function() vim.lsp.buf.references() end, opts)
               vim.keymap.set("n", "<leader>ln", function() vim.lsp.buf.rename() end, opts)
               vim.keymap.set("n", "<leader>la", function() vim.lsp.buf.code_action() end, opts)
               vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
               vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
               vim.keymap.set("n", "<leader>le", function() vim.diagnostic.open_float() end, opts)
               vim.keymap.set({ "n", "i" }, "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

               local client = vim.lsp.get_client_by_id(args.data.client_id)
               if client == nil then
                  return
               end
               if client.supports_method("textDocument/formatting") then
                  vim.keymap.set({ "n", "v" }, "<leader>lf", function() vim.lsp.buf.format() end, opts)
               end
            end
         })
      end
   },
}
