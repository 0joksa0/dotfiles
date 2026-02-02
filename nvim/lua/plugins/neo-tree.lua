return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		require("neo-tree").setup({
			window = {
				width = 25,
			},
		})
		vim.keymap.set("n", "<leader>ft", ":Neotree filesystem toggle right<CR>", { desc = "Toggle Neotree" })
		vim.keymap.set("n", "<leader>fh", ":Neotree git_status toggle right<CR>", { desc = "Toggle git Neotree" })
		vim.keymap.set("n", "<leader>fe", ":Neotree filesystem focus right<CR>", { desc = "Focus Neotree" })
	end,
}
