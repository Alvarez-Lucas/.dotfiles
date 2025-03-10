return {
	{
		"junnplus/lsp-setup.nvim",
		event = { "BufReadPost", "BufNewFile", "VeryLazy" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		dependencies = {
			{
				"seblyng/roslyn.nvim",
				ft = { "cs", "vb" },
				config = function()
					require("roslyn").setup({
						ft = { "cs", "vb" },
					})
				end,
				-- your configuration comes here; leave empty for default settings
			},
			{
				"j-hui/fidget.nvim",
				opts = {},
			},
			{
				"neovim/nvim-lspconfig",
				dependencies = { "saghen/blink.cmp" },
				config = function()
					local capabilities = require("blink.cmp").get_lsp_capabilities()
					require("lspconfig").nushell.setup({ capabilities = capabilities })
					-- require("lspconfig").csharp_ls.setup({ capabilities = capabilities, filetypes = { "cs", "vb" } })
				end,
			},
			"williamboman/mason.nvim", -- optional
			"williamboman/mason-lspconfig.nvim", -- optional
		},

		opts = {
			-- Default mappings
			default_mappings = false,
			-- gD = "lua vim.lsp.buf.declaration()",
			gd = "lua vim.lsp.buf.definition()",
			gt = "lua vim.lsp.buf.type_definition()",
			-- gi = "lua vim.lsp.buf.implementation()",
			-- gr = "lua vim.lsp.buf.references()",
			K = "lua vim.lsp.buf.hover()",
			K = "lua vim.lsp.buf.hover()",
			-- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()', -- TODO: We are using for window navigation, need new bind
			["<space>rn"] = "lua vim.lsp.buf.rename()",
			["<space>ca"] = "lua vim.lsp.buf.code_action()",
			-- ["<space>f"] = "lua vim.lsp.buf.formatting()",
			-- ["<space>e"] = "lua vim.diagnostic.open_float()",
			["[d"] = "lua vim.diagnostic.goto_prev()",
			["]d"] = "lua vim.diagnostic.goto_next()",
			-- Example mappings for telescope pickers:
			-- gd = 'lua require"telescope.builtin".lsp_definitions()',
			-- gi = 'lua require"telescope.builtin".lsp_implementations()',
			-- gr = 'lua require"telescope.builtin".lsp_references()',
			inlay_hints = {
				enabled = true,
				highlight = "Comment",
			},
			capabilities = require("blink.cmp").get_lsp_capabilities(),
			servers = {
				-- rust_analyzer = {
				--   settings = {
				--     ['rust-analyzer'] = {
				--       inlayHints = {
				--         bindingModeHints = {
				--           enable = true,
				--         },
				--         chainingHints = {
				--           enable = true,
				--         },
				--         closingBraceHints = {
				--           enable = true,
				--           minLines = 25,
				--         },
				--         closureReturnTypeHints = {
				--           enable = 'never',
				--         },
				--         lifetimeElisionHints = {
				--           enable = 'never',
				--           useParameterNames = false,
				--         },
				--         maxLength = 25,
				--         parameterHints = {
				--           enable = true,
				--         },
				--         reborrowHints = {
				--           -- enable = 'never',
				--           enable = true,
				--         },
				--         renderColons = true,
				--         typeHints = {
				--           enable = true,
				--           hideClosureInitialization = false,
				--           hideNamedConstructor = false,
				--         },
				--       }
				--     },
				--   },
				-- },
				-- csharp_ls = {},
				powershell_es = {},
				taplo = {},
				-- omnisharp = {
				-- 	filetypes = { "cs", "vb" },
				-- 	settings = {
				-- 		FormattingOptions = {
				-- 			-- Enables support for reading code style, naming convention and analyzer
				-- 			-- settings from .editorconfig.
				-- 			EnableEditorConfigSupport = true,
				-- 			-- Specifies whether 'using' directives should be grouped and sorted during
				-- 			-- document formatting.
				-- 			OrganizeImports = true,
				-- 		},
				-- 		MsBuild = {
				-- 			-- If true, MSBuild project system will only load projects for files that
				-- 			-- were opened in the editor. This setting is useful for big C# codebases
				-- 			-- and allows for faster initialization of code navigation features only
				-- 			-- for projects that are relevant to code that is being edited. With this
				-- 			-- setting enabled OmniSharp may load fewer projects and may thus display
				-- 			-- incomplete reference lists for symbols.
				-- 			LoadProjectsOnDemand = nil,
				-- 		},
				-- 		RoslynExtensionsOptions = {
				-- 			-- Enables support for roslyn analyzers, code fixes and rulesets.
				-- 			EnableAnalyzersSupport = true,
				-- 			-- Enables support for showing unimported types and unimported extension
				-- 			-- methods in completion lists. When committed, the appropriate using
				-- 			-- directive will be added at the top of the current file. This option can
				-- 			-- have a negative impact on initial completion responsiveness,
				-- 			-- particularly for the first few completion sessions after opening a
				-- 			-- solution.
				-- 			EnableImportCompletion = true,
				-- 			-- Only run analyzers against open files when 'enableRoslynAnalyzers' is
				-- 			-- true
				-- 			AnalyzeOpenDocumentsOnly = nil,
				-- 		},
				-- 		Sdk = {
				-- 			-- Specifies whether to include preview versions of the .NET SDK when
				-- 			-- determining which version to use for project loading.
				-- 			IncludePrereleases = true,
				-- 		},
				-- 	},
				-- },
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
	},
}
