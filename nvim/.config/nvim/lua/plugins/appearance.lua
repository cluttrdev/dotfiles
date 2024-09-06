return {
   -- colorscheme
   {
      "ellisonleao/gruvbox.nvim",
      priority = 1000,
      config = function()
         require("gruvbox").setup({})
         vim.cmd("colorscheme gruvbox")
      end
   },

   -- statusline
   {
      'nvim-lualine/lualine.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = true,
   },

   -- bufferline
   {
      'akinsho/bufferline.nvim',
      dependencies = { 'nvim-tree/nvim-web-devicons'},
      config = true,
   },

   -- file explorer
   {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = {
         "nvim-tree/nvim-web-devicons",
      },
      config = function()
         require("nvim-tree").setup({})

         vim.keymap.set("n", "<leader>t", "<CMD>NvimTreeFocus<CR>")
      end,
   },

   -- terminal
   {
      "akinsho/toggleterm.nvim",
      version = "*",
      config = function()
         require("toggleterm").setup({
            size = 20,
            open_mapping = [[<M-Space>]],
         })

         function _G.set_terminal_keymaps()
            local opts = {buffer = 0}
            vim.keymap.set('t', '<Esc>', [[<C-\><C-n>]], opts)
         end

         vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
      end,
   },
}
