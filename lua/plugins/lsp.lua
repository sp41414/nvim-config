return {
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls", "rust_analyzer", "ts_ls",
				"clangd", "gopls", "jdtls",
				"cssls", "html", "jsonls",
				"pyright", "prettierd",
				"yaml_ls", "bashls", "marksman", "fish_lsp",
				"tailwindcss"
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
