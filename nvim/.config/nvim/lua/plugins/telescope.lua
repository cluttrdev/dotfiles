return {
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()

            require("telescope").setup({
                defaults = {
                    layout_config = {
                        vertical = { width = 0.9 },
                        horizontal = { height = 0.6 },
                    },
                },
            })

            local telescope_builtin = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", telescope_builtin.git_files)                  -- pick version controlled files
            vim.keymap.set("n", "<leader>fF", telescope_builtin.find_files)                 -- pick cwd files
            vim.keymap.set("n", "<leader>fb", telescope_builtin.buffers)                    -- pick open buffers
            vim.keymap.set("n", "<leader>fB", telescope_builtin.oldfiles)                   -- pick previously open files
            vim.keymap.set("n", "<leader>fp", telescope_builtin.current_buffer_fuzzy_find)  -- pick in current buffer
            vim.keymap.set("n", "<leader>fP", telescope_builtin.live_grep)                  -- pick in cwd files
            vim.keymap.set("n", "<leader>fs", telescope_builtin.treesitter)                 -- pick treesiter symbol
            vim.keymap.set("n", "<leader>fr", telescope_builtin.lsp_references)             -- pick lsp references
        end
    },
}
