return {
   {
      "junegunn/vim-easy-align",
      config = function()
         vim.keymap.set({ "n", "x" }, "<leader>ea", "<Plug>(EasyAlign)", { noremap = false })
      end
   }
}
