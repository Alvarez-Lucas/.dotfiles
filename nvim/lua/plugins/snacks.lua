return -- lazy.nvim
{
	"folke/snacks.nvim",
	---@type snacks.Config
	opts = {
		picker = {
			layout = { preset = "ivy", layout = { height = 0.7 } },
			win = {
				input = {
					keys = {
						-- ["<Esc>"] = { "close", mode = { "n", "i" } },
					},
				},
			},
			sources = {
				-- buffers = { layout = { preset = "ivy", layout = { height = 0.8 } } },
				-- projects = { layout = { preset = "ivy", layout = { height = 0.8 } } },
				files = {
					-- layout = { preset = "ivy", layout = { height = 0.8 } },
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
					replace_netrw = true,
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
		explorer = {},
		quickfile = {},
		scratch = {},
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
			"<leader>gg",
			function()
				Snacks.picker.grep()
			end,
			desc = "Grep",
		},
		{
			"<leader>gg",
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
					patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "package.json", "Makefile", "dot.toml" },
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
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git Branches",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git Log",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git Log Line",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git Status",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git Stash",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git Diff (Hunks)",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_log_file()
			end,
			desc = "Git Log File",
		},
		-- Grep
		-- {
		-- 	"<leader>sb",
		-- 	function()
		-- 		Snacks.picker.lines()
		-- 	end,
		-- 	desc = "Buffer Lines",
		-- },
		-- {
		-- 	"<leader>sB",
		-- 	function()
		-- 		Snacks.picker.grep_buffers()
		-- 	end,
		-- 	desc = "Grep Open Buffers",
		-- },
		-- {
		-- 	"<leader>sg",
		-- 	function()
		-- 		Snacks.picker.grep()
		-- 	end,
		-- 	desc = "Grep",
		-- },
		-- {
		-- 	"<leader>sw",
		-- 	function()
		-- 		Snacks.picker.grep_word()
		-- 	end,
		-- 	desc = "Visual selection or word",
		-- 	mode = { "n", "x" },
		-- },
		-- search
		-- {
		-- 	'<leader>s"',
		-- 	function()
		-- 		Snacks.picker.registers()
		-- 	end,
		-- 	desc = "Registers",
		-- },
		-- {
		-- 	"<leader>s/",
		-- 	function()
		-- 		Snacks.picker.search_history()
		-- 	end,
		-- 	desc = "Search History",
		-- },
		-- {
		-- 	"<leader>sa",
		-- 	function()
		-- 		Snacks.picker.autocmds()
		-- 	end,
		-- 	desc = "Autocmds",
		-- },
		-- {
		-- 	"<leader>sb",
		-- 	function()
		-- 		Snacks.picker.lines()
		-- 	end,
		-- 	desc = "Buffer Lines",
		-- },
		-- {
		-- 	"<leader>sc",
		-- 	function()
		-- 		Snacks.picker.command_history()
		-- 	end,
		-- 	desc = "Command History",
		-- },
		-- 	{
		-- 		"<leader>sC",
		-- 		function()
		-- 			Snacks.picker.commands()
		-- 		end,
		-- 		desc = "Commands",
		-- 	},
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
		-- 	{
		-- 		"gI",
		-- 		function()
		-- 			Snacks.picker.lsp_implementations()
		-- 		end,
		-- 		desc = "Goto Implementation",
		-- 	},
		-- 	{
		-- 		"gy",
		-- 		function()
		-- 			Snacks.picker.lsp_type_definitions()
		-- 		end,
		-- 		desc = "Goto T[y]pe Definition",
		-- 	},
		-- 	{
		-- 		"<leader>ss",
		-- 		function()
		-- 			Snacks.picker.lsp_symbols()
		-- 		end,
		-- 		desc = "LSP Symbols",
		-- 	},
		-- 	{
		-- 		"<leader>sS",
		-- 		function()
		-- 			Snacks.picker.lsp_workspace_symbols()
		-- 		end,
		-- 		desc = "LSP Workspace Symbols",
		-- 	},
		--   },
		-- }
		-- 		end,
		-- 		desc = "LSP Symbols",
		-- 	},
		-- 	{
		-- 		"<leader>sS",
		-- 		function()
		-- 			Snacks.picker.lsp_workspace_symbols()
		-- 		end,
		-- 		desc = "LSP Workspace Symbols",
		-- 	},
		-- 		function()
		-- 			Snacks.picker.lsp_workspace_symbols()
		-- 		end,
		-- 		desc = "LSP Workspace Symbols",
		-- 	},
		-- 		function()
		-- 			Snacks.picker.lsp_workspace_symbols()
		-- 		end,
		-- 		desc = "LSP Workspace Symbols",
		-- 	},
		-- 		desc = "LSP Workspace Symbols",
		-- 	},
	},
}
