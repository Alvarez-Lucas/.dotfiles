return {
	enabled = false,
	"echasnovski/mini.files",
	version = false,
	lazy = false,
	keys = {
		{
			"<leader>e",
			function()
				MiniFiles.open()
			end,
		},
	},
	opts = {
		-- Module mappings created only inside explorer.
		-- Use `''` (empty string) to not create one.
		mappings = {
			close = "q",
			close = "<esc>",
			go_in = "l",
			go_in_plus = "L",
			go_out = "h",
			go_out_plus = "H",
			mark_goto = "'",
			mark_set = "m",
			reset = "<BS>",
			reveal_cwd = "@",
			show_help = "g?",
			synchronize = "=",
			trim_left = "<",
			trim_right = ">",
		},

		-- General options
		options = {
			-- Whether to delete permanently or move into module-specific trash
			permanent_delete = true,
			-- Whether to use for editing directories
			use_as_default_explorer = true,
		},

		-- Customization of explorer windows
		windows = {
			-- Maximum number of windows to show side by side
			max_number = math.huge,
			-- Whether to show preview of file/directory under cursor
			preview = false,
			-- Width of focused window
			width_focus = 50,
			-- Width of non-focused window
			width_nofocus = 15,
			-- Width of preview window
			width_preview = 25,
		},
	},
}
