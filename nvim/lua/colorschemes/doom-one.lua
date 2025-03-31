---@type LazySpec
return {
	{

		enabled = true,
		"NTBBloodbath/doom-one.nvim",
		config = function()
			local g = vim.g
			g.doom_one_cursor_coloring = true
			g.doom_one_terminal_colors = true
			g.doom_one_italic_comments = false
			g.doom_one_enable_treesitter = true
			g.doom_one_diagnostics_text_color = false
			g.doom_one_transparent_background = false
			g.doom_one_pumblend_enable = false
			g.doom_one_plugin_neorg = true
			g.doom_one_plugin_barbar = false
			g.doom_one_plugin_telescope = true
			g.doom_one_plugin_neogit = true
			g.doom_one_plugin_nvim_tree = false
			g.doom_one_plugin_dashboard = false
			g.doom_one_plugin_startify = false
			g.doom_one_plugin_whichkey = false
			g.doom_one_plugin_indent_blankline = true
			g.doom_one_plugin_vim_illuminate = false
			g.doom_one_plugin_lspsaga = false
			vim.cmd("colorscheme doom-one")
		end,
	},
	{ "luisiacc/gruvbox-baby" },
}
