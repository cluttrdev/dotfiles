return {
   {
      "hrsh7th/nvim-cmp",
      dependencies = {
         "hrsh7th/cmp-nvim-lsp",
         "hrsh7th/cmp-nvim-lsp-signature-help",
         "hrsh7th/cmp-buffer",
      },
      config = function()
         local cmp = require("cmp")

         cmp.setup({
            snippet = {
               -- REQUIRED - you must specify a snippet engine
               expand = function(args)
                  vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
               end,
            },
            mapping = cmp.mapping.preset.insert({
               ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
               ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
               ['<C-b>'] = cmp.mapping.scroll_docs(-4),
               ['<C-f>'] = cmp.mapping.scroll_docs(4),
               ['<C-Space>'] = cmp.mapping.complete(),
               ['<C-a>'] = cmp.mapping.abort(),
               ['<TAB>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
               ['<CR>'] = cmp.mapping.confirm({ select = false }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            }),
            sources = cmp.config.sources({
               { name = "nvim_lsp" },
               { name = "nvim_lsp_signature_help" },
               { name = "buffer" },
            }),
         })
      end
   },
   {
      "windwp/nvim-autopairs",
      event = "InsertEnter",
      config = function()
         local autopairs = require("nvim-autopairs")

         autopairs.setup({
            check_ts = true,
            enable_check_bracket_line = false,
         })
      end,
   },
   {
      "kylechui/nvim-surround",
      version = "*", -- Use for stability; omit to use `main` branch for the latest features
      event = "VeryLazy",
      config = function()
         require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
         })
      end
   }
}
