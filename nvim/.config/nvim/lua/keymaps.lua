-- [[ keymaps.lua ]]

vim.g.mapleader = " "

-- Exit insert mode
vim.keymap.set("i", "qq", "<Esc>")

-- Show next matched string at center, opening folded line
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Half page down/up with cursor at center
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

-- Move visual selection
vim.keymap.set("v", "J", ":move '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":move '<-2<CR>gv=gv")

vim.keymap.set("x", "<leader>p", "\"_dP")

vim.keymap.set({"n", "v"}, "<leader>y", "\"+y")
vim.keymap.set({"n", "v"}, "<leader>d", "\"_d")

-- Navigate windows
vim.keymap.set({"i", "t"}, "<M-h>", [[<C-\><C-N><C-w>h]])
vim.keymap.set({"i", "t"}, "<M-j>", [[<C-\><C-N><C-w>j]])
vim.keymap.set({"i", "t"}, "<M-k>", [[<C-\><C-N><C-w>k]])
vim.keymap.set({"i", "t"}, "<M-l>", [[<C-\><C-N><C-w>l]])
vim.keymap.set({"i", "t"}, "<M-l>", [[<C-\><C-N><C-w>l]])
vim.keymap.set("n", "<M-h>", "<C-w>h")
vim.keymap.set("n", "<M-j>", "<C-w>j")
vim.keymap.set("n", "<M-k>", "<C-w>k")
vim.keymap.set("n", "<M-l>", "<C-w>l")
