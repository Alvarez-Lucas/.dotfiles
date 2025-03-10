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
				ensure_installed = "all",
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
