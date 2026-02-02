

vim.api.nvim_create_augroup("CBindings", { clear = true })
-- Autocommand za C fajlove
vim.api.nvim_create_autocmd("FileType", {
    group = "CBindings",
    pattern = {"c", "cpp", "h"},
    callback = function()
        vim.keymap.set("n", "<leader>b", ":CMakeBuild<CR>", { buffer = true, noremap = true, silent = false })
        vim.keymap.set("n", "<leader>r", ":CMakeRun<CR>", { buffer = true, noremap = true, silent = true })
    end,
})
vim.keymap.set('n', '<C-s>', ':wa<CR>', { noremap = true, silent = true })
vim.keymap.set('i', '<C-s>', '<Esc>:wa<CR>a', { noremap = true, silent = true })
