-- NOTE: Make sure to install lua for windows and it's compiler requirement
-- https://github.com/rjpcomputing/luaforwindows?tab=readme-ov-file
-- TODO: Lazy loading
---@module "snacks"
---@module "mini.files"
---@type LazySpec
return {
	{
		"nvim-neorg/neorg",
		dependencies = {
			"nvim-neorg/lua-utils.nvim",
			"pysan3/pathlib.nvim",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"benlubas/neorg-interim-ls",
			"folke/snacks.nvim",
		},
		ft = "norg",
		lazy = true, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
		version = "*", -- Pin Neorg to the latest stable release
		-- cmd = { "Neorg" },
		keys = {
			"<leader>nn",
			"<leader>ni",
			{ "<leader>ni", "<cmd>Neorg index<cr>" },
			{ "<leader>njt", "<cmd>Neorg journal today<cr>" },
			{ "<leader>njm", "<cmd>Neorg journal tomorrow<cr>" },
			{ "<leader>njy", "<cmd>Neorg journal yesterday<cr>" },
			{ "<leader>njc", "<cmd>Neorg journal custom<cr>" },
			-- { "<leader>njo", "<cmd>Neorg journal toc open<cr>" }, -- TODO: after installing TOC
			-- { "<leader>nju", "<cmd>Neorg journal toc update<cr>" }, -- TODO: after installing TOC
			{
				"<leader>nq",
				"<cmd>Neorg return<cr>",
				desc = "Find Neorg Files",
			},
			{
				"<leader>nf",
				function()
					-- Snacks.picker.smart()
					Snacks.picker.files({ dirs = { "~/notes/" } })
				end,
				desc = "Find Neorg Files",
			},
			{ "<leader>nw", "<cmd>Neorg workspace<cr>" },
			{
				"<leader>ne",
				function()
					-- Snacks.picker.smart()
					MiniFiles.open("~/notes/")
				end,
				desc = "Find Neorg Files",
			},
			{
				"<leader>nf",
				function()
					-- Snacks.picker.smart()
					Snacks.picker.files({ dirs = { "~/notes/" }, exclude = { "*journal*" } })
				end,
				desc = "Find Neorg Files",
			},
			{
				"<leader>njf",
				function()
					-- Snacks.picker.smart()
					Snacks.picker.files({ dirs = { "~/notes/journal/" } })
				end,
				desc = "Find Neorg Files",
			},
			{
				"<leader>ng",
				function()
					-- Snacks.picker.smart()
					Snacks.picker.grep({ dirs = { "~/notes/" }, need_search = false })
				end,
				desc = "Grep Neorg Files",
			},
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
							default_workspace = "notes",
						},
					},
					["core.integrations.treesitter"] = {},
					["core.promo"] = {},
					["core.esupports.metagen"] = { config = { update_date = false, type = "empty" } }, -- do not update date until https://github.com/nvim-neorg/neorg/issues/1579 fixed
					-- https://github.com/nvim-neorg/neorg/issues/1579
					-- ["core.esupports.metagen"] = {
					-- 	config = { type = "auto", update_date = false }, -- TODO: Change update_date after fix
					-- },
					["core.autocommands"] = {},
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
					["core.looking-glass"] = {},
					["core.journal"] = {
						config = {
							strategy = "flat",
							workspace = "notes",
						},
					},
				},
			})
			vim.wo.foldlevel = 99
			vim.wo.conceallevel = 2
		end,
	},
	-- { "nvim-neorg/norg-fmt", ft = "norg" },
}
