-- Make sure to install lua for windows and it's compiler requirement
-- https://github.com/rjpcomputing/luaforwindows?tab=readme-ov-file
-- TODO: Lazy loading
return {
	"nvim-neorg/neorg",
	dependencies = {
		"nvim-neorg/lua-utils.nvim",
		"pysan3/pathlib.nvim",
		"nvim-neotest/nvim-nio",
	},
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {},
				["core.concealer"] = {},
				["core.dirman"] = {
					config = {
						workspaces = {
							notes = "~/notes",
						},
						default_workspace = "notes",
					},
				},
				["core.esupports.metagen"] = {},
				["core.esupports.indent"] = {},
				-- ["core.completion"] = { engine = "nvim-cmp" },
			},
		})

		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2
	end,
}
