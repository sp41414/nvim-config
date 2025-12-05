return {
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				styles = {
					bold = true,
					italic = true,
					transparency = false,
				},
				highlight_groups = {
					Normal = { bg = "#000000" },
					NormalNC = { bg = "#000000" },
					NormalFloat = { bg = "#000000" },
				},
			})

			vim.cmd("colorscheme rose-pine")
		end,
	},
}
