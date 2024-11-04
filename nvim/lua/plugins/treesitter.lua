return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile", "InsertEnter", "VeryLazy" },
	lazy = true,
	build = ":TSUpdate",
	config = function()
		require 'nvim-treesitter.install'.prefer_git = false
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			ensure_installed = "all",
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
