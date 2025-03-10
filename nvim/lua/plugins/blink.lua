-- blocked_trigger_characters = {
-- 	" ",
-- 	"\n",
-- 	"\t",
-- 	"{",
-- 	",",
-- },
--
return {
	enabled = true,
	"saghen/blink.cmp",
	-- optional: provides snippets for the snippet source
	event = { "InsertEnter", "BufNewFile", "VeryLazy" },
	dependencies = { "rafamadriz/friendly-snippets" },
	-- dependencies = { "rafamadriz/friendly-snippets", "nvim-tree/nvim-web-devicons", "onsails/lspkind.nvim" },

	-- use a release tag to download pre-built binaries
	version = "*",
	-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
	-- build = 'cargo build --release',
	-- If you use nix, you can build from source using latest nightly rust with:
	-- build = 'nix run .#build-plugin',

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		sources = {

			default = { "lazydev", "lsp", "path", "snippets", "buffer" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- make lazydev completions top priority (see `:h blink.cmp`)
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
				auto_show_delay_ms = 500,
			},
			-- ghost_text = { enabled = true },
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

			-- menu = {
			--   draw = {
			--     -- treesitter = { "lsp" },
			--
			--     components = {
			--       kind_icon = {
			--         ellipsis = false,
			--         text = function(ctx)
			--           local lspkind = require("lspkind")
			--           local icon = ctx.kind_icon
			--           if vim.tbl_contains({ "Path" }, ctx.source_name) then
			--             local dev_icon, _ = require("nvim-web-devicons").get_icon(ctx.label)
			--             if dev_icon then
			--               icon = dev_icon
			--             end
			--           else
			--             icon = require("lspkind").symbolic(ctx.kind, {
			--               mode = "symbol",
			--             })
			--           end
			--
			--           return icon .. ctx.icon_gap
			--         end,
			--       },
			--     },
			--   },
			-- },
		},
		-- sources = {
		--
		--   default = { "lsp", "path", "snippets", "buffer" },
		-- },

		-- completion = {
		-- 	menu = {
		-- 		draw = {
		--
		-- 			-- columns = {
		-- 			-- 	{ "label", "label_description", gap = 1 },
		-- 			-- 	{ "kind_icon", "kind" },
		-- 			-- },
		-- 		},
		-- 	},

		-- snippets = { preset = 'default' | 'luasnip' | 'mini_snippets' },
	},
	-- opts_extend = { "sources.default" },
}
