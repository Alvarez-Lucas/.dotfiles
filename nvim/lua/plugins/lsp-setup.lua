return {
	"junnplus/lsp-setup.nvim",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
	dependencies = {
		{
			"j-hui/fidget.nvim",
			opts = {},
		},
		"neovim/nvim-lspconfig",
		"williamboman/mason.nvim", -- optional
		"williamboman/mason-lspconfig.nvim", -- optional
	},

	opts = {
		-- Default mappings
		default_mappings = false,
		gD = "lua vim.lsp.buf.declaration()",
		gd = "lua vim.lsp.buf.definition()",
		gt = "lua vim.lsp.buf.type_definition()",
		gi = "lua vim.lsp.buf.implementation()",
		gr = "lua vim.lsp.buf.references()",
		K = "lua vim.lsp.buf.hover()",
		-- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()', -- TODO: We are using for window navigation, need new bind
		["<space>rn"] = "lua vim.lsp.buf.rename()",
		["<space>ca"] = "lua vim.lsp.buf.code_action()",
		["<space>f"] = "lua vim.lsp.buf.formatting()",
		["<space>e"] = "lua vim.diagnostic.open_float()",
		["[d"] = "lua vim.diagnostic.goto_prev()",
		["]d"] = "lua vim.diagnostic.goto_next()",
		-- Example mappings for telescope pickers:
		-- gd = 'lua require"telescope.builtin".lsp_definitions()',
		-- gi = 'lua require"telescope.builtin".lsp_implementations()',
		-- gr = 'lua require"telescope.builtin".lsp_references()',
		servers = {
			taplo = {},
			lua_ls = {
				settings = {
					Lua = {
						-- To have lsp references when editing neovim config
						workspace = {
							checkThirdParty = false,
							library = {
								vim.env.VIMRUNTIME,
							},
						},
					},
				},
			},
		},
	},
}
