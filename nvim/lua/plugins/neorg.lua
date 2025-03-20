-- Make sure to install lua for windows and it's compiler requirement
-- https://github.com/rjpcomputing/luaforwindows?tab=readme-ov-file
-- TODO: Lazy loading
return {
	"nvim-neorg/neorg",
	keys = {
		"<leader>nn",
		"<leader>ni",
		{ "<leader>ni", "<cmd>Neorg index<cr>" },
		-- { "<leader>nn", "<Plug>(neorg.dirman.new-note)<cr>" },
	},
	dependencies = {
		"nvim-neorg/lua-utils.nvim",
		"pysan3/pathlib.nvim",
		"nvim-neotest/nvim-nio",
		"benlubas/neorg-interim-ls",
	},
	lazy = true, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.ui"] = {},
				["core.concealer"] = { config = { icon_preset = "diamond" } },
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes",
						},
						default_workspace = "notes",
					},
				},
				["core.dirman.utils"] = {},
				["core.esupports.metagen"] = {
					config = { update_date = false }, -- do not update date until https://github.com/nvim-neorg/neorg/issues/1579 fixed
				},
				["core.esupports.indent"] = {},
				["core.autocommands"] = {},
				["core.integrations.treesitter"] = {},
				["core.itero"] = {},
				["core.completion"] = { config = { engine = { module_name = "external.lsp-completion" } } },
				["core.summary"] = {},
				-- ["core.completion"] = { engine = "nvim-cmp" },
			},
		})

		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2
	end,
}
