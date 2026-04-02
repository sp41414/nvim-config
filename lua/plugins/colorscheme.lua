return {
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         require("rose-pine").setup({
    --             styles = {
    --                 bold = true,
    --                 italic = true,
    --                 transparency = false,
    --             },
    --             highlight_groups = {
    --                 Normal = { bg = "#000000" },
    --                 NormalNC = { bg = "#000000" },
    --                 NormalFloat = { bg = "#000000" },
    --                 FloatBorder = { fg = "subtle", bg = "#000000" },
    --                 FloatTitle = { bg = "#000000" },
    --                 DiagnosticFloatingError = { bg = "#000000" },
    --                 DiagnosticFloatingWarn = { bg = "#000000" },
    --                 DiagnosticFloatingInfo = { bg = "#000000" },
    --                 DiagnosticFloatingHint = { bg = "#000000" },
    --             },
    --         })
    --
    --         vim.cmd("colorscheme rose-pine")
    --     end,
    -- },
    -- {
    -- 	"folke/tokyonight.nvim",
    -- 	lazy = false,
    -- 	priority = 1000,
    -- 	config = function()
    -- 		require("tokyonight").setup({
    -- 			style = "night",
    -- 			-- on_colors = function(colors)
    -- 			-- 	colors.bg = "#000000"
    -- 			-- 	colors.bg_dark = "#000000"
    -- 			-- 	colors.bg_float = "#000000"
    -- 			-- 	colors.bg_popup = "#000000"
    -- 			-- 	colors.bg_sidebar = "#000000"
    -- 			-- 	colors.bg_statusline = "#000000"
    -- 			-- end,
    -- 		})
    --
    -- 		vim.cmd("colorscheme tokyonight")
    -- 	end,
    -- },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        config = function()
            require("catppuccin").setup({
                flavour = "macchiato",
                float = {
                    solid = true,
                },
                highlight_overrides = {
                    all = function(colors)
                        return {
                            CurSearch = { bg = colors.sky },
                            IncSearch = { bg = colors.sky },
                            CursorLineNr = { fg = colors.blue, style = { "bold" } },
                            DashboardFooter = { fg = colors.overlay0 },
                            TreesitterContextBottom = { style = {} },
                            WinSeparator = { fg = colors.overlay0, style = { "bold" } },
                            ["@markup.italic"] = { fg = colors.blue, style = { "italic" } },
                            ["@markup.strong"] = { fg = colors.blue, style = { "bold" } },
                            Headline = { style = { "bold" } },
                            Headline1 = { fg = colors.blue, style = { "bold" } },
                            Headline2 = { fg = colors.pink, style = { "bold" } },
                            Headline3 = { fg = colors.lavender, style = { "bold" } },
                            Headline4 = { fg = colors.green, style = { "bold" } },
                            Headline5 = { fg = colors.peach, style = { "bold" } },
                            Headline6 = { fg = colors.flamingo, style = { "bold" } },
                            rainbow1 = { fg = colors.blue, style = { "bold" } },
                            rainbow2 = { fg = colors.pink, style = { "bold" } },
                            rainbow3 = { fg = colors.lavender, style = { "bold" } },
                            rainbow4 = { fg = colors.green, style = { "bold" } },
                            rainbow5 = { fg = colors.peach, style = { "bold" } },
                            rainbow6 = { fg = colors.flamingo, style = { "bold" } },
                        }
                    end,
                },
                color_overrides = {
                    macchiato = {
                        rosewater = "#F5B8AB",
                        flamingo = "#F29D9D",
                        pink = "#AD6FF7",
                        mauve = "#FF8F40",
                        red = "#E66767",
                        maroon = "#EB788B",
                        peach = "#FAB770",
                        yellow = "#FACA64",
                        green = "#70CF67",
                        teal = "#4CD4BD",
                        sky = "#61BDFF",
                        sapphire = "#4BA8FA",
                        blue = "#00BFFF",
                        lavender = "#00BBCC",
                        text = "#C1C9E6",
                        subtext1 = "#A3AAC2",
                        subtext0 = "#8E94AB",
                        overlay2 = "#7D8296",
                        overlay1 = "#676B80",
                        overlay0 = "#464957",
                        surface2 = "#3A3D4A",
                        surface1 = "#2F313D",
                        surface0 = "#1D1E29",
                        base = "#0b0b12",
                        mantle = "#11111a",
                        crust = "#191926",
                    },
                },
                integrations = {
                    telescope = {
                        enabled = true,
                        style = "nvchad",
                    },
                },
            })

            vim.cmd("colorscheme catppuccin")
        end,
    },
    {
        "b0o/incline.nvim",
        event = "BufReadPre",
        keys = {
            {
                "<leader>uI",
                function()
                    require("incline").toggle()
                end,
                desc = "Toggle Incline",
            },
        },
        config = function()
            require("incline").setup({
                highlight = {
                    groups = {
                        InclineNormal = { default = true, group = "lualine_a_normal" },
                        InclineNormalNC = { default = true, group = "Comment" },
                    },
                },
                window = { margin = { vertical = 0, horizontal = 1 } },
                render = function(props)
                    local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
                    local icon, color = require("nvim-web-devicons").get_icon_color(filename)
                    return { { icon, guifg = color }, { icon and " " or "" }, { filename } }
                end,
            })
        end,
    },
    {
        "lukas-reineke/headlines.nvim",
        opts = {
            markdown = {
                fat_headlines = true,
            },
        },
    },
}
