return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		cmd = "Oil",
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
		keys = {
			-- this'll overwrite the other keybind hopefully
			{ "<leader>pv", "<cmd>Oil<cr>", desc = "Open parent directory" },
		},
	},
}
