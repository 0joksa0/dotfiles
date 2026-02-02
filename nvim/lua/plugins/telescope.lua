return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup({
                defaults = {
                    layout_strategy = "horizontal",
                    layout_config = {
                        preview_cutoff = 0,
                        preview_width = 0.5,
                        width = 0.9,
                    },
                    sorting_strategy = "ascending",
                    file_ignore_patterns = { "node_modules", "%.git/" },
                },
                pickers = {
                    find_files = {
                        previewer = true,
                    },
                    live_grep = {
                        previewer = true,
                    },
                },
            })
            local telescope = require("telescope.builtin")
            vim.keymap.set("n", "<leader>ff", telescope.find_files, { desc = "Telescope find files" })
            vim.keymap.set("n", "<leader>fg", telescope.live_grep, { desc = "Telescope live grep" })
            vim.keymap.set("n", "<leader>fb", telescope.buffers, { desc = "Telescope buffers" })
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").load_extension("ui-select")
        end,
    },
}
