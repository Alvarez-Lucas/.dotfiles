return -- lazy.nvim
{
	"folke/snacks.nvim",
	lazy = false,
	---@module "snacks"
	---@type snacks.Config
	opts = {
		-- quickfile = { enabled = true },
		input = { enabled = true },
		scratch = { enabled = true },
		indent = {
			priority = 1,
			enabled = true,
			animate = { enabled = false },
			chunk = {
				enabled = true,
				char = {
					corner_top = "┌",
					corner_bottom = "└",
					-- corner_top = "╭",
					-- corner_bottom = "╰",
					horizontal = "─",
					vertical = "│",
					arrow = ">",
				},
			},
		},
		picker = {
			-- layout = { preset = "top" },
			layout = { preset = "vertical" },
			-- layout = { preset = "select" },
			-- layout = { preset = "ivy", layout = { position = "bottom" } },
			-- layout = { preset = "ivy" },
			-- layout = { preset = "ivy_split" },
			-- layout = { preset = "default" },
			-- layout = { preset = "vscode" },
			-- layout = { preset = "dropdown" },
			-- layout = { preset = "bottom" },
			-- layout = { preset = "telescope"},
			win = {
				input = {
					keys = {
						["<Esc>"] = { "close", mode = { "n", "i" } },
					},
				},
			},
			sources = {
				files = {
					win = {
						input = {
							keys = {
								["<c-e>"] = {
									function(picker)
										picker:close()
										Snacks.picker.explorer()
									end,
									mode = { "n", "i" },
								},
							},
						},
					},
				},
				explorer = {
					replace_netrw = false,
					auto_close = true,
					matcher = {
						fuzzy = true,
					},
					win = {
						list = {
							keys = { ["f"] = "picker_files" },
						},
					},
				},
			},
		},
		explorer = { enabled = true },
	},
	keys = {
		{
			"<leader>.",
			function()
				Snacks.scratch()
			end,
			desc = "Toggle Scratch Buffer",
		},
		{
			"<leader>S",
			function()
				Snacks.scratch.select()
			end,
			desc = "Select Scratch Buffer",
		},
		{
			"<leader>g",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>g",
			function()
				Snacks.picker.grep_word()
			end,
			desc = "Visual selection or word",
			mode = { "v" },
		},
		{
			"<leader>f",
			function()
				-- Snacks.picker.smart()
				Snacks.picker.files()
			end,
			desc = "Smart Find Files",
		},
		-- Top Pickers & Explorer
		-- {
		-- 	"<leader><space>",
		-- 	function()
		-- 		Snacks.picker.smart()
		-- 	end,
		-- 	desc = "Smart Find Files",
		-- },
		-- {
		-- 	"<leader>,",
		-- 	function()
		-- 		Snacks.picker.buffers()
		-- 	end,
		-- 	desc = "Buffers",
		-- },
		-- {
		-- 	"<leader>/",
		-- 	function()
		-- 		Snacks.picker.grep()
		-- 	end,
		-- 	desc = "Grep",
		-- },
		-- {
		-- 	"<leader>:",
		-- 	function()
		-- 		Snacks.picker.command_history()
		-- 	end,
		-- 	desc = "Command History",
		-- },
		-- {
		--
		-- 	"<leader>n",
		-- 	function()
		-- 		Snacks.picker.notifications()
		-- 	end,
		-- 	desc = "Notification History",
		-- },
		{
			"<leader>e",
			function()
				Snacks.picker.explorer({})
			end,
			desc = "File Explorer",
		},
		-- -- find
		{
			"<leader>b",
			function()
				Snacks.picker.buffers({
					on_show = function()
						vim.cmd.stopinsert()
					end,
				})
				-- Snacks.picker.pick("buffer", { norm = true })
			end,
			desc = "Buffers",
		},
		-- {
		-- 	"<leader>fc",
		-- 	function()
		-- 		Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
		-- 	end,
		-- 	desc = "Find Config File",
		-- },
		-- {
		-- 	"<leader>ff",
		-- 	function()
		-- 		Snacks.picker.files()
		-- 	end,
		-- 	desc = "Find Files",
		-- },
		-- {
		-- 	"<leader>fg",
		-- 	function()
		-- 		Snacks.picker.git_files()
		-- 	end,
		-- 	desc = "Find Git Files",
		-- },
		{
			"<leader>z",
			function()
				Snacks.picker.projects({
					dev = { "~/repos", "~/.dotfiles" },
					patterns = {
						".git",
						"_darcs",
						".hg",
						".bzr",
						".svn",
						"package.json",
						"Makefile",
						"dot.yaml",
						"dot.json",
						"dot.toml",
					},
					-- confirm = {"picker_explorer" },
					confirm = function(picker, item)
						if item then
							vim.cmd.tcd(Snacks.picker.util.dir(item))
							picker:close()
							Snacks.picker.files()
						else
							picker:close()
						end
						-- Snacks.picker.pick("explorer", { layout = { fullscreen = true } })
					end,
				})
			end,
			desc = "Projects",
		},
		{
			"<leader>o",
			function()
				Snacks.picker.recent()
			end,
			desc = "Recent",
		},
		-- -- git
		{
			"<leader>vb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>vl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>vL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>vs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>vS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			"<leader>vd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>vf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Log File",
		},
		{
			"<leader>Q",
			function()
				Snacks.picker.diagnostics()
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>q",
			function()
				Snacks.picker.diagnostics_buffer()
			end,
			desc = "Buffer Diagnostics",
		},
		-- 	{
		-- 		"<leader>sh",
		-- 		function()
		-- 			Snacks.picker.help()
		-- 		end,
		-- 		desc = "Help Pages",
		-- 	},
		-- 	{
		-- 		"<leader>sH",
		-- 		function()
		-- 			Snacks.picker.highlights()
		-- 		end,
		-- 		desc = "Highlights",
		-- 	},
		-- 	{
		-- 		"<leader>si",
		-- 		function()
		-- 			Snacks.picker.icons()
		-- 		end,
		-- 		desc = "Icons",
		-- 	},
		-- 	{
		-- 		"<leader>sj",
		-- 		function()
		-- 			Snacks.picker.jumps()
		-- 		end,
		-- 		desc = "Jumps",
		-- 	},
		-- 	{
		-- 		"<leader>sk",
		-- 		function()
		-- 			Snacks.picker.keymaps()
		-- 		end,
		-- 		desc = "Keymaps",
		-- 	},
		-- 	{
		-- 		"<leader>sl",
		-- 		function()
		-- 			Snacks.picker.loclist()
		-- 		end,
		-- 		desc = "Location List",
		-- 	},
		-- 	{
		-- 		"<leader>sm",
		-- 		function()
		-- 			Snacks.picker.marks()
		-- 		end,
		-- 		desc = "Marks",
		-- 	},
		-- 	{
		-- 		"<leader>sM",
		-- 		function()
		-- 			Snacks.picker.man()
		-- 		end,
		-- 		desc = "Man Pages",
		-- 	},
		-- 	{
		-- 		"<leader>sp",
		-- 		function()
		-- 			Snacks.picker.lazy()
		-- 		end,
		-- 		desc = "Search for Plugin Spec",
		-- 	},
		-- 	{
		-- 		"<leader>sq",
		-- 		function()
		-- 			Snacks.picker.qflist()
		-- 		end,
		-- 		desc = "Quickfix List",
		-- 	},
		-- 	{
		-- 		"<leader>sR",
		-- 		function()
		-- 			Snacks.picker.resume()
		-- 		end,
		-- 		desc = "Resume",
		-- 	},
		-- 	{
		-- 		"<leader>su",
		-- 		function()
		-- 			Snacks.picker.undo()
		-- 		end,
		-- 		desc = "Undo History",
		-- 	},
		-- 	{
		-- 		"<leader>uC",
		-- 		function()
		-- 			Snacks.picker.colorschemes()
		-- 		end,
		-- 		desc = "Colorschemes",
		-- 	},
		-- 	-- LSP
		-- 	{
		-- 		"gd",
		-- 		function()
		-- 			Snacks.picker.lsp_definitions()
		-- 		end,
		-- 		desc = "Goto Definition",
		-- 	},
		{
			"gD",
			function()
				Snacks.picker.lsp_declarations()
			end,
			desc = "Goto Declaration",
		},
		{
			"gr",
			function()
				Snacks.picker.lsp_references()
			end,
			nowait = true,
			desc = "References",
		},
		-- "<leader>sb", Snacks.picker.lines() desc = "Buffer Lines",
		-- "<leader>sB", Snacks.picker.grep_buffers() desc = "Grep Open Buffers",
		-- "<leader>sg", Snacks.picker.grep() desc = "Grep",
		-- "<leader>sw", Snacks.picker.grep_word() desc = "Visual selection or word",
		-- '<leader>s"', Snacks.picker.registers() desc = "Registers",
		-- "<leader>s/", Snacks.picker.search_history() desc = "Search History",
		-- "<leader>sa", Snacks.picker.autocmds() desc = "Autocmds",
		-- "<leader>sc", Snacks.picker.command_history() desc = "Command History",
		-- "<leader>sC", Snacks.picker.commands() desc = "Commands",
		-- "gI",         Snacks.picker.lsp_implementations() desc = "Goto Implementation",
		-- "gy",         Snacks.picker.lsp_type_definitions() desc = "Goto T[y]pe Definition",
		-- "<leader>ss", Snacks.picker.lsp_symbols() desc = "LSP Symbols",
		-- "<leader>sS", Snacks.picker.lsp_workspace_symbols() desc = "LSP Workspace Symbols",
		-- "<leader>sS", Snacks.picker.lsp_workspace_symbols() desc = "LSP Workspace Symbols", Snacks.picker.lsp_workspace_symbols() desc = "LSP Workspace Symbols",
		-- 			Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols",
	},
}
