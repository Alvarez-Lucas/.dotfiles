---@type LazySpec
return {
	enabled = true,
	"saghen/blink.cmp",
	event = { "InsertEnter", "BufNewFile", "VeryLazy" },
	dependencies = { "rafamadriz/friendly-snippets", { "echasnovski/mini.icons", opts = {} } },
	-- dependencies = { "rafamadriz/friendly-snippets", "nvim-tree/nvim-web-devicons", "onsails/lspkind.nvim" },
	version = "*",

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		cmdline = {
			keymap = {
				preset = "inherit",
			},
			completion = { menu = { auto_show = true } },
		},
		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
		},
		keymap = {
			preset = "super-tab",
			["<c-k>"] = { "select_prev", "fallback" },
			["<c-j>"] = { "select_next", "fallback" },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "normal",
		},
		fuzzy = { implementation = "prefer_rust_with_warning" },
		signature = { enabled = true },
		completion = {
			trigger = {
				prefetch_on_insert = true,
			},
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
			},
			menu = {
				draw = {
					components = {
						kind_icon = {
							ellipsis = false,
							text = function(ctx)
								local kind_icon, _, _ = require("mini.icons").get("lsp", ctx.kind)
								return kind_icon
							end,
							-- Optionally, you may also use the highlights from mini.icons
							highlight = function(ctx)
								local _, hl, _ = require("mini.icons").get("lsp", ctx.kind)
								return hl
							end,
						},
					},
				},
			},
		},
	},
}
