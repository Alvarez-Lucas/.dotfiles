-- NOTE: Make sure to install lua for windows and it's compiler requirement
-- https://github.com/rjpcomputing/luaforwindows?tab=readme-ov-file
-- TODO: Lazy loading
return {
	{
		"nvim-neorg/neorg",
		dependencies = {
			"nvim-neorg/lua-utils.nvim",
			"pysan3/pathlib.nvim",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"benlubas/neorg-interim-ls",
		},
		lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		config = function()
			require("neorg").setup({
				load = {
					["core.defaults"] = {},
					["core.concealer"] = {
						config = { icon_preset = "diamond" },
					},
					["core.dirman"] = {
						config = {
							workspaces = {
								notes = "~/notes",
							},
							default_workspace = "notes",
						},
					},
					["core.integrations.treesitter"] = {},
					["core.promo"] = {},
					["core.esupports.metagen"] = {},
					["core.autocommands"] = {
						vimleavepre = true,
					},
					["core.esupports.indent"] = {},
					-- ["core.completion"] = { config = { engine = "nvim-cmp" } },
					--https://github.com/benlubas/neorg-interim-ls
					["external.interim-ls"] = {},
					["core.completion"] = {
						config = { engine = { module_name = "external.lsp-completion" } },
					},
				},
			})

			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 2
		end,
	},
	-- { "nvim-neorg/norg-fmt", ft = "norg" },
}
