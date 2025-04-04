local g = vim.g
local o = vim.opt
local c = vim.cmd
local k = vim.keymap.set

local HEIGHT_RATIO = 0.8 -- Nvimtree
local WIDTH_RATIO = 0.5

g.mapleader = " "
g.maplocalleader = " "

c("let &fcs='eob: '")
o.cmdheight = 1
o.inccommand = "split" -- Preview for substitute
o.laststatus = 3 -- Global status line
o.number = true -- Line numbers
o.relativenumber = true -- Relative line numbers
o.splitbelow = true -- Vertical split direction
o.splitright = true -- Horizontal split direction
o.expandtab = true --
o.smarttab = true --
o.ignorecase = true --
o.smartcase = true --
o.hlsearch = true --
o.incsearch = true --
o.signcolumn = "yes" --
o.swapfile = false --
o.wrap = true --
o.linebreak = true --
o.breakindent = true --
o.shiftwidth = 2 --
o.tabstop = 2 --
o.cursorline = true --
o.mouse = "" --
o.scrolloff = 8 --
o.sidescrolloff = 8 --
o.termguicolors = true --
o.showmode = false
o.undofile = true
o.updatetime = 250
o.hidden = true
o.confirm = true
o.iskeyword:append("-")
o.shortmess:append({ I = true }) -- Removes the nvim splash screen
-- vim.opt.shortmess = "" -- What do?
-- vim.opt.fillchars = { eob = " " } -- Remove end of buffer character

-- What does this do?
-- Don't have `o` add a comment
-- o.formatoptions:remove "o"
-- g.netrw_keepdir = 0
-- g.netrw_winsize = 30
-- g.netrw_banner = 0
-- g.netrw_localcopydircmd = "cp -r"

local defaultOpts = { noremap = true, silent = true }

-- Delete a buffer
-- vim.keymap.set("", "<leader>d", "<cmd>bdelete<cr>", defaultOpts)
-- k("n", "<C-s>", "<cms>w<cr>", defaultOpts)
-- k("n", "<leader>s", "<cmd>w<cr>", defaultOpts)
--
if g.neovide then
	g.neovide_scale_factor = 1.0
	g.neovide_padding_top = 8
	g.neovide_padding_bottom = 8
	g.neovide_padding_right = 8
	g.neovide_padding_left = 8
	local change_scale_factor = function(delta)
		g.neovide_scale_factor = g.neovide_scale_factor * delta
	end
	k("n", "<C-=>", function()
		change_scale_factor(1.25)
	end)
	k("n", "<C-->", function()
		change_scale_factor(1 / 1.25)
	end)
end

-- System clipboard
k({ "n", "v" }, "<leader>y", '"+y') -- yank motion
k({ "n", "v" }, "<leader>Y", '"+Y') -- yank line
k({ "n", "v" }, "<leader>d", '"+d') -- delete motion
k({ "n", "v" }, "<leader>D", '"+D') -- delete line
k("n", "<leader>p", '"+p') -- paste after cursor
k("n", "<leader>P", '"+P') -- paste before cursor
k("v", "<leader>p", '"+p')
k("n", "<Leader>xy", "<cmd>call setreg('+', getreg('@'))<CR>", defaultOpts)

k("n", "<c-d>", "<c-d>zz", defaultOpts) -- Keep cursor line centered on page scroll
k("n", "<c-u>", "<c-u>zz", defaultOpts)

k("n", "<Esc>", "<cmd>nohlsearch<cr>", defaultOpts)

k("v", "p", '"_dP', defaultOpts) -- Keep register after paste

k("n", "<bs>", "<C-^>", defaultOpts) -- Quick switch to previous buffer

k("v", "Y", "y$", defaultOpts) -- Yank to end of line

c(":vnoremap < <gv", defaultOpts) -- Keep Selection After Indent TODO: Convert to lua
c(":vnoremap > >gv", defaultOpts)

k("v", "J", ":m '>+1<cr>gv=gv") -- Move Text
k("v", "K", ":m '<-2<cr>gv=gv")

k("n", "H", "<cmd>bprevious<cr>", defaultOpts) -- Navidate buffers
k("n", "L", "<cmd>bnext<cr>", defaultOpts)

k("t", "<C-h>", "<C-\\><C-N><C-w>h", defaultOpts) -- Navigate terminal
k("t", "<C-j>", "<C-\\><C-N><C-w>j", defaultOpts)
k("t", "<C-k>", "<C-\\><C-N><C-w>k", defaultOpts)
k("t", "<C-l>", "<C-\\><C-N><C-w>l", defaultOpts)

k("n", "<C-h>", "<C-w><C-h>", defaultOpts) -- Navigate split
k("n", "<C-j>", "<C-w><C-j>", defaultOpts)
k("n", "<C-k>", "<C-w><C-k>", defaultOpts)
k("n", "<C-l>", "<C-w><C-l>", defaultOpts)

k("n", "<leader>oL", "<cmd>set splitright<cr><cmd>vsplit<cr>", defaultOpts) -- Create veritcal and horizontal split
k("n", "<leader>oJ", "<cmd>set splitbelow<cr><cmd>split<cr>", defaultOpts)
k("n", "<leader>oK", "<cmd>set nosplitright<cr><cmd>split<cr><C-w><c-k>", defaultOpts)
k("n", "<leader>oH", "<cmd>set nosplitbelow<cr><cmd>vsplit<cr><C-w><c-h>", defaultOpts)

k("n", "<C-Up>", "<cmd>resize -5<CR>", defaultOpts) -- Resize split
k("n", "<C-Down>", "<cmd>resize +5<CR>", defaultOpts)
k("n", "<C-Left>", "<cmd>vertical resize -5<CR>", defaultOpts)
k("n", "<C-Right>", "<cmd>vertical resize +5<CR>", defaultOpts)

k("t", "<Esc>", "<C-\\><C-N>", defaultOpts)
k("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

k("n", "<leader>l", "<cmd>Lazy<cr>", defaultOpts)

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
o.rtp:prepend(lazypath)

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
	group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
	callback = function(event)
		local exclude = { "gitcommit" }
		local buf = event.buf
		if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then
			return
		end
		vim.b[buf].lazyvim_last_loc = true
		local mark = vim.api.nvim_buf_get_mark(buf, '"')
		local lcount = vim.api.nvim_buf_line_count(buf)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"notify",
		"qf",
		"query",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
		"crunner_test", -- it does not set the file type
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Set leetcode to python
vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = "leetcode.com_*.txt",
	command = "set filetype=python",
})

require("lazy").setup({
	change_detection = {
		notify = false,
	},
	checker = { enabled = true },
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},

	---@type LazySpec
	spec = {

		{
			"e-q/okcolors.nvim",
			name = "okcolors",
			lazy = false, -- make sure we load this during startup if it is your main colorscheme
			priority = 1000, -- make sure to load this before all the other start plugins
			opts = {
				variant = "smooth", -- "smooth" or "sharp", defaults to "smooth"
			},
			config = function(_, opts)
				o.background = "light"
				require("okcolors").setup(opts)
				vim.cmd.colorscheme("okcolors")
			end,
		},

		{
			"norcalli/nvim-colorizer.lua",
			lazy = true,
			event = { "BufReadPre", "BufNewFile", "InsertEnter", "VeryLazy" },
			opts = {},
		},

		-- {
		-- 	enabled = false,
		-- 	"catppuccin/nvim",
		-- 	config = function()
		-- 		c.colorscheme("catppuccin")
		-- 	end,
		-- },

		{
			"saghen/blink.cmp",
			dependencies = { "rafamadriz/friendly-snippets", "nvim-tree/nvim-web-devicons" },
			version = "1.*",
			---@module 'blink.cmp'
			---@type blink.cmp.Config
			opts = {
				keymap = { preset = "super-tab" },
				cmdline = {
					keymap = { preset = "inherit" },
					completion = { menu = { auto_show = true } },
				},
				signature = { enabled = true },
				fuzzy = { implementation = "prefer_rust_with_warning" },
				sources = {
					default = { "lazydev", "lsp", "path", "snippets", "buffer" },
					providers = {
						lazydev = {
							name = "LazyDev",
							module = "lazydev.integrations.blink",
							score_offset = 100,
						},
					},
				},
			},
		},

		{
			"nvim-tree/nvim-tree.lua",
			lazy = false,
			version = "*",
			keys = {
				{
					"<leader>e",
					"<cmd>NvimTreeToggle<cr>",
					function() end,
				},
			},
			opts = {

				reload_on_bufenter = true,
				hijack_unnamed_buffer_when_opening = false,
				sync_root_with_cwd = true,
				update_focused_file = {
					enable = false,
					update_root = {
						enable = false,
						ignore_list = {},
					},
					exclude = false,
				},

				ui = { confirm = { default_yes = true } },
				actions = {
					change_dir = { enable = true, global = true },
				},
				renderer = {
					indent_width = 2,
					indent_markers = {
						enable = false,
					},
				},
				view = {
					centralize_selection = true,
					float = {
						enable = true,
						open_win_config = function()
							local screen_w = vim.opt.columns:get()
							local screen_h = vim.opt.lines:get() - vim.opt.cmdheight:get()
							local window_w = screen_w * WIDTH_RATIO
							local window_h = screen_h * HEIGHT_RATIO
							local window_w_int = math.floor(window_w)
							local window_h_int = math.floor(window_h)
							local center_x = (screen_w - window_w) / 2
							local center_y = ((vim.opt.lines:get() - window_h) / 2) - vim.opt.cmdheight:get()
							return {
								border = "rounded",
								relative = "editor",
								row = center_y,
								col = center_x,
								width = window_w_int,
								height = window_h_int,
							}
						end,
					},
					width = function()
						return math.floor(vim.opt.columns:get() * WIDTH_RATIO)
					end,
				},
				on_attach = function(bufnr)
					local api = require("nvim-tree.api")

					local function open_nvim_tree(data)
						local real_file = vim.fn.filereadable(data.file) == 1
						local no_name = data.file == "" and vim.bo[data.buf].buftype == ""
						if not real_file and not no_name then
							return
						end
						require("nvim-tree.api").tree.open({ focus = true, find_file = true })
						-- require("nvim-tree.api").tree.open({ focus = true, find_file = true, current_wind })
					end
					vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })

					local function edit_or_open()
						local node = api.tree.get_node_under_cursor()
						if node.nodes ~= nil then
							api.node.open.edit() -- expand or collapse folder
						else
							api.node.open.edit() -- open file
							api.tree.close() -- Close the tree if file was opened
						end
					end
					local function vsplit_preview() -- open as vsplit on current node
						local node = api.tree.get_node_under_cursor()
						if node.nodes ~= nil then
							api.node.open.edit() -- expand or collapse folder
						else
							api.node.open.vertical() -- open file as vsplit
						end
						api.tree.focus() -- Finally refocus on tree if it was lost
					end

					local function change_root_to_node(node)
						if node == nil then
							node = api.tree.get_node_under_cursor()
						end

						if node ~= nil and node.type == "directory" then
							vim.api.nvim_set_current_dir(node.absolute_path)
						end
						api.tree.change_root_to_node(node)
					end

					local function change_root_to_parent(node)
						local abs_path
						if node == nil then
							abs_path = api.tree.get_nodes().absolute_path
						else
							abs_path = node.absolute_path
						end

						local parent_path = vim.fs.dirname(abs_path)
						vim.api.nvim_set_current_dir(parent_path)
						api.tree.change_root(parent_path)
					end

					local tree_api = require("nvim-tree")
					local tree_view = require("nvim-tree.view")
					vim.api.nvim_create_augroup("NvimTreeResize", {
						clear = true,
					})
					vim.api.nvim_create_autocmd({ "VimResized" }, {
						group = "NvimTreeResize",
						callback = function()
							if tree_view.is_visible() then
								tree_view.close()
								tree_api.open()
							end
						end,
					})

					local function opts(desc)
						return {
							desc = "nvim-tree: " .. desc,
							buffer = bufnr,
							noremap = true,
							silent = true,
							nowait = true,
						}
					end

					local mappings = {
						-- BEGIN_DEFAULT_ON_ATTACH
						-- ["<C-]>"] = { api.tree.change_root_to_node, "CD" },
						-- ["<C-e>"] = { api.node.open.replace_tree_buffer, "Open: In Place" },
						["<C-k>"] = { api.node.show_info_popup, "Info" },
						["<C-r>"] = { api.fs.rename_sub, "Rename: Omit Filename" },
						["<C-t>"] = { api.node.open.tab, "Open: New Tab" },
						["<leader>l"] = { api.node.open.vertical, "Open: Vertical Split" },
						["<leader>j"] = { api.node.open.horizontal, "Open: Horizontal Split" },
						-- ["<BS>"] = { api.node.navigate.parent_close, "Close Directory" },
						["<CR>"] = { api.node.open.edit, "Open" },
						["<Tab>"] = { api.node.open.preview, "Open Preview" },
						[">"] = { api.node.navigate.sibling.next, "Next Sibling" },
						["<"] = { api.node.navigate.sibling.prev, "Previous Sibling" },
						-- ["."] = { api.node.run.cmd, "Run Command" },
						["-"] = { change_root_to_parent, "Up" },
						["a"] = { api.fs.create, "Create" },
						["bmv"] = { api.marks.bulk.move, "Move Bookmarked" },
						["B"] = { api.tree.toggle_no_buffer_filter, "Toggle No Buffer" },
						-- ["C"] = { api.tree.toggle_git_clean_filter, "Toggle Git Clean" },
						["[c"] = { api.node.navigate.git.prev, "Prev Git" },
						["]c"] = { api.node.navigate.git.next, "Next Git" },
						["d"] = { api.fs.remove, "Delete" },
						["D"] = { api.fs.trash, "Trash" },
						["E"] = { api.tree.expand_all, "Expand All" },
						["e"] = { api.fs.rename_basename, "Rename: Basename" },
						["]e"] = { api.node.navigate.diagnostics.next, "Next Diagnostic" },
						["[e"] = { api.node.navigate.diagnostics.prev, "Prev Diagnostic" },
						["g?"] = { api.tree.toggle_help, "Help" },
						["i"] = { api.tree.toggle_hidden_filter, "Toggle Dotfiles" },
						["I"] = { api.tree.toggle_gitignore_filter, "Toggle Git Ignore" },
						["J"] = { api.node.navigate.sibling.last, "Last Sibling" },
						["K"] = { api.node.navigate.sibling.first, "First Sibling" },
						["m"] = { api.marks.toggle, "Toggle Bookmark" },
						["o"] = { api.node.open.edit, "Open" },
						["O"] = { api.node.open.no_window_picker, "Open: No Window Picker" },
						["p"] = { api.fs.paste, "Paste" },
						["P"] = { api.node.navigate.parent, "Parent Directory" },
						["q"] = { api.tree.close, "Close" },
						["<esc>"] = { api.tree.close, "Close" },
						["r"] = { api.fs.rename, "Rename" },
						["R"] = { api.tree.reload, "Refresh" },
						["s"] = { api.node.run.system, "Run System" },
						["S"] = { api.tree.search_node, "Search" },
						["U"] = { api.tree.toggle_custom_filter, "Toggle Hidden" },
						["x"] = { api.fs.cut, "Cut" },
						["yy"] = { api.fs.copy.node, "Copy" },
						["yp"] = { api.fs.copy.absolute_path, "Copy Absolute Path" },
						["yn"] = { api.fs.copy.filename, "Copy Name" },
						["yr"] = { api.fs.copy.relative_path, "Copy Relative Path" },
						["<2-LeftMouse>"] = { api.node.open.edit, "Open" },
						["<2-RightMouse>"] = { change_root_to_node, "CD" },
						-- END_DEFAULT_ON_ATTACH

						-- Mappings migrated from view.mappings.list
						["l"] = { api.node.open.edit, "Open" },
						["h"] = { api.node.navigate.parent_close, "Close Directory" },
						["v"] = { api.node.open.vertical, "Open: Vertical Split" },
						["."] = { change_root_to_node, "CD" },
					}

					for keys, mapping in pairs(mappings) do
						vim.keymap.set("n", keys, mapping[1], opts(mapping[2]))
					end

					-- custom mappings
					k("n", "<BS>", change_root_to_parent, opts("Up"))
					k("n", "?", api.tree.toggle_help, opts("Help"))

					k("n", "l", edit_or_open, opts("Edit Or Open"))
					k("n", "L", vsplit_preview, opts("Vsplit Preview"))
					-- k("n", "h", api.tree.close, opts("Close"))
					k("n", "H", api.tree.collapse_all, opts("Collapse All"))

					k("n", "F", function(node)
						if node == nil then
							node = api.tree.get_node_under_cursor()
						end
						if node ~= nil and node.type == "directory" then
							Snacks.picker.files({ dirs = { node.absolute_path } })
						elseif node ~= nil then
							Snacks.picker.files({ dirs = { node.parent_path } })
						else
							Snacks.picker.files()
						end
					end, opts("Find files under directory"))

					k("n", "<leader>F", function(node)
						if node == nil then
							node = api.tree.get_node_under_cursor()
						end
						if node ~= nil and node.type == "directory" then
							vim.cmd.cd(node.absolute_path)
							Snacks.picker.files()
						elseif node ~= nil then
							vim.cmd.cd(node.parent_path)
							Snacks.picker.files()
						else
							Snacks.picker.files()
						end
					end, opts("Find files under directory"))

					k("n", "f", function()
						Snacks.picker.files()
					end, opts("Find files"))

					k("n", "z", function()
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
							confirm = function(picker, item)
								if item then
									vim.cmd.cd(Snacks.picker.util.dir(item))
									picker:close()
									require("nvim-tree.api").tree.open({ focus = true, find_file = true })
									-- Snacks.picker.files()
								else
									picker:close()
								end
							end,
						})
					end, opts("Collapse All"))
				end,
			},
			dependencies = {
				"nvim-tree/nvim-web-devicons",
			},
		},

		{

			"CRAG666/code_runner.nvim",
			keys = {
				{
					"<leader>ds",
					function()
						require("code_runner").run_code()
					end,
					{ desc = "Debug Start (Run Code)" },
				},
			},
			opts = {
				filetype = {
					ps1 = {
						"cd $dir &&",
						"powershell ./$fileName",
					},
					java = {
						"cd $dir &&",
						"javac $fileName &&",
						"java $fileNameWithoutExt",
					},
					python = "python3 -u",
					typescript = "deno run",
					rust = {
						"cd $dir &&",
						"rustc $fileName &&",
						"$dir/$fileNameWithoutExt",
					},
					cs = {
						"cd $dir &&",
						"dotnet run",
					},
					c = function(...)
						c_base = {
							"cd $dir &&",
							"gcc $fileName -o",
							"/tmp/$fileNameWithoutExt",
						}
						local c_exec = {
							"&& /tmp/$fileNameWithoutExt &&",
							"rm /tmp/$fileNameWithoutExt",
						}
						vim.ui.input({ prompt = "Add more args:" }, function(input)
							c_base[4] = input
							vim.print(vim.tbl_extend("force", c_base, c_exec))
							require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
						end)
					end,
				},
			},
		},

		{
			"stevearc/conform.nvim",
			event = {
				"BufWritePre",
			},
			dependencies = {
				"williamboman/mason.nvim",
				{ "zapling/mason-conform.nvim", opts = {} },
			},
			opts = {
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 3000,
					lsp_format = "fallback",
				},
				formatters_by_ft = {
					ps1 = { lsp_format = "prefer" },
					lua = { "stylua", stop_after_first = true },
					-- Conform will run multiple formatters sequentially
					python = { "black" },
					-- You can customize some of the format options for the filetype (:help conform.format)
					rust = { "rustfmt", lsp_format = "fallback" },
					-- Conform will run the first available formatter
					javascript = { "prettierd", "prettier", stop_after_first = true },
					-- toml = { "taplo" },
					json = { "fixjson", "prettier" },
					cs = { "csharpier" },
					yaml = { "yamlfix" }, -- "yamlfmt"
					-- norg = { command = "C:/Users/lalvarez/source/repos/norg-fmt/target/release/norg-fmt.exe" },
				},
			},
		},

		{
			"glacambre/firenvim",
			lazy = not vim.g.started_by_firenvim,
			module = false,
			build = function()
				vim.fn["firenvim#install"](0)
			end,
			-- ":call firenvim#install(0)", -- Old build
		},

		{
			"folke/lazydev.nvim",
			ft = "lua",
			---@alias lazydev.Library {path:string, words:string[], mods:string[]}
			---@alias lazydev.Library.spec string|{path:string, words?:string[], mods?:string[]}
			---@class lazydev.Config
			opts = {
				library = {
					"LazyVim",
					"lazy.nvim",
				},
				integrations = { cmp = false },
			},
		},

		{
			"junnplus/lsp-setup.nvim",
			event = { "BufReadPost", "BufNewFile", "VeryLazy" },
			cmd = { "LspInfo", "LspInstall", "LspUninstall" },
			dependencies = {
				{
					"j-hui/fidget.nvim",
					opts = {},
				},
				{
					"neovim/nvim-lspconfig",
					config = function()
						require("lspconfig").nushell.setup({})
					end,
				},
				"williamboman/mason.nvim",
				"williamboman/mason-lspconfig.nvim",
				{
					"rachartier/tiny-inline-diagnostic.nvim",
					keys = {
						{
							"<leader>ck",
							function()
								require("tiny-inline-diagnostic").toggle()
							end,
						},
					},
					opts = {
						preset = "powerline", -- "modern", "classic", "minimal", "powerline","ghost", "simple", "nonerdfont", "amongus"
						options = {
							throttle = 0,
							softwrap = 30,
							multilines = {
								enabled = true,
								always_show = true,
							},
							show_all_diags_on_cursorline = false,
							enable_on_insert = false,
							enable_on_select = false,
						},
					},
				},
			},
			opts = {
				default_mappings = false,
				settings = {
					vim.diagnostic.config({
						signs = {
							text = {
								[vim.diagnostic.severity.ERROR] = "󰅚 ",
								[vim.diagnostic.severity.WARN] = "󰀪 ",
								[vim.diagnostic.severity.INFO] = "󰋽 ",
								[vim.diagnostic.severity.HINT] = "󰌶 ",
							},
						},
						severity_sort = true,
						update_in_insert = false,
						virtual_text = false,
						underline = true,
						virtual_lines = false,
						float = { source = "if_many" },
					}),
				},
				inlay_hints = { enabled = true },
				-- capabilities = require("blink.cmp").get_lsp_capabilities({
				-- 	textDocument = {
				-- 		foldingRange = {
				-- 			dynamicRegistration = false,
				-- 			lineFoldingOnly = true,
				-- 		},
				-- 	},
				-- }),
				-- capabilities = vim.tbl_deep_extend(),
				-- "force",
				--     capabilities = vim.tbl_deep_extend(
				-- 	vim.lsp.protocol.make_client_capabilities(),
				-- 	{
				-- 		textDocument = {
				-- 			foldingRange = {
				-- 				dynamicRegistration = false,
				-- 				lineFoldingOnly = true,
				-- 			},
				-- 		},
				-- 	}
				-- ),
				mappings = {
					gd = "lua vim.lsp.buf.definition()",
					gt = "lua vim.lsp.buf.type_definition()",
					["<space>k"] = "lua vim.lsp.buf.hover()",
					-- ["K"] = "lua vim.lsp.buf.hover()",
					["<space>rn"] = "lua vim.lsp.buf.rename()",
					["<space>ca"] = "lua vim.lsp.buf.code_action()",
					["[d"] = "lua vim.diagnostic.goto_prev()",
					["]d"] = "lua vim.diagnostic.goto_next()",
				},

				on_attach = function(client, bufnr)
					local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
					local border = {
						{ "🭽", "FloatBorder" },
						{ "▔", "FloatBorder" },
						{ "🭾", "FloatBorder" },
						{ "▕", "FloatBorder" },
						{ "🭿", "FloatBorder" },
						{ "▁", "FloatBorder" },
						{ "🭼", "FloatBorder" },
						{ "▏", "FloatBorder" },
					}
					function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
						opts = opts or {}
						opts.border = opts.border or border
						return orig_util_open_floating_preview(contents, syntax, opts, ...)
					end
					vim.keymap.set("n", "K", function()
						-- vim.diagnostic.open_float()
						vim.lsp.buf.hover()
					end)
					vim.keymap.set("n", "gl", function()
						vim.diagnostic.open_float()
					end)
					vim.keymap.set("n", "gK", function()
						require("blink.cmp").show_signature()
					end)
					vim.keymap.set("i", "<c-k>", function()
						require("blink.cmp").show_signature()
					end)
				end,
				servers = {
					yamlls = {},
					jsonls = {},
					powershell_es = {},
					taplo = {},
					omnisharp = {},
					-- ruff = {},
					pylsp = {},
					lua_ls = {},
				},
			},
		},

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
			"HiPhish/rainbow-delimiters.nvim",
			event = { "BufReadPre", "BufNewFile", "InsertEnter", "VeryLazy" },
			config = function()
				require("rainbow-delimiters.setup").setup({})
			end,
		},

		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = {},
		},

		{
			"folke/snacks.nvim",
			event = "VeryLazy",
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
						Snacks.picker.grep({ need_search = false })
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
				{
					"<leader>b",
					function()
						Snacks.picker.buffers({
							on_show = function()
								vim.cmd.stopinsert()
							end,
						})
					end,
					desc = "Buffers",
				},
				{
					"<leader>Z",
					function()
						Snacks.picker.zoxide()
					end,
					desc = "Zoxide",
				},
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
							confirm = function(picker, item)
								if item then
									vim.cmd.cd(Snacks.picker.util.dir(item))
									picker:close()
									Snacks.picker.files()
								else
									picker:close()
								end
							end,
						})
					end,
					desc = "Projects",
				},
				{
					"<leader>O",
					function()
						Snacks.picker.recent()
					end,
					desc = "Recent",
				},
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
				{
					"<leader>H",
					function()
						Snacks.picker.help()
					end,
					desc = "Help Pages",
				},
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
			},
			---@module "snacks"
			---@type snacks.Config
			opts = {
				input = { enabled = true },
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
					layout = { preset = "vertical", preview = nil },
					-- layout = { preset = "select" },
					-- layout = { preset = "ivy", layout = { position = "bottom" } },
					-- layout = { preset = "ivy" },
					-- layout = { preset = "ivy_split" },
					-- layout = { preset = "default" },
					-- layout = { preset = "vscode" },
					-- layout = { preset = "dropdown" },
					-- layout = { preset = "bottom" },
					-- layout = { preset = "telescope" },
					win = {
						input = {
							keys = {
								["<Esc>"] = { "close", mode = { "n", "i" } },
							},
						},
					},
					sources = {
						git_status = {
							layout = { preset = "default" },
						},
					},
				},
			},
		},

		{
			"lewis6991/gitsigns.nvim",
			event = { "BufReadPre", "BufNewFile", "InsertEnter", "VeryLazy" },
			opts = {
				on_attach = function(bufnr)
					local gitsigns = require("gitsigns")

					local function map(mode, l, r, opts)
						opts = opts or {}
						opts.buffer = bufnr
						vim.keymap.set(mode, l, r, opts)
					end

					-- Navigation
					map("n", "]c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "]c", bang = true })
						else
							gitsigns.nav_hunk("next")
						end
					end)

					map("n", "[c", function()
						if vim.wo.diff then
							vim.cmd.normal({ "[c", bang = true })
						else
							gitsigns.nav_hunk("prev")
						end
					end)

					-- Actions
					map("n", "<leader>hs", gitsigns.stage_hunk)
					map("n", "<leader>hr", gitsigns.reset_hunk)

					map("v", "<leader>hs", function()
						gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)

					map("v", "<leader>hr", function()
						gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
					end)

					map("n", "<leader>hS", gitsigns.stage_buffer)
					map("n", "<leader>hR", gitsigns.reset_buffer)
					map("n", "<leader>hp", gitsigns.preview_hunk)
					map("n", "<leader>hi", gitsigns.preview_hunk_inline)

					map("n", "<leader>hb", function()
						gitsigns.blame_line({ full = true })
					end)

					map("n", "<leader>hd", gitsigns.diffthis)

					map("n", "<leader>hD", function()
						gitsigns.diffthis("~")
					end)

					map("n", "<leader>hQ", function()
						gitsigns.setqflist("all")
					end)
					map("n", "<leader>hq", gitsigns.setqflist)

					-- Toggles
					map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
					map("n", "<leader>td", gitsigns.preview_hunk_inline())
					map("n", "<leader>tw", gitsigns.toggle_word_diff)

					-- Text object
					map({ "o", "x" }, "ih", gitsigns.select_hunk)
				end,
			},
		},

		{
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
				lazy = true,
				version = "*",
				cmd = { "Neorg" },
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
							Snacks.picker.files({ dirs = { "~/notes/" } })
						end,
						desc = "Find Neorg Files",
					},
					{ "<leader>nw", "<cmd>Neorg workspace<cr>" },
					{
						"<leader>ne",
						"<cmd>NvimTreeToggle ~/notes/<cr>",
						desc = "Find Neorg Files",
					},
					{
						"<leader>nje",
						"<cmd>NvimTreeToggle ~/notes/journal/<cr>",
						desc = "Find Neorg Files",
					},
					{
						"<leader>nf",
						function()
							Snacks.picker.files({ dirs = { "~/notes/" }, exclude = { "*journal*" } })
						end,
						desc = "Find Neorg Files",
					},
					{
						"<leader>njf",
						function()
							Snacks.picker.files({ dirs = { "~/notes/journal/" }, sort = { fields = { "file" } } })
						end,
						desc = "Find Neorg Files",
					},
					{
						"<leader>ng",
						function()
							Snacks.picker.grep({ dirs = { "~/notes/" }, need_search = false })
						end,
						desc = "Grep Neorg Files",
					},
				},
				config = function()
					vim.api.nvim_create_autocmd("FileType", {
						group = vim.api.nvim_create_augroup("neorg_keymaps", { clear = true }),
						pattern = { "norg" },
						callback = function()
							k(
								"n",
								"<leader>tt",
								"<Plug>(neorg.qol.todo-items.todo.task-cycle)",
								{ buffer = true, silent = true }
							)
						end,
					})

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
		},

		{
			"MeanderingProgrammer/render-markdown.nvim",
			-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
			-- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
			dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
			ft = { "norg" },
			---@module 'render-markdown'
			---@type render.md.UserConfig
			opts = {
				file_types = { "norg", "markdown", "quarto" },
			},
		},
	},
})
