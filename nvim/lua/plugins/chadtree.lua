return {
	-- dependencies = "nvim-tree/nvim-web-devicons",
	enabled = false,
	"ms-jpq/chadtree",
	branch = "chad",
	build = "python3 -m chadtree deps",
	-- https://github.com/ms-jpq/chadtree/blob/chad/config/defaults.yml
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
				"q",
				-- "<Esc>",
			},
		},
		options = {
			close_on_open = true,
			follow = true,
			-- icon_glyph_set = devicons,
		},
	},
	config = function(_, opts)
		vim.keymap.set("n", "<leader>e", "<cmd>CHADopen<cr>")
		vim.api.nvim_set_var("chadtree_settings", opts)
	end,
}
