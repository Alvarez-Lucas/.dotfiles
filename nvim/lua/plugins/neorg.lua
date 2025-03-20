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
		lazy = true, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		keys = {
			"<leader>nn",
			"<leader>ni",
			{ "<leader>ni", "<cmd>Neorg index<cr>" },
			-- { "<leader>nn", "<Plug>(neorg.dirman.new-note)<cr>" },
		},
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
					["core.dirman.utils"] = {},
					["core.summary"] = {},
					["core.itero"] = {},
				},
			})
			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 2
		end,
	},
	-- { "nvim-neorg/norg-fmt", ft = "norg" },
}
