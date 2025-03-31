---@type LazySpec
return {
	enabled = false,
	"folke/tokyonight.nvim",
	---@class tokyonight.Config
	---@field on_colors fun(colors: ColorScheme)
	---@field on_highlights fun(highlights: tokyonight.Highlights, colors: ColorScheme)
	opts = {

		styles = {
			-- Style to be applied to different syntax groups
			-- Value is any valid attr-list value for `:help nvim_set_hl`
			comments = { italic = false },
			keywords = { italic = false },
			functions = {},
			variables = {},
			-- Background styles. Can be "dark", "transparent" or "normal"
			sidebars = "dark", -- style for sidebars, see below
			floats = "dark", -- style for floating windows
		},
		cache = true,
	},
	config = function(_, opts)
		require("tokyonight").setup(opts)
		vim.cmd.colorscheme("tokyonight")
	end,
}
