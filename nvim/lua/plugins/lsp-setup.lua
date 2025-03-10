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
				virtual_text = {
					source = "if_many",
					spacing = 2,
					format = function(diagnostic)
						local diagnostic_message = {
							[vim.diagnostic.severity.ERROR] = diagnostic.message,
							[vim.diagnostic.severity.WARN] = diagnostic.message,
							[vim.diagnostic.severity.INFO] = diagnostic.message,
							[vim.diagnostic.severity.HINT] = diagnostic.message,
						}
						return diagnostic_message[diagnostic.severity]
					end,
				},
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

		on_attach = function()

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
			powershell_es = {},
			taplo = {},
			omnisharp = {},
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
