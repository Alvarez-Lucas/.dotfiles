return {
	version = "v0.*", -- use a release tag to download pre-built binaries
	"saghen/blink.cmp",
	-- lazy = false, -- lazy loading handled internally
	-- optional: provides snippets for the snippet source
	-- dependencies = 'rafamadriz/friendly-snippets',
	event = { "InsertEnter" },
	dependencies = {
		"garymjr/nvim-snippets",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = { create_cmp_source = false, friendly_snippets = true },
	},

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		keymap = { preset = "enter" },
		highlight = { use_nvim_cmp_as_default = true },
		nerd_font_variant = "mono",

		accept = {
			auto_brackets = {
				enabled = true,
			},
		},

		-- experimental signature help support
		trigger = {
			completion = {
				blocked_trigger_characters = {
					" ",
					"\n",
					"\t",
					"{",
					",",
				},
			},
			signature_help = {
				enabled = true,
			},
		},
	},
}
