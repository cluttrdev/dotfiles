require("telescope").setup({
    defaults = {
        layout_config = {
            vertical = { width = 0.9 },
            horizontal = { height = 0.6 }
        },
    },
})

local telescope_builtin = require("telescope.builtin")

vim.keymap.set("n", "<leader>ff", telescope_builtin.git_files)
vim.keymap.set("n", "<leader>fF", telescope_builtin.find_files)
vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers)
vim.keymap.set("n", "<leader>fB", telescope_builtin.oldfiles)
vim.keymap.set("n", "<leader>fp", telescope_builtin.grep_string)
vim.keymap.set("n", "<leader>fP", telescope_builtin.live_grep)

require("telescope").load_extension("file_browser")
