return {
    "Civitasv/cmake-tools.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "akinsho/toggleterm.nvim",
    },
    opts = {
        cmake_executor = {
            name = "toggleterm",
            opts = {},
            default_opts = {
                toggleterm = {
                    direction = "float",
                    close_on_exit = false,
                    auto_scroll = true,
                    singleton = true,
                },
            },
        },
        cmake_runner = {
            name = "toggleterm",
            opts = {},
            default_opts = {
                toggleterm = {
                    direction = "float",
                    close_on_exit = false,
                    auto_scroll = true,
                    singleton = true,
                },
            },
        },

        cmake_command = "cmake",
        build_dir = "build",
        build_type = "Debug", -- ili "Release"
        dap_configurations = {
            lldb = {
                type = "lldb",
                request = "launch",
                name = "Launch lldb",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        },
        auto_reload = true,
        auto_save = true,
        only_one_window = true,
    },
    config = function(_, opts)
        require("cmake-tools").setup(opts)
    end,
}
