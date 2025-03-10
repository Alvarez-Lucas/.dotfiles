return {
	-- dependencies = "nvim-tree/nvim-web-devicons",
	enabled = true,
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
		vim.cmd([[
    augroup Chad
        autocmd!
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'CHADopen' | wincmd p | ene | exe 'cd '.argv()[0] | endif
    augroup END
    ]])
		vim.keymap.set("n", "<leader>e", "<cmd>CHADopen<cr>")
		vim.api.nvim_set_var("chadtree_settings", opts)
	end,
}
