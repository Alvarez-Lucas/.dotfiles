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
		{ "sontungexpt/better-diagnostic-virtual-text", lazy = true },
		-- {
		-- 	url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		-- 	config = function()
		-- 		require("lsp_lines").setup()
		-- 	end,
		-- },
	},
	-- config = function()
	-- vim.o.updatetime = 250
	-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
	-- 	group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
	-- 	callback = function()
	-- 		vim.diagnostic.open_float(nil, { focus = false })
	-- 	end,
	-- })
	-- end,
	opts = {
		-- Default mappings
		default_mappings = false,
		settings = {
			vim.diagnostic.config({
				signs = {
					text = {
						[vim.diagnostic.severity.ERROR] = "󰅚 ",
						[vim.diagnostic.severity.WARN] = "󰀪 ",
						[vim.diagnostic.severity.INFO] = "󰋽 ",
						[vim.diagnostic.severity.HINT] = "󰌶 ",
					},
				},

				-- virtual_text = false,
				-- virtual_text = false,
				-- virtual_lines = true,
				-- virtual_lines = { only_current_line = true },
				-- virtual_text = {
				-- 	source = "if_many",
				-- 	spacing = 2,
				-- 	format = function(diagnostic)
				-- 		local diagnostic_message = {
				-- 			[vim.diagnostic.severity.ERROR] = diagnostic.message,
				-- 			[vim.diagnostic.severity.WARN] = diagnostic.message,
				-- 			[vim.diagnostic.severity.INFO] = diagnostic.message,
				-- 			[vim.diagnostic.severity.HINT] = diagnostic.message,
				-- 		}
				-- 		return diagnostic_message[diagnostic.severity]
				-- 	end,
				-- },
				severity_sort = true,
				update_in_insert = true,
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
			["K"] = "lua vim.diagnostic.open_float()",
			["<space>k"] = "lua vim.lsp.buf.hover()",
			["<space>rn"] = "lua vim.lsp.buf.rename()",
			["<space>ca"] = "lua vim.lsp.buf.code_action()",
			["[d"] = "lua vim.diagnostic.goto_prev()",
			["]d"] = "lua vim.diagnostic.goto_next()",
		},

		on_attach = function(client, bufnr)
			require("better-diagnostic-virtual-text.api").setup_buf(bufnr, { inline = false })
			-- diagnostic on curosr hold
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

			-- TODO: Bind K to vim.diagnostic.open_float() and then to require("ufo").peekFoldedLinesUnderCursor()
			-- peek ufo
			-- vim.keymap.set("n", "K", function()
			-- 	local winid = require("ufo").peekFoldedLinesUnderCursor()
			-- 	if not winid then
			-- 		-- choose one of coc.nvim and nvim lsp
			-- 		vim.diagnostic.open_float()
			-- 	end
			-- end)
		end,
		servers = {
			yamlls = {},
			jsonls = {},
			powershell_es = {},
			taplo = {},
			omnisharp = {},
			ruff = {},
			pylsp = {
				-- settings = {
				-- 	pylsp = {
				-- 		plugins = {
				-- 			ruff = {
				-- 				enabled = true, -- Enable the plugin
				-- 				formatEnabled = true, -- Enable formatting using ruffs formatter
				-- 				-- extendSelect = { "I" }, -- Rules that are additionally used by ruff
				-- 				-- extendIgnore = { "C90" }, -- Rules that are additionally ignored by ruff
				-- 				-- format = { "I" }, -- Rules that are marked as fixable by ruff that should be fixed when running textDocument/formatting
				-- 				-- severities = { ["D212"] = "I" }, -- Optional table of rules where a custom severity is desired
				-- 				-- unsafeFixes = false, -- Whether or not to offer unsafe fixes as code actions. Ignored with the "Fix All" action
				--
				-- 				-- Rules that are ignored when a pyproject.toml or ruff.toml is present:
				-- 				-- lineLength = 88, -- Line length to pass to ruff checking and formatting
				-- 				-- exclude = { "__about__.py" }, -- Files to be excluded by ruff checking
				-- 				-- select = { "F" }, -- Rules to be enabled by ruff
				-- 				-- ignore = { "D210" }, -- Rules to be ignored by ruff
				-- 				-- perFileIgnores = { ["__init__.py"] = "CPY001" }, -- Rules that should be ignored for specific files
				-- 				-- preview = false, -- Whether to enable the preview style linting and formatting.
				-- 				-- targetVersion = "py310", -- The minimum python version to target (applies for both linting and formatting).
				-- 			},
				-- 		},
				-- 	},
				-- },
			},
			lua_ls = {
				-- settings = {
				-- Lua = {
				-- 	-- To have lsp references when editing neovim config
				-- 	workspace = {
				-- 		checkThirdParty = true,
				-- 		library = {
				-- 			vim.env.VIMRUNTIME,
				-- 		},
				-- 	},
				-- },
				-- },
			},
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
