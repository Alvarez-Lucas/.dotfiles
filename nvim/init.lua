vim.loader.enable(true)
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local map = vim.keymap.set

-- local HEIGHT_RATIO = 0.8 -- Nvimtree
-- local WIDTH_RATIO = 0.5

g.mapleader = " "
g.maplocalleader = " "

-- print(vim.fn.isdirectory(vim.fn.argc(-1)(0)) == 0)

cmd("let &fcs='eob: '")
opt.cmdheight = 1
opt.inccommand = "split" -- Preview for substitute
opt.laststatus = 3 -- Global status line
opt.number = true -- Line numbers
opt.relativenumber = true -- Relative line numbers
opt.splitbelow = true -- Vertical split direction
opt.splitright = true -- Horizontal split direction
opt.expandtab = true --
opt.smarttab = true --
opt.ignorecase = true --
opt.smartcase = true --
opt.hlsearch = true --
opt.incsearch = true --
opt.signcolumn = "yes" --
opt.swapfile = false --
opt.wrap = true --
opt.linebreak = true --
opt.breakindent = true --
opt.shiftwidth = 2 --
opt.tabstop = 2 --
opt.cursorline = true --
opt.mouse = "" --
opt.scrolloff = 8 --
opt.sidescrolloff = 8 --
opt.termguicolors = true --
opt.showmode = false
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 250
opt.confirm = true
opt.virtualedit = "block"
opt.conceallevel = 2 -- Hide * markup for bold and italic, but not markers with substitutions
opt.autowriteall = true -- Enable auto write
opt.autoread = true -- Enable auto write
opt.hidden = true

opt.iskeyword:append("-")
-- opt.shortmess:append({ I = true }) -- Removes the nvim splash screen
opt.shortmess:append({ W = true, I = true, c = true, C = true })
opt.jumpoptions = "view" -- TODO: Test
opt.grepprg = "rg --vimgrep" -- Does this work?
-- vim.opt.shortmess = "" -- What do?
-- vim.opt.fillchars = { eob = " " } -- Remove end of buffer character

-- What does this do?
-- Don't have `o` add a comment
-- opt.formatoptions:remove "o"
-- g.netrw_keepdir = 0
-- g.netrw_winsize = 30
-- g.netrw_banner = 0
-- g.netrw_localcopydircmd = "cp -r"

local defaultOpts = { noremap = true, silent = true }

-- Delete a buffer
-- vim.keymap.set("", "<leader>d", "<cmd>bdelete<cr>", defaultOpts)
-- map("n", "<C-s>", "<cms>w<cr>", defaultOpts)
-- map("n", "<leader>s", "<cmd>w<cr>", defaultOpts)
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
	map("n", "<C-=>", function()
		change_scale_factor(1.25)
	end)
	map("n", "<C-->", function()
		change_scale_factor(1 / 1.25)
	end)
end

-- System clipboard
map({ "n", "v" }, "<leader>y", '"+y', defaultOpts) -- yank motion
map({ "n", "v" }, "<leader>Y", '"+Y', defaultOpts) -- yank line
map({ "n", "v" }, "<leader>d", '"+d', defaultOpts) -- delete motion
map({ "n", "v" }, "<leader>D", '"+D', defaultOpts) -- delete line
map("n", "<leader>p", '"+p', defaultOpts) -- paste after cursor
map("n", "<leader>P", '"+P', defaultOpts) -- paste before cursor
map("v", "<leader>p", '"+p', defaultOpts)
map("n", "<Leader>xy", "<cmd>call setreg('+', getreg('@'))<CR>", defaultOpts)

map("n", "<c-d>", "<c-d>zz", defaultOpts) -- Keep cursor line centered on page scroll
map("n", "<c-u>", "<c-u>zz", defaultOpts)

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "J", "mzJ`z") -- TODO: Decide if this is worth it

-- better up/down TODO: Still testing
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

map("n", "<Esc>", "<cmd>nohlsearch<cr>", defaultOpts)

map("v", "p", '"_dP', defaultOpts) -- Keep register after paste

map("v", "Y", "y$", defaultOpts) -- Yank to end of line

map("v", "<", "<gv")
map("v", ">", ">gv")

-- TODO: Add todo plugin and snack binding for todos and jumps for todos

-- TODO: Add formatting keybind
-- -- formatting
-- map({ "n", "v" }, "<leader>cf", function()
-- 	LazyVim.format({ force = true })
-- end, { desc = "Format" })

-- TODO: Test this
-- if vim.lsp.inlay_hint then
-- 	Snacks.toggle.inlay_hints():map("<leader>uh")
-- end

-- map("n", "<leader>ui", vim.show_pos, { desc = "Inspect Pos" })
-- map("n", "<leader>uI", function()
-- 	vim.treesitter.inspect_tree()
-- 	vim.api.nvim_input("I")
-- end, { desc = "Inspect Tree" })

-- better indenting

map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })
map("n", "ycc", "yygccp", { remap = true, desc = "Copy And Comment" })

map("n", "<leader>xl", function()
	local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
	if not success and err then
		vim.notify(err, vim.log.levels.ERROR)
	end
end, { desc = "Location List" })

-- -- quickfix list
map("n", "<leader>xq", function()
	local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
	if not success and err then
		vim.notify(err, vim.log.levels.ERROR)
	end
end, { desc = "Quickfix List" })

map("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
map("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

map("v", "J", ":m '>+1<cr>gv=gv") -- Move Text
map("v", "K", ":m '<-2<cr>gv=gv")

map("n", "<bs>", "<C-^>", defaultOpts) -- Quick switch to previous buffer

map("n", "H", "<cmd>bprevious<cr>", defaultOpts) -- Navidate buffers
map("n", "L", "<cmd>bnext<cr>", defaultOpts)

map("n", "<leader>bn", "<cmd>enew<cr>", defaultOpts)

-- Tabs
map("n", "<leader>th", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<S-tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
map("n", "<leader>tw", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })

-- map("t", "<C-h>", "<C-\\><C-N><C-w>h", defaultOpts) -- Navigate terminal
-- map("t", "<C-j>", "<C-\\><C-N><C-w>j", defaultOpts)
-- map("t", "<C-k>", "<C-\\><C-N><C-w>k", defaultOpts)
-- map("t", "<C-l>", "<C-\\><C-N><C-w>l", defaultOpts)
--
-- map("n", "<C-h>", "<C-w><C-h>", defaultOpts) -- Navigate split
-- map("n", "<C-j>", "<C-w><C-j>", defaultOpts)
-- map("n", "<C-k>", "<C-w><C-k>", defaultOpts)
-- map("n", "<C-l>", "<C-w><C-l>", defaultOpts)

map("t", "<left>", "<C-\\><C-N><C-w>h", defaultOpts) -- Navigate terminal
map("t", "<down>", "<C-\\><C-N><C-w>j", defaultOpts)
map("t", "<up>", "<C-\\><C-N><C-w>k", defaultOpts)
map("t", "<right>", "<C-\\><C-N><C-w>l", defaultOpts)

map("n", "<left>", "<C-w><C-h>", defaultOpts) -- Navigate split
map("n", "<down>", "<C-w><C-j>", defaultOpts)
map("n", "<up>", "<C-w><C-k>", defaultOpts)
map("n", "<right>", "<C-w><C-l>", defaultOpts)

map("n", "<leader>oL", "<cmd>set splitright<cr><cmd>vsplit<cr>", defaultOpts) -- Create veritcal and horizontal split
map("n", "<leader>oJ", "<cmd>set splitbelow<cr><cmd>split<cr>", defaultOpts)
map("n", "<leader>oK", "<cmd>set nosplitright<cr><cmd>split<cr><C-w><c-k>", defaultOpts)
map("n", "<leader>oH", "<cmd>set nosplitbelow<cr><cmd>vsplit<cr><C-w><c-h>", defaultOpts)

map("n", "<C-Up>", "<cmd>resize -5<CR>", defaultOpts) -- Resize split
map("n", "<C-Down>", "<cmd>resize +5<CR>", defaultOpts)
map("n", "<C-Left>", "<cmd>vertical resize -5<CR>", defaultOpts)
map("n", "<C-Right>", "<cmd>vertical resize +5<CR>", defaultOpts)

map("t", "<Esc>", "<C-\\><C-N>", defaultOpts)
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

map("n", "<leader>l", "<cmd>Lazy<cr>", defaultOpts)

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
opt.rtp:prepend(lazypath)

local lazy_file_events = { "BufReadPost", "BufNewFile", "BufWritePre" }

local function lazy_file()
	-- Add support for the LazyFile event
	local Event = require("lazy.core.handler.event")

	-- We'll handle delayed execution of events ourselves
	Event.mappings.LazyFile = { id = "LazyFile", event = "User", pattern = "LazyFile" }
	Event.mappings["User LazyFile"] = Event.mappings.LazyFile

	local events = {} ---@type {event: string, buf: number, data?: any}[]

	local done = false
	local function load()
		if #events == 0 or done then
			return
		end
		done = true
		vim.api.nvim_del_augroup_by_name("lazy_file")

		---@type table<string,string[]>
		local skips = {}
		for _, event in ipairs(events) do
			skips[event.event] = skips[event.event] or Event.get_augroups(event.event)
		end

		vim.api.nvim_exec_autocmds("User", { pattern = "LazyFile", modeline = false })
		for _, event in ipairs(events) do
			if vim.api.nvim_buf_is_valid(event.buf) then
				Event.trigger({
					event = event.event,
					exclude = skips[event.event],
					data = event.data,
					buf = event.buf,
				})
				if vim.bo[event.buf].filetype then
					Event.trigger({
						event = "FileType",
						buf = event.buf,
					})
				end
			end
		end
		vim.api.nvim_exec_autocmds("CursorMoved", { modeline = false })
		events = {}
	end

	-- schedule wrap so that nested autocmds are executed
	-- and the UI can continue rendering without blocking
	load = vim.schedule_wrap(load)

	vim.api.nvim_create_autocmd(lazy_file_events, {
		group = vim.api.nvim_create_augroup("lazy_file", { clear = true }),
		callback = function(event)
			table.insert(events, event)
			load()
		end,
	})
end
lazy_file()

vim.api.nvim_create_autocmd("BufWinEnter", {
	group = vim.api.nvim_create_augroup("help_files_buffer", {}),
	desc = "Open Help files in new buffer",
	pattern = "*",
	callback = function(event)
		if vim.bo[event.buf].filetype == "help" then
			cmd.only()
			vim.bo[event.buf].buflisted = true
			vim.bo[event.buf].bt = "nowrite"
			cmd("Helpview attach")
		end
	end,
})
--     function()
-- vim.cmd([[nohlsearch \| lua Snacks.bufdelete()]])
-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = vim.api.nvim_create_augroup("help_files_keymaps", {}),
-- 	desc = "Add keymaps to help files",
-- 	pattern = "help",
-- 	callback = function(event)
-- 		map("n", "<esc>", function()
-- 			if vim.v.hlsearch == 1 then
-- 				vim.cmd("nohlsearch")
-- 			else
-- 				Snacks.bufdelete()
-- 			end
-- 			-- local ok, result = pcall(function()
-- 			-- 	if vim.v.hlsearch == 1 then
-- 			-- 		vim.cmd("nohlsearch")
-- 			-- 	else
-- 			-- 		Snacks.bufdelete()
-- 			-- 	end
-- 			-- end)
-- 			-- if not ok then
-- 			-- 	Snacks.bufdelete()
-- 			-- end
-- 		end, { buffer = event.buf })
--
-- 		map("n", "q", function()
-- 			Snacks.bufdelete()
-- 		end, { buffer = event.buf })
-- 	end,
-- })

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
	group = vim.api.nvim_create_augroup("auto_create_dir", {}),
	callback = function(event)
		if event.match:match("^%w%w+:[\\/][\\/]") then
			return
		end
		local file = vim.uv.fs_realpath(event.match) or event.match
		vim.fn.mkdir(vim.fn.fnamemodify(file, ":p:h"), "p")
	end,
})

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

-- vim.api.nvim_create_autocmd("FileType", {
-- 	group = vim.api.nvim_create_augroup("open_help_files_tab", { clear = true }),
-- 	pattern = "help",
-- 	callback = function(event)
-- 		-- vim.cmd("wincmd T", { silent = true })
-- 		if vim.bo[event.buf].filetype == "help" then
-- 			cmd.only()
-- 			vim.bo[event.buf].buflisted = true
-- 			vim.bo[event.buf].bt = "nowrite"
-- 		end
-- 	end,
-- })

-- Close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"lspinfo",
		"notify",
		"help",
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

-- Fix conceallevel for json files
vim.api.nvim_create_autocmd({ "FileType" }, {
	group = vim.api.nvim_create_augroup("coneal", { clear = true }),
	pattern = { "json", "jsonc", "json5" },
	callback = function()
		vim.opt_local.conceallevel = 0
	end,
})

require("lazy").setup({
	defaults = {
		version = false,
		lazy = true,
	},
	change_detection = {
		notify = false,
	},
	checker = { enabled = true },
	ui = {
		border = "rounded",
		title = " Lazy Nvim ",
	},
	-- profiling = { require = true },
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

	-- Plugin Specs
	---@type LazySpec
	spec = {

		{
			"e-q/okcolors.nvim",
			name = "okcolors",
			lazy = false,
			priority = 1000,
			opts = {
				variant = "smooth",
			},
			config = function(_, opts)
				vim.api.nvim_create_autocmd("ColorScheme", {
					group = vim.api.nvim_create_augroup("custom_highlights_okcolors", {}),
					pattern = "okcolors",
					callback = function()
						local pallete = {
							bg = "#fefcf4",
							surface = "#f4f2ea",
							overlay = "#e7e4dd",
							hilite_lo = "#eeebe4",
							hilite_mid = "#d0cec7",
							hilite_hi = "#b0aea7",
							muted = "#707175",
							subtle = "#53555b",
							tx = "#2c2e33",
							black = "#202127",
							dark_grey = "#383a40",
							lite_grey = "#c0bdb7",
							white = "#e0ded7",
							red = "#d7314b",
							orange = "#a8693d",
							yellow = "#91772a",
							green = "#4b8b5a",
							cyan = "#028a9b",
							blue = "#6377b6",
							purple = "#896aa9",
							magenta = "#c3399b",
						}

						-- Borders
						vim.api.nvim_set_hl(0, "FloatBorder", { fg = pallete.blue, bg = pallete.bg })
						vim.api.nvim_set_hl(0, "FloatTitle", { fg = pallete.blue, bg = pallete.bg })

						-- Status Line
						vim.api.nvim_set_hl(0, "StatusLine", { bg = pallete.bg })

						-- Snacks
						vim.api.nvim_set_hl(0, "SnacksPicker", { bg = pallete.bg })
						vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = pallete.blue, bg = pallete.bg })
						vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = pallete.blue, bg = pallete.bg })
						vim.api.nvim_set_hl(0, "SnacksPickerTitle", { fg = pallete.blue, bg = pallete.bg })

						-- Neotree
						vim.api.nvim_set_hl(0, "NeoTreeFloatTitle", { fg = pallete.blue, bg = pallete.bg })
						vim.api.nvim_set_hl(0, "NeoTreeFloatNormal", { bg = pallete.bg })
						vim.api.nvim_set_hl(0, "NeoTreeFloatBorder", { fg = pallete.blue, bg = pallete.bg })
						vim.api.nvim_set_hl(0, "NeoTreeRootName", { link = "Title" })

						-- TreesitterContext
						vim.api.nvim_set_hl(0, "TreesitterContext", { bg = pallete.surface })

						-- Lazy
						vim.api.nvim_set_hl(0, "LazyBackdrop", { bg = pallete.bg })
						vim.api.nvim_set_hl(0, "LazyNormal", { bg = pallete.bg })

						-- indent-blankline
						vim.api.nvim_set_hl(0, "IblIndent", { fg = pallete.hilite_mid })
						vim.api.nvim_set_hl(0, "IblScope", { fg = pallete.cyan })

						vim.api.nvim_set_hl(0, "Headline1", { bg = "#f4feff" })
						vim.api.nvim_set_hl(0, "Headline2", { bg = "#fefaff" })
						vim.api.nvim_set_hl(0, "Headline3", { bg = "#f4feff" })
						vim.api.nvim_set_hl(0, "Headline4", { bg = "#f7fef8" })
						vim.api.nvim_set_hl(0, "Headline5", { bg = "#fefaff" })
						vim.api.nvim_set_hl(0, "Headline6", { bg = "#f4feff" })
						-- vim.api.nvim_set_hl(0, "CodeBlock", { fg = pallete.cyan })
						vim.api.nvim_set_hl(0, "Dash", { fg = pallete.blue })

						-- vim.cmd [[highlight Headline1 guibg=#1e2718]]
						-- vim.cmd [[highlight Headline2 guibg=#21262d]]
						-- vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
						-- vim.cmd [[highlight Dash guibg=#D19A66 gui=bold]]

						-- Harpoon
						vim.api.nvim_create_autocmd("FileType", {
							group = vim.api.nvim_create_augroup("harpoon_okcolors_highlight", { clear = true }),
							pattern = { "harpoon" },
							callback = function()
								local ns_id = vim.api.nvim_create_namespace("harpoon_okcolors_highlight")
								vim.api.nvim_set_hl_ns(ns_id)
								vim.api.nvim_set_hl(ns_id, "NormalFloat", { bg = pallete.bg })
							end,
						})

						vim.api.nvim_create_autocmd("FileType", {
							group = vim.api.nvim_create_augroup("undotree_okcolors_highlight", { clear = true }),
							pattern = { "undotree" },
							callback = function()
								local ns_id = vim.api.nvim_create_namespace("undotree_okcolors_highlight")
								vim.api.nvim_set_hl_ns(ns_id)
								vim.api.nvim_set_hl(ns_id, "NormalFloat", { bg = pallete.bg })
							end,
						})
					end,
				})
				opt.background = "light"
				require("okcolors").setup(opts)
				cmd.colorscheme("okcolors")
			end,
		},

		{ "nvim-lua/plenary.nvim" },
		{ "MunifTanjim/nui.nvim" },
		{ "nvim-tree/nvim-web-devicons" }, -- Blink.cmp,
		{ "williamboman/mason.nvim", opts = {} },

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
			"saghen/blink.cmp",
			event = { "VeryLazy", "InsertEnter" },
			dependencies = { "rafamadriz/friendly-snippets" },
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
			"nvim-neo-tree/neo-tree.nvim",
			branch = "v3.x",
			cmd = "Neotree",
			keys = {
				{ "<leader>e", "<cmd>Neotree source=filesystem action=focus toggle=true position=left<cr>" },
				{
					"<leader>E",
					"<cmd>Neotree source=filesystem action=focus toggle=true reveal=true position=left<cr>",
				},
				{ "<leader>g", "<cmd>Neotree source=git_status action=focus toggle=true position=left<cr>" },
				-- { "<leader>cs", "<cmd>Neotree toggle float reveal symbols<cr>" },
				{ "<leader>.", "<cmd>Neotree source=buffers toggle=true reveal=true position=left<cr>" },
				{
					"<leader>ne",
					"<cmd>Neotree focus float dir=~/notes/<cr>",
					desc = "Find Neorg Files",
				},
				{
					"<leader>nje",
					"<cmd>Neotree focus float dir=~/notes/journal/<cr>",
					desc = "Find Neorg Files",
				},
			},
			init = function()
				-- Lazy load on open of directory to hijack netrw (https://www.lazyvim.org/extras/editor/neo-tree)
				vim.api.nvim_create_autocmd("BufEnter", {
					group = vim.api.nvim_create_augroup("Neotree_start_directory", { clear = true }),
					desc = "Start Neo-tree with directory",
					once = true,
					callback = function()
						if package.loaded["neo-tree"] then
							return
						else
							local stats = vim.uv.fs_stat(vim.fn.argv(0))
							if stats and stats.type == "directory" then
								require("neo-tree")
							end
						end
					end,
				})
			end,
			---@module "neo-tree"
			---@type neotree.Config?
			opts = {
				sources = {
					"filesystem",
					"buffers",
					"git_status",
				},
				use_popups_for_input = true,
				-- enable_normal_mode_for_inputs = true, -- TODO: Find alternative
				retain_hidden_root_indent = true,
				popup_border_style = "rounded",
				sort_case_insensitive = true,
				window = {
					mappings = {
						["E"] = function()
							vim.api.nvim_exec2("Neotree action=close", { output = true })
							vim.api.nvim_exec2(
								"Neotree action=focus source=filesystem reveal=true position=left",
								{ output = true }
							)
						end,
						["e"] = function()
							vim.api.nvim_exec2(
								"Neotree action=focus source=filesystem position=left",
								{ output = true }
							)
						end,
						["b"] = function()
							vim.api.nvim_exec2(
								"Neotree action=focus source=buffers position=left reveal=true",
								{ output = true }
							)
						end,
						["gs"] = function()
							vim.api.nvim_exec2(
								"Neotree action=focus source=git_status position=left",
								{ output = true }
							)
						end,
						["h"] = function(state)
							local node = state.tree:get_node()
							if node.type == "directory" and node:is_expanded() then
								require("neo-tree.sources.filesystem").toggle_directory(state, node)
							else
								require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
							end
						end,
						["l"] = function(state)
							local node = state.tree:get_node()
							if node.type == "directory" then
								if not node:is_expanded() then
									require("neo-tree.sources.filesystem").toggle_directory(state, node)
								elseif node:has_children() then
									require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
								end
							else
								require("neo-tree.sources.filesystem.commands").open(state)
							end
						end,
						["/"] = "noop",
						["<esc>"] = function()
							require("neo-tree.command").execute({
								action = "close",
							})
						end,
					},
				},
				close_if_last_window = true,
				default_component_configs = {
					indent = {
						with_markers = false,
						with_expanders = true,
					},
					last_modified = {
						format = "relative",
					},
				},
				filesystem = {
					filtered_items = {
						visible = true,
						hide_dotfiles = false,
					},
					hijack_netrw_behavior = "open_current",
					use_libuv_file_watcher = true,
					async_directory_scan = "always",
					group_empty_dirs = true,
					find_by_full_path_words = true,
					window = {
						mappings = {
							["a"] = {
								"add",
								config = {
									show_path = "relative", -- "none", "relative", "absolute"
								},
							},
							["i"] = {
								"show_file_details",
								config = {
									created_format = "relative",
									modified_format = "relative",
								},
							},
						},
						fuzzy_finder_mappings = {
							["<C-j>"] = "move_cursor_down",
							["<C-k>"] = "move_cursor_up",
						},
					},
				},
				buffers = {
					follow_current_file = {
						enabled = true,
					},
					window = {
						mappings = {
							["d"] = "buffer_delete",
							["i"] = {
								"show_file_details",
								config = {
									created_format = "relative",
									modified_format = "relative",
								},
							},
						},
					},
				},
				event_handlers = {
					{
						event = "file_opened",
						handler = function(_)
							-- do something, the value of arg varies by event.
							vim.cmd("Neotree close")
						end,
					},
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
			config = function()
				vim.api.nvim_create_autocmd({ "BufEnter" }, {
					group = vim.api.nvim_create_augroup("firenvim_filetypes", { clear = true }),
					pattern = "leetcode.com_*.txt",
					command = "set filetype=python",
				})
			end,
			-- ":call firenvim#install(0)", -- Old build
		},

		-- {
		-- 	"junnplus/lsp-setup.nvim",
		-- 	event = { "LazyFile", "VeryLazy" },
		-- 	-- priority = 100,
		-- 	cmd = { "LspInfo", "LspInstall", "LspUninstall" },
		-- 	dependencies = {
		-- 		{
		-- 			opts = {},
		-- 		},
		-- 		{
		-- 			"neovim/nvim-lspconfig",
		-- 			config = function()
		-- 				require("lspconfig").nushell.setup({})
		-- 			end,
		-- 		},
		-- 		"williamboman/mason.nvim",
		-- 		"williamboman/mason-lspconfig.nvim",
		-- 		{
		-- 			"rachartier/tiny-inline-diagnostic.nvim",
		-- 			keys = {
		-- 				{
		-- 					"<leader>ck",
		-- 					function()
		-- 						require("tiny-inline-diagnostic").toggle()
		-- 					end,
		-- 				},
		-- 			},
		-- 			opts = {
		-- 				preset = "powerline", -- "modern", "classic", "minimal", "powerline","ghost", "simple", "nonerdfont", "amongus"
		-- 				options = {
		-- 					throttle = 0,
		-- 					softwrap = 30,
		-- 					multilines = {
		-- 						enabled = true,
		-- 						always_show = true,
		-- 					},
		-- 					show_all_diags_on_cursorline = false,
		-- 					enable_on_insert = false,
		-- 					enable_on_select = false,
		-- 				},
		-- 			},
		-- 		},
		-- 	},
		-- 	opts = {
		-- 		default_mappings = false,
		-- 		settings = {
		-- 			vim.diagnostic.config({
		-- 				signs = {
		-- 					text = {
		-- 						[vim.diagnostic.severity.ERROR] = "󰅚 ",
		-- 						[vim.diagnostic.severity.WARN] = "󰀪 ",
		-- 						[vim.diagnostic.severity.INFO] = "󰋽 ",
		-- 						[vim.diagnostic.severity.HINT] = "󰌶 ",
		-- 					},
		-- 				},
		-- 				severity_sort = true,
		-- 				update_in_insert = false,
		-- 				virtual_text = false,
		-- 				underline = true,
		-- 				virtual_lines = false,
		-- 				float = { source = "if_many" },
		-- 			}),
		-- 		},
		-- 		inlay_hints = { enabled = true },
		-- 		-- capabilities = require("blink.cmp").get_lsp_capabilities(),
		-- 		-- {
		-- 		-- 					textDocument = {
		-- 		-- 						foldingRange = {
		-- 		-- 							dynamicRegistration = false,
		-- 		-- 							lineFoldingOnly = true,
		-- 		-- 						},
		-- 		-- 					},
		-- 		-- 				}
		-- 		mappings = {
		-- 			gd = "lua vim.lsp.buf.definition()",
		-- 			gt = "lua vim.lsp.buf.type_definition()",
		-- 			["<space>k"] = "lua vim.lsp.buf.hover()",
		-- 			-- ["K"] = "lua vim.lsp.buf.hover()",
		-- 			["<space>rn"] = "lua vim.lsp.buf.rename()",
		-- 			["<space>ca"] = "lua vim.lsp.buf.code_action()",
		-- 			["[d"] = "lua vim.diagnostic.goto_prev()",
		-- 			["]d"] = "lua vim.diagnostic.goto_next()",
		-- 		},
		--
		-- 		on_attach = function(client, bufnr)
		-- 			local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
		-- 			local border = {
		-- 				{ "🭽", "FloatBorder" },
		-- 				{ "▔", "FloatBorder" },
		-- 				{ "🭾", "FloatBorder" },
		-- 				{ "▕", "FloatBorder" },
		-- 				{ "🭿", "FloatBorder" },
		-- 				{ "▁", "FloatBorder" },
		-- 				{ "🭼", "FloatBorder" },
		-- 				{ "▏", "FloatBorder" },
		-- 			}
		-- 			function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		-- 				opts = opts or {}
		-- 				opts.border = opts.border or border
		-- 				return orig_util_open_floating_preview(contents, syntax, opts, ...)
		-- 			end
		--
		-- 			vim.keymap.set("n", "K", function()
		-- 				-- vim.diagnostic.open_float()
		-- 				vim.lsp.buf.hover()
		-- 			end)
		-- 			vim.keymap.set("n", "gl", function()
		-- 				vim.diagnostic.open_float()
		-- 			end)
		-- 			vim.keymap.set("n", "gK", function()
		-- 				require("blink.cmp").show_signature()
		-- 			end)
		-- 			vim.keymap.set("i", "<c-k>", function()
		-- 				require("blink.cmp").show_signature()
		-- 			end)
		-- 		end,
		-- 		servers = {
		-- 			yamlls = {},
		-- 			jsonls = {},
		-- 			powershell_es = {},
		-- 			taplo = {},
		-- 			omnisharp = {},
		-- 			-- ruff = {},
		-- 			pylsp = {},
		-- 			lua_ls = {},
		-- 		},
		-- 	},
		-- },

		{
			"nvim-treesitter/nvim-treesitter", --nvim-treesitter/nvim-treesitter-context, HiPhish/rainbow-delimiters.nvim, windwp/nvim-autopairs
			event = { "LazyFile", "VeryLazy" },
			lazy = vim.fn.argc(-1) == 0, -- load early when opening a file from the cmdline
			init = function(plugin)
				-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
				-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
				-- no longer trigger the **nvim-treesitter** module to be loaded in time.
				-- Luckily, the only things that those plugins need are the custom queries, which we make available
				-- during startup.
				require("lazy.core.loader").add_to_rtp(plugin)
				require("nvim-treesitter.query_predicates")
			end,
			build = ":TSUpdate",
			config = function()
				require("nvim-treesitter.install").prefer_git = false
				require("nvim-treesitter.install").compilers = { "gcc" }
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
			"nvim-treesitter/nvim-treesitter-context",
			event = { "LazyFile", "VeryLazy" },
			lazy = vim.fn.argc(-1) == 0, -- load early when opening a file from the cmdline
			opts = {
				mode = "topline",
			},
		},

		{
			"HiPhish/rainbow-delimiters.nvim",
			event = { "LazyFile", "VeryLazy" },
			lazy = vim.fn.argc(-1) == 0, -- load early when opening a file from the cmdline
			config = function()
				require("rainbow-delimiters.setup").setup({})
			end,
		},

		{
			"norcalli/nvim-colorizer.lua",
			event = { "LazyFile", "VeryLazy" },
			lazy = vim.fn.argc(-1) == 0, -- load early when opening a file from the cmdline
			config = function()
				require("colorizer").setup({ "*" })
			end,
		},

		{
			"lukas-reineke/indent-blankline.nvim",
			event = { "VeryLazy", "LazyFile" },
			lazy = vim.fn.argc(-1) == 0, -- load early when opening a file from the cmdline
			main = "ibl",
			config = function()
				-- local highlight = {
				-- 	"RainbowRed",
				-- 	"RainbowYellow",
				-- 	"RainbowBlue",
				-- 	"RainbowOrange",
				-- 	"RainbowGreen",
				-- 	"RainbowViolet",
				-- 	"RainbowCyan",
				-- }
				-- local hooks = require("ibl.hooks")
				-- create the highlight groups in the highlight setup hook, so they are reset
				-- every time the colorscheme changes
				-- hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
				-- 	vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
				-- 	vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
				-- 	vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
				-- 	vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
				-- 	vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
				-- 	vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
				-- 	vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
				-- end)

				require("ibl").setup({
					scope = { enabled = true },
					indent = {
						-- https://graphemica.com/%E2%96%8F#glyphs
						-- char = "│",
						char = "▏",
					},
				})
			end,
		},

		{
			"folke/todo-comments.nvim",
			event = { "LazyFile" },
			opts = {
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			},
			keys = {
				{
					"]t",
					function()
						require("todo-comments").jump_next()
					end,
					desc = "Next Todo Comment",
				},
				{
					"[t",
					function()
						require("todo-comments").jump_prev()
					end,
					desc = "Previous Todo Comment",
				},
				-- {
				-- 	"<leader>st",
				-- 	function()
				-- 		require("snacks").picker.todo_comments()
				-- 	end,
				-- 	desc = "Todo",
				-- },
				-- {
				-- 	"<leader>sT",
				-- 	function()
				-- 		require("snacks").picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } })
				-- 	end,
				-- 	desc = "Todo/Fix/Fixme",
				-- },
			},
		},

		{
			enabled = false,
			"folke/noice.nvim",
			event = "VeryLazy",
			dependencies = {
				"MunifTanjim/nui.nvim",
				"rcarriga/nvim-notify",
			},
			opts = {
				presets = { bottom_search = true },
			},
		},

		{
			"williamboman/mason-lspconfig.nvim",
			dependencies = "williamboman/mason.nvim",
			event = "VeryLazy",
			opts = {
				ensure_installed = {
					"jsonls",
					"lua_ls",
					"omnisharp",
					"powershell_es",
					"pylsp",
					"taplo",
					"yamlls",
					-- ruff = {},
				},
			},
		},

		{
			"neovim/nvim-lspconfig",
			dependencies = {
				"williamboman/mason-lspconfig.nvim", -- Install servers automatically
				-- "saghen/blink.cmp", -- Advertise completion capabilities
				{ "j-hui/fidget.nvim", opts = {} }, -- Loading Progress
				"folke/noice.nvim",
			},
			event = "LazyFile",
			config = function()
				vim.api.nvim_create_autocmd("LspAttach", {
					group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
					callback = function(event)
						map("n", "grr", function()
							require("snacks.picker").lsp_references()
						end, { buffer = event.buf, desc = "[G]oto [R]eferences" })

						map("n", "gra", function()
							vim.lsp.buf.code_action()
						end, { buffer = event.buf, desc = "[G]oto Code [A]ction" })

						map("n", "grr", function()
							require("snacks.picker").lsp_references()
						end, { buffer = event.buf, desc = "[G]oto [R]eferences" })

						map("n", "gri", function()
							require("snacks.picker").lsp_implementations()
						end, { buffer = event.buf, desc = "[G]oto [I]mplementation" })

						map("n", "grd", function()
							require("snacks.picker").lsp_definitions()
						end, { buffer = event.buf, desc = "[G]oto [D]efinition" })

						map("n", "grD", function()
							require("snacks.picker").lsp_declarations()
						end, { buffer = event.buf, desc = "[G]oto [D]eclaration" })

						map("n", "grt", function()
							require("snacks.picker").lsp_type_definitions()
						end, { buffer = event.buf, desc = "[G]oto [T]ype Definition" })

						map("n", "gO", function()
							require("snacks.picker").lsp_symbols()
						end, { buffer = event.buf, desc = "Open Document Symbols" })

						map("n", "gW", function()
							require("snacks.picker").lsp_workspace_symbols()
						end, { buffer = event.buf, desc = "Open Workspace Symbols" })
						-- - "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
						--
						-- TODO: Consider
						map("n", "gl", function()
							vim.diagnostic.open_float()
						end, { buffer = event.buf })
						--
						--diagnostic.open_float
						-- 			vim.keymap.set("n", "K", function()
						-- 				-- vim.diagnostic.open_float()
						-- 				vim.lsp.buf.hover()
						-- 			end)
						-- 			vim.keymap.set("n", "gl", function()
						-- 				vim.diagnostic.open_float()
						-- 			end)
						-- 			vim.keymap.set("n", "gK", function()
						-- 				require("blink.cmp").show_signature()
						-- 			end)
						-- 			vim.keymap.set("i", "<c-k>", function()
						-- 				require("blink.cmp").show_signature()
						-- 			end)

						-- When you move your cursor, the highlights will be cleared (the second autocommand).
						local client = vim.lsp.get_client_by_id(event.data.client_id)
						if
							client
							and client:supports_method(
								vim.lsp.protocol.Methods.textDocument_documentHighlight,
								event.buf
							)
						then
							local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
							vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
								buffer = event.buf,
								group = highlight_augroup,
								callback = vim.lsp.buf.document_highlight,
							})

							vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
								buffer = event.buf,
								group = highlight_augroup,
								callback = vim.lsp.buf.clear_references,
							})

							vim.api.nvim_create_autocmd("LspDetach", {
								group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
								callback = function(event2)
									vim.lsp.buf.clear_references()
									vim.api.nvim_clear_autocmds({
										group = "lsp-highlight",
										buffer = event2.buf,
									})
								end,
							})
						end

						if
							client
							and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
						then
							map("n", "<leader>th", function()
								vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({
									bufnr = event.buf,
									desc = "[T]oggle Inlay [H]ints",
								}))
							end, { buffer = event.buf, desc = "Open Workspace Symbols" })
						end
					end,
				})

				-- https://www.lazyvim.org/plugins/lsp -- TODO: check this out for the default server options
				local capabilities = require("blink.cmp").get_lsp_capabilities()
				vim.lsp.config("*", {
					capabilities = capabilities,
					root_markers = { ".git" },
					-- on_attach = function(client, bufnr) -- Consider converting to lsp config on_attach
					-- 	vim.lsp.completion.enable(true, client.id, bufnr, {
					-- 		autotrigger = true,
					-- 		convert = function(item)
					-- 			return { abbr = item.label:gsub("%b()", "") }
					-- 		end,
					-- 	})
					-- end,
				})

				vim.diagnostic.config({
					severity_sort = true,
					float = { border = "rounded", source = "if_many" },
					underline = { severity = vim.diagnostic.severity.ERROR },
					signs = {
						text = {
							[vim.diagnostic.severity.ERROR] = "󰅚", -- TODO: add space if using non mono version of icons
							[vim.diagnostic.severity.WARN] = "󰀪",
							[vim.diagnostic.severity.INFO] = "󰋽",
							[vim.diagnostic.severity.HINT] = "󰌶",
						},
					},
					virtual_text = {
						source = "if_many",
						spacing = 2,
						format = function(diagnostic)
							local diagnostic_message = {
								[vim.diagnostic.severity.ERROR] = diagnostic.message,
								[vim.diagnostic.severity.WARN] = diagnostic.message,
								[vim.diagnostic.severity.INFO] = diagnostic.message,
								[vim.diagnostic.severity.HINT] = diagnostic.message,
							}
							return diagnostic_message[diagnostic.severity]
						end,
					},
				})

				vim.lsp.enable("jsonls")
				vim.lsp.enable("lua_ls")
				vim.lsp.enable("omnisharp")
				vim.lsp.enable("powershell_es")
				vim.lsp.enable("pylsp")
				vim.lsp.enable("taplo")
				vim.lsp.enable("yamlls")
				-- ruff = {},
			end,
		},

		{
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			opts = {},
		},

		{
			"folke/snacks.nvim",
			ft = "help",
			keys = {
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
				{
					"<leader>m",
					function()
						Snacks.picker.notifications()
					end,
					desc = "Notification History",
				},
				{
					"<leader>sg",
					function()
						Snacks.picker.grep({ need_search = false })
					end,
					desc = "Grep",
				},
				{
					"<leader>sg",
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
					"<leader>w",
					function()
						Snacks.bufdelete()
					end,
					desc = "Delete Buffer",
				},
				{
					"<leader>bo",
					function()
						Snacks.bufdelete.other()
					end,
					desc = "Delete Other Buffers",
				},
				{
					"<leader>,",
					function()
						Snacks.picker.buffers({
							on_show = function()
								vim.cmd.stopinsert()
							end,
							-- filter = {
							-- 	cwd = ,
							-- },
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
									vim.cmd.tcd(Snacks.picker.util.dir(item))
									picker:close()
									-- Snacks.picker.files()
									vim.cmd("Neotree action=focus source=filesystem position=current")
								else
									picker:close()
								end
							end,
						})
					end,
					desc = "Projects",
				},
				{
					"<leader>sr",
					function()
						Snacks.picker.recent()
					end,
					desc = "Recent",
				},
				{
					"<leader>sk",
					function()
						Snacks.picker.keymaps()
					end,
					desc = "keymaps",
				},
				{
					"<leader>sm",
					function()
						Snacks.picker.marks()
					end,
					desc = "keymaps",
				},
				{
					"<leader>sM",
					function()
						Snacks.picker.notifications()
					end,
					desc = "keymaps",
				},
				{
					"<leader>su",
					function()
						Snacks.picker.undo()
					end,
					desc = "Undo History",
				},
				{
					'<leader>s"',
					function()
						Snacks.picker.registers()
					end,
					desc = "Registers",
				},
				-- {
				-- 	"<leader>vb",
				-- 	function()
				-- 		Snacks.picker.git_branches()
				-- 	end,
				-- 	desc = "Git Branches",
				-- },
				-- {
				-- 	"<leader>vl",
				-- 	function()
				-- 		Snacks.picker.git_log()
				-- 	end,
				-- 	desc = "Git Log",
				-- },
				-- {
				-- 	"<leader>vL",
				-- 	function()
				-- 		Snacks.picker.git_log_line()
				-- 	end,
				-- 	desc = "Git Log Line",
				-- },
				-- {
				-- 	"<leader>vs",
				-- 	function()
				-- 		Snacks.picker.git_status()
				-- 	end,
				-- 	desc = "Git Status",
				-- },
				-- {
				-- 	"<leader>vS",
				-- 	function()
				-- 		Snacks.picker.git_stash()
				-- 	end,
				-- 	desc = "Git Stash",
				-- },
				-- {
				-- 	"<leader>vd",
				-- 	function()
				-- 		Snacks.picker.git_diff()
				-- 	end,
				-- 	desc = "Git Diff (Hunks)",
				-- },
				-- {
				-- 	"<leader>vf",
				-- 	function()
				-- 		Snacks.picker.git_log_file()
				-- 	end,
				-- 	desc = "Git Log File",
				-- },
				-- {
				-- 	"<leader>sD",
				-- 	function()
				-- 		Snacks.picker.diagnostics()
				-- 	end,
				-- 	desc = "Diagnostics",
				-- },
				-- {
				-- 	"<leader>sd",
				-- 	function()
				-- 		Snacks.picker.diagnostics_buffer()
				-- 	end,
				-- 	desc = "Buffer Diagnostics",
				-- },
				-- {
				-- 	"<leader>ss",
				-- 	function()
				-- 		Snacks.picker.lsp_symbols()
				-- 	end,
				-- 	desc = "Highlights",
				-- },
				-- {
				-- 	"<leader>sS",
				-- 	function()
				-- 		Snacks.picker.lsp_workspace_symbols()
				-- 	end,
				-- 	desc = "Highlights",
				-- },
				-- {
				-- 	"gD",
				-- 	function()
				-- 		Snacks.picker.lsp_declarations()
				-- 	end,
				-- 	desc = "Goto Declaration",
				-- },
				-- {
				-- 	"gr",
				-- 	function()
				-- 		Snacks.picker.lsp_references()
				-- 	end,
				-- 	nowait = true,
				-- 	desc = "References",
				-- },
				-- {
				-- 	"gI",
				-- 	function()
				-- 		Snacks.picker.lsp_implementations()
				-- 	end,
				-- 	desc = "Goto Implementation",
				-- },
				-- {
				-- 	"gy",
				-- 	function()
				-- 		Snacks.picker.lsp_type_definitions()
				-- 	end,
				-- 	desc = "Goto T[y]pe Definition",
				-- },
				{
					"<leader>sh",
					function()
						Snacks.picker.help()
					end,
					desc = "Help Pages",
				},
				{
					"<leader>sH",
					function()
						Snacks.picker.highlights()
					end,
					desc = "Highlights",
				},
				{
					"<leader>sj",
					function()
						Snacks.picker.jumps()
					end,
					desc = "Highlights",
				},
				{
					"<leader>sl",
					function()
						Snacks.picker.loclist()
					end,
					desc = "Location List",
				},
				{
					"<leader>ss",
					function()
						Snacks.picker.resume()
					end,
					desc = "Resume",
				},
				{
					"<leader>sq",
					function()
						Snacks.picker.qflist()
					end,
					desc = "Quickfix List",
				},
			},
			---@module "snacks"
			---@type snacks.Config
			opts = {
				-- input = { enabled = true },
				picker = {
					layout = "telescope",
					-- layout = { preset = "top" },
					-- layout = { preset = "vertical", preview = nil },
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
			event = { "LazyFile" },
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

					-- TODO:
					-- Toggles
					-- map("n", "<leader>tb", gitsigns.toggle_current_line_blame)
					-- map("n", "<leader>td", gitsigns.preview_hunk_inline())
					-- map("n", "<leader>tw", gitsigns.toggle_word_diff)

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
					"benlubas/neorg-interim-ls",
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
						"<leader>nw",
						"<cmd>Neorg return<cr>",
						desc = "Find Neorg Files",
					},
					{ "<leader>ni", "<cmd>Neorg workspace<cr>" },
				},
				config = function()
					vim.api.nvim_create_autocmd("FileType", {
						group = vim.api.nvim_create_augroup("neorg_keymaps", { clear = true }),
						pattern = { "norg" },
						callback = function()
							map(
								"n",
								"<leader>tt",
								"<Plug>(neorg.qol.todo-items.todo.task-cycle)",
								{ buffer = true, silent = true }
							)
						end,
					})

					vim.api.nvim_create_autocmd("BufWritePre", {
						group = vim.api.nvim_create_augroup("neorg_indents", { clear = true }),
						pattern = { "*.norg" },
						callback = function()
							vim.cmd([[normal mzgg=G`z]])
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
							["core.esupports.metagen"] = { config = { update_date = true, type = "auto" } }, -- do not update date until https://github.com/nvim-neorg/neorg/issues/1579 fixed
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
				end,
			},
		},

		-- TODO: Is this even worth it?
		{
			"lukas-reineke/headlines.nvim",
			opts = {
				norg = {
					headline_highlights = {
						"Headline1",
						"Headline2",
						"Headline3",
						"Headline4",
						"Headline5",
						"Headline6",
					},
					fat_headlines = false,
				},
			},
			ft = { "norg" },
		},

		{
			"ThePrimeagen/harpoon",
			branch = "harpoon2",
			keys = {
				{ "<c-j>" },
				{ "<c-k>" },
				{ "<c-l>" },
				{ "<c-p>" },
				{ "<leader>a" },
				{ "<c-e>" },
			},
			opts = {},
			config = function(_, opts)
				local harpoon = require("harpoon")
				harpoon.setup(opts)

				vim.api.nvim_set_hl(0, "HarpoonBorder", { fg = "#2c2e33", bg = "#FEFCF4" })
				vim.api.nvim_set_hl(0, "HarpoonWindow", { fg = "#2c2e33", bg = "#FEFCF4" })

				-- harpoon:extend({
				-- 	UI_CREATE = function(cx)
				-- 		map("n", "<C-t>", function()
				-- 			harpoon.ui:select_menu_item({ tabedit = true })
				-- 		end, { buffer = cx.bufnr })
				-- 	end,
				-- })

				-- local harpoon_extensions = require("harpoon.extensions")
				-- harpoon:extend(harpoon_extensions.builtins.highlight_current_file())
				--

				map("n", "<leader>a", function()
					harpoon:list():add()
				end)

				map("n", "<C-e>", function()
					harpoon.ui:toggle_quick_menu(harpoon:list())
				end)

				map("n", "<C-j>", function()
					harpoon:list():select(1)
				end)

				map("n", "<C-k>", function()
					harpoon:list():select(2)
				end)

				map("n", "<C-l>", function()
					harpoon:list():select(3)
				end)

				map("n", "<C-;>", function()
					harpoon:list():select(4)
				end)
			end,
		},

		{
			"kylechui/nvim-surround",
			keys = { "ys", "ds", "cs" },
			opts = {},
		},

		{
			enabled = false,
			"echasnovski/mini.surround",
			keys = {
				"gsa",
				"gsd",
				"gsf",
				"gsF",
				"gsh",
				"gsr",
				"gsn",
			},
			opts = {
				mappings = {
					add = "gsa", -- Add surrounding in Normal and Visual modes
					delete = "gsd", -- Delete surrounding
					find = "gsf", -- Find surrounding (to the right)
					find_left = "gsF", -- Find surrounding (to the left)
					highlight = "gsh", -- Highlight surrounding
					replace = "gsr", -- Replace surrounding
					update_n_lines = "gsn", -- Update `n_lines`
				},
			},
		},

		{
			"tiagovla/scope.nvim",
			event = "TabNewEntered",
			opts = {},
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
						"owershell ./$fileName",
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
			dependencies = {
				"williamboman/mason.nvim",
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
					python = { "black" },
					rust = { "rustfmt", lsp_format = "fallback" },
					javascript = { "prettierd", "prettier", stop_after_first = true },
					-- toml = { "taplo" },
					json = { "fixjson", "prettier" },
					cs = { "csharpier" },
					yaml = { "yamlfix" }, -- "yamlfmt",
					-- nu = { "nufmt" }, -- Currently too alpha, broken
					-- norg = { command = "C:/Users/lalvarez/source/repos/norg-fmt/target/release/norg-fmt.exe" },
				},
			},
		},

		{
			"zapling/mason-conform.nvim",
			dependencies = "stevearc/conform.nvim",
			event = {
				"BufWritePre",
			},
			opts = {},
		},

		{
			"OXY2DEV/helpview.nvim",
			cmd = { "Helpview" },
			-- cmd = { "Help", "Helpview" },
			-- ft = "help",
			-- keys = { "<leader>sh" },
		},

		{
			"jiaoshijie/undotree",
			opts = {
				window = {
					winblend = 0,
				},
			},
			keys = {
				{
					"<leader>u",
					function()
						require("undotree").toggle()
					end,
				},
			},
		},
	},
})
