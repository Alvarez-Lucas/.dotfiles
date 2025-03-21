return {
	"stevearc/oil.nvim",
	lazy = false,
	keys = {
		{ "-", "<CMD>Oil<CR>", desc = "Open parent directory" },
	},
	---@module 'oil'
	---@type oil.SetupOpts
	opts = {
		default_file_explorer = false,
		skip_confirm_for_simple_edits = true,
		keymaps = {
			["g?"] = "actions.show_help",
			["<CR>"] = "actions.select",
			["<leader>oL"] = {
				"actions.select",
				opts = { vertical = true },
				desc = "Open the entry in a vertical split",
			},
			["<leader>oJ"] = {
				"actions.select",
				opts = { horizontal = true },
				desc = "Open the entry in a horizontal split",
			},
			["<leader>ot"] = { "actions.select", opts = { tab = true }, desc = "Open the entry in new tab" },
			["<C-p>"] = "actions.preview",
			["<C-c>"] = "actions.close",
			["<leader>or"] = "actions.refresh",
			["<bs>"] = "actions.parent",
			["~"] = "actions.open_cwd",
			["<leader>ocd"] = "actions.cd",
			["<leader>oocd"] = {
				"actions.cd",
				opts = { scope = "tab" },
				desc = ":tcd to the current oil directory",
				mode = "n",
			},
			["gs"] = "actions.change_sort",
			["gx"] = "actions.open_external",
			["g."] = "actions.toggle_hidden",
			["g\\"] = "actions.toggle_trash",
		},
		-- Set to false to disable all of the above keymaps
		use_default_keymaps = true,
	},
	-- Optional dependencies
	dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
	--
	config = function(_, opts)
		require("oil").setup(opts)
	end,
}
