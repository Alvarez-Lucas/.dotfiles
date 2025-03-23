---@type LazySpec
return {
	{
		event = { "BufReadPre", "BufNewFile", "InsertEnter", "VeryLazy" },
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.install").prefer_git = false
			local configs = require("nvim-treesitter.configs")
			---@diagnostic disable-next-line: missing-fields
			configs.setup({
				ensure_installed = {
					"c_sharp",
					"csv",
					"diff",
					"editorconfig",
					"git_config",
					"git_rebase",
					"gitattributes",
					"gitcommit",
					"gitignore",
					"go",
					"hjson",
					"html",
					"http",
					"javascript",
					"jq",
					"jsdoc",
					"json",
					"json5",
					"jsonc",
					"lua",
					"lua",
					"luadoc",
					"luap",
					"luau",
					"markdown",
					"markdown_inline",
					"mermaid",
					"nix",
					"norg",
					"nu",
					"passwd",
					"powershell",
					"pymanifest",
					"python",
					"regex",
					"rust",
					"sql",
					"ssh_config",
					"svelte",
					"todotxt",
					"toml",
					"tsv",
					"tsx",
					"typescript",
					"vim",
					"vimdoc",
					"xml",
					"xresources",
					"yaml",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
	},
	{
		event = { "BufReadPre", "BufNewFile", "InsertEnter", "VeryLazy" },
		"HiPhish/rainbow-delimiters.nvim",
		config = function()
			require("rainbow-delimiters.setup").setup({})
		end,
	},
}
