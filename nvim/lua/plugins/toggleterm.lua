return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		-- 1. Osnovni setup
		require("toggleterm").setup({
			size = 30,
			open_mapping = [[<C-Space>]],
			hide_numbers = true,
			shade_filetypes = {},
			shade_terminals = true,
			shading_factor = 2,
			start_in_insert = true,
			insert_mappings = true,
			terminal_mappings = true,
			persist_size = true,
			close_on_exit = false,
			direction = "float", -- default terminal direction
			shell = vim.o.shell,
			float_opts = {
				border = "curved",
				width = 100,
				height = 25,
				winblend = 3,
			},
		})

		vim.keymap.set("n", "<leader>tf", "<cmd>ToggleTerm direction=float<CR>", { desc = "Toggle Float Terminal" })
	end,
}
