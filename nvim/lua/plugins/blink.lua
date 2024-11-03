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
		-- 'default' for mappings similar to built-in completion
		-- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
		-- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
		-- see the "default configuration" section below for full documentation on how to define
		-- your own keymap.
		keymap = { preset = "enter" },

		highlight = {
			-- sets the fallback highlight groups to nvim-cmp's highlight groups
			-- useful for when your theme doesn't support blink.cmp
			-- will be removed in a future release, assuming themes add support
			use_nvim_cmp_as_default = true,
		},
		-- set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
		-- adjusts spacing to ensure icons are aligned
		nerd_font_variant = "mono",

		-- experimental auto-brackets support
		accept = { auto_brackets = { enabled = true } },

		-- experimental signature help support
		trigger = { signature_help = { enabled = true } },
	},
}
