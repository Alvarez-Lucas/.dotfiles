return {
	-- dependencies = "nvim-tree/nvim-web-devicons",
	lazy = false,
	enabled = true,
	"ms-jpq/chadtree",
	branch = "chad",
	build = "python3 -m chadtree deps",
	-- https://github.com/ms-jpq/chadtree/blob/chad/config/defaults.yml
	keys = {
		{ "<leader>e", "<cmd>CHADopen<cr>" },
	},
	opts = {
		keymap = {
			primary = {
				"<enter>",
				"l",
			},
			collapse = {
				"h",
			},
			quit = {
				"<Esc>",
				"q",
			},
			change_dir = { "." },
			toggle_hidden = { "H" },
		},
		options = {
			close_on_open = true,
			follow = true,
			-- icon_glyph_set = devicons,
		},
		view = { window_options = { foldenable = true } },
	},
	config = function(_, opts)
		vim.api.nvim_set_var("chadtree_settings", opts)
	end,
}
