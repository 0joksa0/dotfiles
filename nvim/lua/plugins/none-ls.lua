return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "gbprod/none-ls-shellcheck.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        local dot_format = {
            method = null_ls.methods.FORMATTING,
            filetypes = { "dot" },
            generator = null_ls.formatter({
                command = "dot",
                args = { "-Tdot" },
                to_stdin = true,
            }),
        }
        local prettier_fallback = null_ls.builtins.formatting.prettier.with({
            filetypes = {
                "javascript",
                "javascriptreact",
                "typescript",
                "typescriptreact",
                "css",
                "scss",
                "less",
                "html",
                "json",
                "yaml",
                "markdown",
                "graphql",
                "vue",
                "svelte",
                "astro",
                "toml",
                "xml",
                "yuck",
                "txt",
                "conf",
                "ini",
            }, -- 🔹 važi za sve tipove fajlova
            condition = function(utils)
                -- ne koristi ako već postoji "pravi" LSP koji formatira
                local clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })

                for _, client in ipairs(clients) do
                    if client.supports_method("textDocument/formatting") and client.name ~= "null-ls" then
                        return false
                    end
                end
                return true -- ako nema aktivnog LSP-a → koristi Prettier
            end,
        })

        null_ls.setup({
            sources = {
                require("none-ls-shellcheck.diagnostics"),
                require("none-ls-shellcheck.code_actions"),
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.shfmt,
                dot_format,
                prettier_fallback,
            },
        })
        vim.keymap.set("n", "<leader>fa", vim.lsp.buf.format, {})
    end,
}
