---@type LazySpec
return {
	"junnplus/lsp-setup.nvim",
	event = { "BufReadPost", "BufNewFile", "VeryLazy" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	dependencies = {
		{
			"j-hui/fidget.nvim",
			opts = {},
		},
		{
			"neovim/nvim-lspconfig",
			config = function()
				require("lspconfig").nushell.setup({})
			end,
		},
		"williamboman/mason.nvim", -- optional
		"williamboman/mason-lspconfig.nvim", -- optional
		{
			"rachartier/tiny-inline-diagnostic.nvim",
			keys = {
				{
					"<leader>ck",
					function()
						require("tiny-inline-diagnostic").toggle()
					end,
				},
			},
			opts = {
				-- Default configuration
				-- Style preset for diagnostic messages
				-- Available options:
				-- "modern", "classic", "minimal", "powerline",
				-- "ghost", "simple", "nonerdfont", "amongus"
				preset = "powerline",

				transparent_bg = false, -- Set the background of the diagnostic to transparent

				hi = {
					error = "DiagnosticError", -- Highlight group for error messages
					warn = "DiagnosticWarn", -- Highlight group for warning messages
					info = "DiagnosticInfo", -- Highlight group for informational messages
					hint = "DiagnosticHint", -- Highlight group for hint or suggestion messages
					arrow = "NonText", -- Highlight group for diagnostic arrows

					-- Background color for diagnostics
					-- Can be a highlight group or a hexadecimal color (#RRGGBB)
					background = "CursorLine",

					-- Colo}r blending option for the diagnostic background
					-- Use "None" or a hexadecimal color (#RRGGBB) to blend with another color
					mixing_color = "None",
				},

				options = {
					-- Display the source of the diagnostic (e.g., basedpyright, vsserver, lua_ls etc.)
					show_source = false,

					-- Use icons defined in the diagnostic configuration
					use_icons_from_diagnostic = false,

					-- Set the arrow icon to the same color as the first diagnostic severity
					set_arrow_to_diag_color = false,

					-- Add messages to diagnostics when multiline diagnostics are enabled
					-- If set to false, only signs will be displayed
					add_messages = true,

					-- Time (in milliseconds) to throttle updates while moving the cursor
					-- Increase this value for better performance if your computer is slow
					-- or set to 0 for immediate updates and better visual
					throttle = 0,

					-- Minimum message length before wrapping to a new line
					softwrap = 30,
					multilines = {
						-- Enable multiline diagnostic messages
						enabled = true,

						-- Always show messages on all lines for multiline diagnostics
						always_show = true,
					},

					-- Display all diagnostic messages on the cursor line
					show_all_diags_on_cursorline = false,

					-- Enable diagnostics in Insert mode
					-- If enabled, it is better to set the `throttle` option to 0 to avoid visual artifacts
					enable_on_insert = true,

					-- Enable diagnostics in Select mode (e.g when auto inserting with Blink)
					enable_on_select = false,

					overflow = {
						-- Manage how diagnostic messages handle overflow
						-- Options:
						-- "wrap" - Split long messages into multiple lines
						-- "none" - Do not truncate messages
						-- "oneline" - Keep the message on a single line, even if it's long
						mode = "wrap",

						-- Trigger wrapping to occur this many characters earlier when mode == "wrap".
						-- Increase this value appropriately if you notice that the last few characters
						-- of wrapped diagnostics are sometimes obscured.
						padding = 0,
					},

					-- Configuration for breaking long messages into separate lines
					break_line = {
						-- Enable the feature to break messages after a specific length
						enabled = false,

						-- Number of characters after which to break the line
						after = 30,
					},

					-- Custom format function for diagnostic messages
					-- Example:
					-- format = function(diagnostic)
					--     return diagnostic.message .. " [" .. diagnostic.source .. "]"
					-- end
					format = nil,

					virt_texts = {
						-- Priority for virtual text display
						priority = 2048,
					},

					-- Filter diagnostics by severity
					-- Available severities:
					-- vim.diagnostic.severity.ERROR
					-- vim.diagnostic.severity.WARN
					-- vim.diagnostic.severity.INFO
					-- vim.diagnostic.severity.HINT
					severity = {
						vim.diagnostic.severity.ERROR,
						vim.diagnostic.severity.WARN,
						vim.diagnostic.severity.INFO,
						vim.diagnostic.severity.HINT,
					},

					-- Events to attach diagnostics to buffers
					-- You should not change this unless the plugin does not work with your configuration
					overwrite_events = nil,
				},
				disabled_ft = {}, -- List of filetypes to disable the plugin
			},
			config = function(_, opts)
				require("tiny-inline-diagnostic").setup(opts)

				-- local p = require("nightfly").palette
				-- vim.api.nvim_set_hl(0, "TinyInlineDiagnosticVirtualTextError", { bg = p.slate_blue, fg = p.watermelon })
				-- vim.api.nvim_set_hl(0, "TinyInlineDiagnosticVirtualTextWarn", {fg=, bg=})
				-- vim.api.nvim_set_hl(0, "TinyInlineDiagnosticVirtualTextInfo", {fg=, bg=})
				-- vim.api.nvim_set_hl(0, "TinyInlineDiagnosticVirtualTextHint", {fg=, bg=})
				-- vim.api.nvim_set_hl(0, "TinyInlineDiagnosticVirtualTextArrow", {fg=, bg=})
			end,
		},
	},
	opts = {
		default_mappings = false,
		settings = {
			vim.diagnostic.config({
				signs = {
					-- text = {
					-- 	[vim.diagnostic.severity.ERROR] = "",
					-- 	[vim.diagnostic.severity.WARN] = "",
					-- },
					-- linehl = {
					-- 	[vim.diagnostic.severity.ERROR] = "ErrorMsg",
					-- },
					-- numhl = {
					-- 	[vim.diagnostic.severity.WARN] = "WarningMsg",
					-- },

					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				},
				severity_sort = true,
				update_in_insert = false,
				virtual_text = false,
				-- virtual_text = { current_line =  true, source = "if_many", severity = { vim.diagnostic.severity.ERROR } },
				underline = true,
				virtual_lines = false,
				float = { source = "if_many" },
			}),
		},
		inlay_hints = { enabled = true },
		-- capabilities = require("blink.cmp").get_lsp_capabilities(),
		capabilities = vim.tbl_deep_extend(
			"force",
			vim.lsp.protocol.make_client_capabilities(),
			require("blink.cmp").get_lsp_capabilities(),
			{
				textDocument = {
					foldingRange = {
						dynamicRegistration = false,
						lineFoldingOnly = true,
					},
				},
			}
		),
		mappings = {
			gd = "lua vim.lsp.buf.definition()",
			gt = "lua vim.lsp.buf.type_definition()",
			["<space>k"] = "lua vim.lsp.buf.hover()",
			-- ["K"] = "lua vim.lsp.buf.hover()",
			["<space>rn"] = "lua vim.lsp.buf.rename()",
			["<space>ca"] = "lua vim.lsp.buf.code_action()",
			["[d"] = "lua vim.diagnostic.goto_prev()",
			["]d"] = "lua vim.diagnostic.goto_next()",
		},

		on_attach = function(client, bufnr)
			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview

			local border = {
				{ "🭽", "FloatBorder" },
				{ "▔", "FloatBorder" },
				{ "🭾", "FloatBorder" },
				{ "▕", "FloatBorder" },
				{ "🭿", "FloatBorder" },
				{ "▁", "FloatBorder" },
				{ "🭼", "FloatBorder" },
				{ "▏", "FloatBorder" },
			}

			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
				opts = opts or {}
				opts.border = opts.border or border
				return orig_util_open_floating_preview(contents, syntax, opts, ...)
			end

			-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			-- 	group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
			-- 	callback = function()
			-- 		vim.diagnostic.open_float(nil, { focus = false })
			-- 	end,
			-- })

			-- vim.api.nvim_create_autocmd("CursorHold", {
			-- 	buffer = bufnr,
			-- 	callback = function()
			-- 		local opts = {
			-- 			focusable = false,
			-- 			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			-- 			border = "rounded",
			-- 			source = "always",
			-- 			prefix = " ",
			-- 			scope = "cursor",
			-- 		}
			-- 		vim.diagnostic.open_float(nil, opts)
			-- 	end,
			-- })
			vim.keymap.set("n", "K", function()
				-- vim.diagnostic.open_float()
				vim.lsp.buf.hover()
			end)
			vim.keymap.set("n", "gl", function()
				vim.diagnostic.open_float()
			end)
			vim.keymap.set("n", "gK", function()
				require("blink.cmp").show_signature()
			end)
			vim.keymap.set("i", "<c-k>", function()
				require("blink.cmp").show_signature()
			end)
		end,
		servers = {
			yamlls = {},
			jsonls = {},
			powershell_es = {},
			taplo = {},
			omnisharp = {},
			-- ruff = {},
			pylsp = {},
			lua_ls = {},
		},
	},
}

-- gD = "lua vim.lsp.buf.declaration()",
-- Example mappings for telescope pickers:
-- gd = 'lua require"telescope.builtin".lsp_definitions()',
-- gi = 'lua require"telescope.builtin".lsp_implementations()',
-- gr = 'lua require"telescope.builtin".lsp_references()',
-- ["<space>f"] = "lua vim.lsp.buf.formatting()",
-- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()', -- TODO: We are using for window navigation, need new bind
-- gi = "lua vim.lsp.buf.implementation()",
-- gr = "lua vim.lsp.buf.references()",
-- gr = "lua vim.lsp.buf.references()",
