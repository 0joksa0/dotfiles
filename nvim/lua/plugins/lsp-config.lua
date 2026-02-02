return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.clangd.setup({
                capabilities = capabilities,
                cmd = {
                    "clangd",
                    "--fallback-style=webkit",
                },
            })
            lspconfig.cmake.setup({
                capabilities = capabilities,
            })
            lspconfig.jsonls.setup({
                capabilities = capabilities,
            })
            lspconfig.basedpyright.setup({
                capabilities = capabilities,

                settings = {
                    basedpyright = {
                        analysis = {
                            autoSearchPaths = true,
                            useLibraryCodeForTypes = true,
                            diagnosticMode = "workspace",
                            typeCheckingMode = "basic",
                            extraPaths = vim.split(os.getenv("PYTHONPATH") or "", ":"),
                        },
                        pythonPath = vim.fn.getcwd() .. "/venv/bin/python", -- ako koristiš venv
                    },
                },
            })
            lspconfig.ruff.setup({
                capabilities = capabilities,
            })
            lspconfig.ts_ls.setup({
                capabilities = capabilities,
            })
            lspconfig.bashls.setup({
                capabilities = capabilities,
            })
            lspconfig.arduino_language_server.setup({
                cmd = {
                    "arduino-language-server",
                    "-cli",
                    "/usr/bin/arduino-cli",
                    "-cli-config",
                    "~/.arduino15/arduino-cli.yaml",
                    "-fqbn",
                    "arduino:avr:uno",
                    "-log",
                    "debug",
                },
            })

            lspconfig.lemminx.setup({
                settings = {
                    xml = {
                        format = { enabled = true },
                        validation = { enabled = true },
                    },
                },
            })

            lspconfig.eslint.setup({ capabilities = capabilities })
            lspconfig.emmet_ls.setup({
                capabilities = require("cmp_nvim_lsp").default_capabilities(),
                filetypes = {
                    "html",
                    "css",
                    "scss",
                    "javascriptreact",
                    "typescriptreact",
                    "jsx",
                    "tsx",
                },
            })

            lspconfig.dotls.setup({
                capabilities = capabilities,
                cmd = { "dot-language-server", "--stdio" }, -- Mason će postaviti tačnu putanju
                filetypes = { "dot" },          -- *.dot, *.gv (vidi autocommand ispod)
                root_dir = lspconfig.util.root_pattern(".git", "."),
            })

            vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "hover documents" })
            vim.keymap.set("n", "df", vim.lsp.buf.definition, { desc = "jump to definition" })
            vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "code action" })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "clangd",
                    "cmake",
                    "basedpyright",
                    "bashls",
                    "jsonls",
                    "arduino_language_server",
                    "eslint",
                    "html",
                    "cssls",
                    "jsonls",
                    "emmet_ls",
                    "dotls",
                    "lemminx",
                },
            })
        end,
    },
}
