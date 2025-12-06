return {
	-- main lsp config
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"lua_ls", "rust_analyzer", "ts_ls",
				"clangd", "gopls", "jdtls",
				"cssls", "html", "jsonls",
				"pyright", "yaml_ls", "bashls",
				"marksman", "fish_lsp", "tailwindcss"
			},
			handlers = {
				function (server)
					local capabilities = require("cmp_nvim_lsp").default_capabilities()
					require("lspconfig")[server].setup({ capabilities = capabilities })
				end
			}
		},
		dependencies = {
			{
				"mason-org/mason.nvim",
				opts = { }
			},
			"neovim/nvim-lspconfig",
		},
	},
	-- cmp autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_next_item()
						elseif luasnip.expand_or_jumpable() then
							luasnip.expand_or_jump()
						else
							fallback()
						end
					end, { "i", "s" }),
					["<S-Tab>"] = cmp.mapping(function(fallback)
						if cmp.visible() then
							cmp.select_prev_item()
						elseif luasnip.jumpable(-1) then
							luasnip.jump(-1)
						else
							fallback()
						end
					end, { "i", "s" }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "path" },
				}, {
					{ name = "buffer" },
				}),
				window = {
					completion = cmp.config.window.bordered({
						border = "rounded",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel",
						scrollbar = false,
					}),
					documentation = cmp.config.window.bordered({
						border = "rounded",
						winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
						max_width = 80,
						max_height = 20,
					}),
				},
			})

			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" }
				}
			})

			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" }
				}, {
					{ name = "cmdline" }
				})
			})
		end
	},
}
