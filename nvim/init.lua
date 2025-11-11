vim.loader.enable(true)
local g = vim.g
local opt = vim.opt
local cmd = vim.cmd
local fn = vim.fn
local keymap = vim.keymap.set
local api = vim.api

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
   local change_scale_factor = function(delta) g.neovide_scale_factor = g.neovide_scale_factor * delta end
   keymap("n", "<C-=>", function() change_scale_factor(1.25) end)
   keymap("n", "<C-->", function() change_scale_factor(1 / 1.25) end)
end

-- System clipboard
keymap({ "n", "v" }, "<leader>y", '"+y', defaultOpts) -- yank motion
keymap({ "n", "v" }, "<leader>Y", '"+Y', defaultOpts) -- yank line
keymap({ "n", "v" }, "<leader>d", '"+d', defaultOpts) -- delete motion
keymap({ "n", "v" }, "<leader>D", '"+D', defaultOpts) -- delete line
keymap("n", "<leader>p", '"+p', defaultOpts) -- paste after cursor
keymap("n", "<leader>P", '"+P', defaultOpts) -- paste before cursor
keymap("v", "<leader>p", '"+p', defaultOpts)
keymap("n", "<Leader>xy", "<cmd>call setreg('+', getreg('@'))<CR>", defaultOpts)

keymap("n", "<c-d>", "<c-d>zz", defaultOpts) -- Keep cursor line centered on page scroll
keymap("n", "<c-u>", "<c-u>zz", defaultOpts)

keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("n", "J", "mzJ`z") -- TODO: Decide if this is worth it

-- better up/down TODO: Still testing
keymap({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
keymap({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
keymap({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

keymap("n", "<Esc>", "<cmd>nohlsearch<cr>", defaultOpts)

keymap("v", "p", '"_dP', defaultOpts) -- Keep register after paste

keymap("v", "Y", "y$", defaultOpts) -- Yank to end of line

keymap("v", "<", "<gv")
keymap("v", ">", ">gv")

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

keymap("n", "<leader>Ui", vim.show_pos, { desc = "Inspect Pos" })
keymap("n", "<leader>UI", function()
   vim.treesitter.inspect_tree()
   vim.api.nvim_input("I")
end, { desc = "Inspect Tree" })

-- better indenting

keymap("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
keymap("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })
keymap("n", "ycc", "yygccp", { remap = true, desc = "Copy And Comment" })

keymap("n", "<leader>xl", function()
   local success, err = pcall(vim.fn.getloclist(0, { winid = 0 }).winid ~= 0 and vim.cmd.lclose or vim.cmd.lopen)
   if not success and err then vim.notify(err, vim.log.levels.ERROR) end
end, { desc = "Location List" })

-- -- quickfix list
keymap("n", "<leader>xq", function()
   local success, err = pcall(vim.fn.getqflist({ winid = 0 }).winid ~= 0 and vim.cmd.cclose or vim.cmd.copen)
   if not success and err then vim.notify(err, vim.log.levels.ERROR) end
end, { desc = "Quickfix List" })

keymap("n", "[q", vim.cmd.cprev, { desc = "Previous Quickfix" })
keymap("n", "]q", vim.cmd.cnext, { desc = "Next Quickfix" })

keymap("v", "J", ":m '>+1<cr>gv=gv") -- Move Text
keymap("v", "K", ":m '<-2<cr>gv=gv")

keymap("n", "<bs>", "<C-^>", defaultOpts) -- Quick switch to previous buffer

keymap("n", "H", "<cmd>bprevious<cr>", defaultOpts) -- Navidate buffers
keymap("n", "L", "<cmd>bnext<cr>", defaultOpts)

keymap("n", "<leader>bn", "<cmd>enew<cr>", defaultOpts)

keymap("n", "<Leader>;", "m`A;<Esc>``", { noremap = true, silent = true })
keymap("n", "<Leader>,", "m`A,<Esc>``", { noremap = true, silent = true })

-- map("n", "<tab>", "<tab>", { noremap = true })

-- map("n", "<C-I>", "<C-I>", { noremap = true })
-- map("n", "<C-I>", "<C-I>", { noremap = true })
-- map("n", "<C-I>", "<C-I>", { noremap = true })
-- HACK: This fixes the c-i mapping to tab or some shit
-- the escape sequence is the actual
-- map("n", "\\x1b[105;4u", "<c-i>", { noremap = true })

-- Tabs
-- map("n", "<leader>th", "<cmd>tabfirst<cr>", { desc = "First Tab" })
-- map("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<leader>tw", "<cmd>tabclose<cr>", { desc = "Close Tab" })
-- map("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
-- map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })
-- map("n", "<leader><tab>", "<cmd>tabnew<cr>", { desc = "New Tab" })
keymap("n", "<leader>th", "<cmd>tabfirst<cr>", { desc = "First Tab" })
keymap("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "Last Tab" })
-- map("n", "<tab>", "<cmd>tabnext<cr>", { desc = "Next Tab", noremap = true, silent = true })
-- map("n", "<S-tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab", noremap = true, silent = true })

keymap("n", "<leader><tab>", "<cmd>tabnext<cr>", { desc = "Next Tab" })
keymap("n", "<leader><s-tab>", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
-- map("n", "<leader>t<leader>", "<cmd>tabnext #<cr>", { desc = "Next Tab" })
-- map("n", "<leader><bs>", "<cmd>tabnext #<cr>", { desc = "Next Tab" })
keymap("n", "<leader>tw", "<cmd>tabclose<cr>", { desc = "Close Tab" })
keymap("n", "<leader>to", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
keymap("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New Tab" })

keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", defaultOpts) -- Navigate terminal
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", defaultOpts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", defaultOpts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", defaultOpts)
--
keymap("n", "<C-h>", "<C-w><C-h>", defaultOpts) -- Navigate split
keymap("n", "<C-j>", "<C-w><C-j>", defaultOpts)
keymap("n", "<C-k>", "<C-w><C-k>", defaultOpts)
keymap("n", "<C-l>", "<C-w><C-l>", defaultOpts)

keymap("t", "<left>", "<C-\\><C-N><C-w>h", defaultOpts) -- Navigate terminal
keymap("t", "<down>", "<C-\\><C-N><C-w>j", defaultOpts)
keymap("t", "<up>", "<C-\\><C-N><C-w>k", defaultOpts)
keymap("t", "<right>", "<C-\\><C-N><C-w>l", defaultOpts)

keymap("n", "<left>", "<C-w><C-h>", defaultOpts) -- Navigate split
keymap("n", "<down>", "<C-w><C-j>", defaultOpts)
keymap("n", "<up>", "<C-w><C-k>", defaultOpts)
keymap("n", "<right>", "<C-w><C-l>", defaultOpts)

keymap("n", "<leader>oL", "<cmd>set splitright<cr><cmd>vsplit<cr>", defaultOpts) -- Create veritcal and horizontal split
keymap("n", "<leader>oJ", "<cmd>set splitbelow<cr><cmd>split<cr>", defaultOpts)
keymap("n", "<leader>oK", "<cmd>set nosplitright<cr><cmd>split<cr><C-w><c-k>", defaultOpts)
keymap("n", "<leader>oH", "<cmd>set nosplitbelow<cr><cmd>vsplit<cr><C-w><c-h>", defaultOpts)

keymap("n", "<C-Up>", "<cmd>resize -5<CR>", defaultOpts) -- Resize split
keymap("n", "<C-Down>", "<cmd>resize +5<CR>", defaultOpts)
keymap("n", "<C-Left>", "<cmd>vertical resize -5<CR>", defaultOpts)
keymap("n", "<C-Right>", "<cmd>vertical resize +5<CR>", defaultOpts)

-- map("t", "<Esc>", "<C-\\><C-N>", defaultOpts)
keymap("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

keymap("n", "<leader>la", "<cmd>Lazy<cr>", defaultOpts)

function _G.get_oil_winbar()
   local bufnr = api.nvim_win_get_buf(g.statusline_winid)
   local dir = require("oil").get_current_dir(bufnr)
   if dir then
      return vim.fn.fnamemodify(dir, ":~")
   else
      -- If there is no current directory (e.g. over ssh), just show the buffer name
      return vim.api.nvim_buf_get_name(0)
   end
end

-- Bootstrap lazy.nvim
local lazypath = fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
   local lazyrepo = "https://github.com/folke/lazy.nvim.git"
   local out = fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
   if vim.v.shell_error ~= 0 then
      vim.api.nvim_echo({
         { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
         { out, "WarningMsg" },
         { "\nPress any key to exit..." },
      }, true, {})
      fn.getchar()
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
      if #events == 0 or done then return end
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
      if event.match:match("^%w%w+:[\\/][\\/]") then return end
      local file = vim.uv.fs_realpath(event.match) or event.match
      fn.mkdir(fn.fnamemodify(file, ":p:h"), "p")
   end,
})

-- Highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
   desc = "Highlight when yanking (copying) text",
   group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
   callback = function() vim.highlight.on_yank() end,
})

-- go to last loc when opening a buffer
vim.api.nvim_create_autocmd("BufReadPost", {
   group = vim.api.nvim_create_augroup("last_loc", { clear = true }),
   callback = function(event)
      local exclude = { "gitcommit" }
      local buf = event.buf
      if vim.tbl_contains(exclude, vim.bo[buf].filetype) or vim.b[buf].lazyvim_last_loc then return end
      vim.b[buf].lazyvim_last_loc = true
      local mark = vim.api.nvim_buf_get_mark(buf, '"')
      local lcount = vim.api.nvim_buf_line_count(buf)
      if mark[1] > 0 and mark[1] <= lcount then pcall(vim.api.nvim_win_set_cursor, 0, mark) end
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
      "crunner",
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
   callback = function() vim.opt_local.conceallevel = 0 end,
})

require("lazy").setup({
   defaults = {
      version = false,
      lazy = true,
   },
   rocks = {
      enabled = true,
      hererocks = true,
   },
   change_detection = {
      notify = false,
   },
   checker = { enabled = true },
   rocks = {
      enabled = true,
      hererocks = true,
   },
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

                  -- Strikethrough
                  vim.api.nvim_set_hl(0, "strikethrough", { fg = pallete.tx, strikethrough = true })

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

                  vim.api.nvim_set_hl(0, "BlinkIndent", { fg = pallete.hilite_mid })
                  vim.api.nvim_set_hl(0, "BlinkIndentScope", { fg = pallete.cyan })
                  vim.api.nvim_set_hl(0, "BlinkIndentScopeUnderline", { sp = pallete.cyan, underline = true })

                  vim.api.nvim_set_hl(0, "Headline1", { bg = "#f4feff" })
                  vim.api.nvim_set_hl(0, "Headline2", { bg = "#fefaff" })
                  vim.api.nvim_set_hl(0, "Headline3", { bg = "#f4feff" })
                  vim.api.nvim_set_hl(0, "Headline4", { bg = "#f7fef8" })
                  vim.api.nvim_set_hl(0, "Headline5", { bg = "#fefaff" })
                  vim.api.nvim_set_hl(0, "Headline6", { bg = "#f4feff" })
                  -- vim.api.nvim_set_hl(0, "CodeBlock", { fg = pallete.cyan })
                  vim.api.nvim_set_hl(0, "Dash", { fg = pallete.blue })

                  vim.api.nvim_set_hl(0, "SnacksDashboardNormal", { link = "SnacksPickerBorder" })

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
                     group = vim.api.nvim_create_augroup("harpoon_okcolors_highlight", { clear = true }),
                     pattern = { "oil" },
                     callback = function()
                        local ns_id = vim.api.nvim_create_namespace("oil_okcolors_highlight")
                        vim.api.nvim_set_hl_ns(ns_id)
                        vim.api.nvim_set_hl(ns_id, "NormalFloat", { bg = pallete.bg })
                     end,
                  })

                  vim.api.nvim_create_autocmd("BufEnter", {
                     group = vim.api.nvim_create_augroup("buftype_okcolors_highlight", { clear = true }),
                     callback = function()
                        local buftype = vim.bo.buftype
                        if buftype == "prompt" then
                           local ns_id = vim.api.nvim_create_namespace("buftype_okcolors_highlight")
                           vim.api.nvim_set_hl_ns(ns_id)
                           vim.api.nvim_set_hl(ns_id, "NormalFloat", { bg = pallete.bg })
                        end
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
            keymap = {
               preset = "super-tab",
               -- preset = "default",
               -- preset = "enter",
               ["<C-space>"] = {},
            },
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
         enabled = false,
         "nvim-tree/nvim-tree.lua",
         version = "*",
         lazy = false,
         keys = {
            {
               "<leader>e",
               "<cmd>NvimTreeToggle<cr>",
               -- `api.tree.toggle({ path = "<args>", update_root = <bang>, find_file = true, focus = true, })`
            },
            {
               "<leader>E",
               function() require("nvim-tree.api").tree.toggle({ find_file = true, focus = true }) end,
            },
            {
               "<leader>ne",
               function()
                  require("nvim-tree.api").tree.open({ path = fn.expand("~/vaults/notes/"), update_root = false })
               end,
               desc = "Find Neorg Files",
            },
            {
               "<leader>nje",
               function()
                  require("nvim-tree.api").tree.open({
                     path = fn.expand("~/vaults/notes/journal/"),
                     update_root = false,
                  })
               end,
               desc = "Find Neorg Files",
            },
         },
         dependencies = {
            "nvim-tree/nvim-web-devicons",
         },
         opts = { -- BEGIN_DEFAULT_OPTS
            on_attach = function(bufnr)
               local opts = function(desc)
                  return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
               end
               local api = require("nvim-tree.api")
               -- keymap("n", "<C-]>", nvimTreeApi.tree.change_root_to_node, defaultNvimTreeOpts("CD"))
               -- keymap("n", "<C-e>", nvimTreeApi.node.open.replace_tree_buffer, defaultNvimTreeOpts("Open: In Place"))
               -- remove a default
               -- vim.keymap.del("n", "<C-]>", { buffer = bufnr })
               -- override a default
               -- vim.keymap.set("n", "<C-e>", api.tree.reload, opts("Refresh"))
               -- add your mappings
               keymap("n", "?", api.tree.toggle_help, opts("Help"))
               keymap("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
               keymap("n", "<C-e>", api.node.open.replace_tree_buffer, opts("Open: In Place"))
               keymap("n", "<C-k>", api.node.show_info_popup, opts("Info"))
               keymap("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
               keymap("n", "<C-t>", api.node.open.tab, opts("Open: New Tab"))
               keymap("n", "<C-v>", api.node.open.vertical, opts("Open: Vertical Split"))
               keymap("n", "<C-x>", api.node.open.horizontal, opts("Open: Horizontal Split"))
               keymap("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
               keymap("n", "<CR>", api.node.open.edit, opts("Open"))
               keymap("n", "<Tab>", api.node.open.preview, opts("Open Preview"))
               keymap("n", ">", api.node.navigate.sibling.next, opts("Next Sibling"))
               keymap("n", "<", api.node.navigate.sibling.prev, opts("Previous Sibling"))
               keymap("n", ".", api.node.run.cmd, opts("Run Command"))
               keymap("n", "-", api.tree.change_root_to_parent, opts("Up"))
               keymap("n", "a", api.fs.create, opts("Create File Or Directory"))
               keymap("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
               keymap("n", "bt", api.marks.bulk.trash, opts("Trash Bookmarked"))
               keymap("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
               keymap("n", "B", api.tree.toggle_no_buffer_filter, opts("Toggle Filter: No Buffer"))
               keymap("n", "c", api.fs.copy.node, opts("Copy"))
               keymap("n", "C", api.tree.toggle_git_clean_filter, opts("Toggle Filter: Git Clean"))
               keymap("n", "[c", api.node.navigate.git.prev, opts("Prev Git"))
               keymap("n", "]c", api.node.navigate.git.next, opts("Next Git"))
               keymap("n", "d", api.fs.remove, opts("Delete"))
               keymap("n", "D", api.fs.trash, opts("Trash"))
               keymap("n", "E", api.tree.expand_all, opts("Expand All"))
               keymap("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
               keymap("n", "]e", api.node.navigate.diagnostics.next, opts("Next Diagnostic"))
               keymap("n", "[e", api.node.navigate.diagnostics.prev, opts("Prev Diagnostic"))
               keymap("n", "F", api.live_filter.clear, opts("Live Filter: Clear"))
               keymap("n", "f", api.live_filter.start, opts("Live Filter: Start"))
               keymap("n", "g?", api.tree.toggle_help, opts("Help"))
               keymap("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
               keymap("n", "ge", api.fs.copy.basename, opts("Copy Basename"))
               keymap("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
               keymap("n", "J", api.node.navigate.sibling.last, opts("Last Sibling"))
               keymap("n", "K", api.node.navigate.sibling.first, opts("First Sibling"))
               keymap("n", "M", api.tree.toggle_no_bookmark_filter, opts("Toggle Filter: No Bookmark"))
               keymap("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
               keymap("n", "o", api.node.open.edit, opts("Open"))
               keymap("n", "O", api.node.open.no_window_picker, opts("Open: No Window Picker"))
               keymap("n", "p", api.fs.paste, opts("Paste"))
               keymap("n", "P", api.node.navigate.parent, opts("Parent Directory"))
               keymap("n", "q", api.tree.close, opts("Close"))
               keymap("n", "r", api.fs.rename, opts("Rename"))
               keymap("n", "R", api.tree.reload, opts("Refresh"))
               keymap("n", "s", api.node.run.system, opts("Run System"))
               keymap("n", "S", api.tree.search_node, opts("Search"))
               keymap("n", "u", api.fs.rename_full, opts("Rename: Full Path"))
               keymap("n", "U", api.tree.toggle_custom_filter, opts("Toggle Filter: Hidden"))
               keymap("n", "W", api.tree.collapse_all, opts("Collapse All"))
               keymap("n", "x", api.fs.cut, opts("Cut"))
               keymap("n", "y", api.fs.copy.filename, opts("Copy Name"))
               keymap("n", "Y", api.fs.copy.relative_path, opts("Copy Relative Path"))
               keymap("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
               keymap("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))

               -- keymap("n", "H", api.tree.toggle_hidden_filter, opts("Toggle Filter: Dotfiles"))
               -- keymap("n", "L", api.node.open.toggle_group_empty, opts("Toggle Group Empty"))

               keymap("n", "l", edit_or_open, opts("Edit Or Open"))
               keymap("n", "L", vsplit_preview, opts("Vsplit Preview"))
               keymap("n", "h", api.tree.close, opts("Close"))
               keymap("n", "H", api.tree.collapse_all, opts("Collapse All"))
            end,
            hijack_cursor = false,
            auto_reload_on_write = true,
            disable_netrw = false,
            hijack_netrw = true,
            hijack_unnamed_buffer_when_opening = false,
            root_dirs = {},
            prefer_startup_root = false,
            sync_root_with_cwd = true, -- default: false
            reload_on_bufenter = false, -- default: false
            respect_buf_cwd = false,
            select_prompts = false,
            sort = {
               sorter = "name",
               folders_first = true,
               files_first = false,
            },
            view = {
               centralize_selection = false,
               cursorline = true,
               cursorlineopt = "both",
               debounce_delay = 15,
               side = "left",
               preserve_window_proportions = false,
               number = false,
               relativenumber = false,
               signcolumn = "yes",
               width = 30,
               float = {
                  enable = false,
                  quit_on_focus_loss = true,
                  open_win_config = {
                     relative = "editor",
                     border = "rounded",
                     width = 32, -- default: 30
                     height = 30,
                     row = 1,
                     col = 1,
                  },
               },
            },
            renderer = {
               add_trailing = true, -- default: false
               group_empty = false,
               full_name = false,
               root_folder_label = ":~:s?$?/..?",
               indent_width = 3, -- default: 2
               special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
               hidden_display = "simple", -- default: none
               symlink_destination = true,
               decorators = { "Git", "Open", "Hidden", "Modified", "Bookmark", "Diagnostics", "Copied", "Cut" },
               highlight_git = "none",
               highlight_diagnostics = "none",
               highlight_opened_files = "none",
               highlight_modified = "none",
               highlight_hidden = "none",
               highlight_bookmarks = "none",
               highlight_clipboard = "name",
               indent_markers = {
                  enable = false,
                  inline_arrows = true,
                  icons = {
                     corner = "└",
                     edge = "│",
                     item = "│",
                     bottom = "─",
                     none = " ",
                  },
               },
               icons = {
                  web_devicons = {
                     file = {
                        enable = true,
                        color = true,
                     },
                     folder = {
                        enable = false,
                        color = true,
                     },
                  },
                  git_placement = "before",
                  modified_placement = "after",
                  hidden_placement = "after",
                  diagnostics_placement = "signcolumn",
                  bookmarks_placement = "signcolumn",
                  padding = {
                     icon = " ",
                     folder_arrow = " ",
                  },
                  symlink_arrow = " ➛ ",
                  show = {
                     file = true,
                     folder = true,
                     folder_arrow = true,
                     git = true,
                     modified = true,
                     hidden = false,
                     diagnostics = true,
                     bookmarks = true,
                  },
                  glyphs = {
                     default = "",
                     symlink = "",
                     bookmark = "󰆤",
                     modified = "●",
                     hidden = "󰜌",
                     folder = {
                        arrow_closed = "",
                        arrow_open = "",
                        default = "",
                        open = "",
                        empty = "",
                        empty_open = "",
                        symlink = "",
                        symlink_open = "",
                     },
                     git = {
                        unstaged = "✗",
                        staged = "✓",
                        unmerged = "",
                        renamed = "➜",
                        untracked = "★",
                        deleted = "",
                        ignored = "◌",
                     },
                  },
               },
            },
            hijack_directories = {
               enable = true,
               auto_open = true,
            },
            update_focused_file = {
               enable = false,
               update_root = {
                  enable = false,
                  ignore_list = {},
               },
               exclude = false,
            },
            system_open = {
               cmd = "",
               args = {},
            },
            git = {
               enable = false, -- default: true
               show_on_dirs = true,
               show_on_open_dirs = true,
               disable_for_dirs = {},
               timeout = 400,
               cygwin_support = false,
            },
            diagnostics = {
               enable = false,
               show_on_dirs = false,
               show_on_open_dirs = true,
               debounce_delay = 500,
               severity = {
                  min = vim.diagnostic.severity.HINT,
                  max = vim.diagnostic.severity.ERROR,
               },
               icons = {
                  hint = "",
                  info = "",
                  warning = "",
                  error = "",
               },
            },
            modified = {
               enable = false,
               show_on_dirs = true,
               show_on_open_dirs = true,
            },
            filters = {
               enable = true,
               git_ignored = true,
               dotfiles = false,
               git_clean = false,
               no_buffer = false,
               no_bookmark = false,
               custom = {},
               exclude = {},
            },
            live_filter = {
               prefix = "[FILTER]: ",
               always_show_folders = true,
            },
            filesystem_watchers = {
               enable = true,
               debounce_delay = 50,
               ignore_dirs = {
                  "/.ccls-cache",
                  "/build",
                  "/node_modules",
                  "/target",
               },
            },
            actions = {
               use_system_clipboard = true,
               change_dir = {
                  enable = true,
                  global = false,
                  restrict_above_cwd = false,
               },
               expand_all = {
                  max_folder_discovery = 300,
                  exclude = { ".git", "target", "build" }, -- default: {}
               },
               file_popup = {
                  open_win_config = {
                     col = 1,
                     row = 1,
                     relative = "cursor",
                     border = "shadow",
                     style = "minimal",
                  },
               },
               open_file = {
                  quit_on_open = true, -- defualt: false
                  eject = true,
                  resize_window = true,
                  relative_path = true,
                  window_picker = {
                     enable = true,
                     picker = "default",
                     chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                     exclude = {
                        filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                        buftype = { "nofile", "terminal", "help" },
                     },
                  },
               },
               remove_file = {
                  close_window = true,
               },
            },
            trash = {
               cmd = "gio trash",
            },
            tab = {
               sync = {
                  open = false,
                  close = false,
                  ignore = {},
               },
            },
            notify = {
               threshold = vim.log.levels.INFO,
               absolute_path = true,
            },
            help = {
               sort_by = "key",
            },
            ui = {
               confirm = {
                  remove = true,
                  trash = true,
                  default_yes = false,
               },
            },
            experimental = {},
            log = {
               enable = false,
               truncate = false,
               types = {
                  all = false,
                  config = false,
                  copy_paste = false,
                  dev = false,
                  diagnostics = false,
                  git = false,
                  profile = false,
                  watcher = false,
               },
            },
         }, -- END_DEFAULT_OPTS
      },

      {
         "stevearc/oil.nvim",
         lazy = false,
         keys = {
            {
               "<leader>e",
               "<cmd>Oil --float<cr>",
               -- function() vim.bo.filetype = "Oil" and cmd("Oil") or cmd("Oil") end,
            },

            {
               "<leader>E",
               function() require("oil.actions").open_cwd({}) end,
            },
         },
         opts = {
            default_file_explorer = true,
            columns = {
               "icon",
               "mtime",
            },
            -- Buffer-local options to use for oil buffers
            buf_options = {
               buflisted = false,
               bufhidden = "hide",
            },
            -- Window-local options to use for oil buffers
            win_options = {
               wrap = true, -- default: false
               signcolumn = "no",
               cursorcolumn = false,
               foldcolumn = "0",
               spell = false,
               list = false,
               conceallevel = 3,
               concealcursor = "nvic",
               winbar = "%!v:lua.get_oil_winbar()",
            },
            -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
            delete_to_trash = true, -- default: false
            -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
            skip_confirm_for_simple_edits = true, -- default: false
            -- Selecting a new/moved/renamed file or directory will prompt you to save changes first
            -- (:help prompt_save_on_select_new_entry)
            prompt_save_on_select_new_entry = true,
            -- Oil will automatically delete hidden buffers after this delay
            -- You can set the delay to false to disable cleanup entirely
            -- Note that the cleanup process only starts when none of the oil buffers are currently displayed
            cleanup_delay_ms = 2000,
            lsp_file_methods = {
               -- Enable or disable LSP file operations
               enabled = true,
               -- Time to wait for LSP file operations to complete before skipping
               timeout_ms = 1000,
               -- Set to true to autosave buffers that are updated with LSP willRenameFiles
               -- Set to "unmodified" to only save unmodified buffers
               autosave_changes = false,
            },
            -- Constrain the cursor to the editable parts of the oil buffer
            -- Set to `false` to disable, or "name" to keep it on the file names
            constrain_cursor = "editable",
            -- Set to true to watch the filesystem for changes and reload oil
            watch_for_changes = false,
            -- Keymaps in oil buffer. Can be any value that `vim.keymap.set` accepts OR a table of keymap
            -- options with a `callback` (e.g. { callback = function() ... end, desc = "", mode = "n" })
            -- Additionally, if it is a string that matches "actions.<name>",
            -- it will use the mapping at require("oil.actions").<name>
            -- Set to `false` to remove a keymap
            -- See :help oil-actions for a list of all available actions
            keymaps = {
               ["g?"] = { "actions.show_help", mode = "n" },
               ["<CR>"] = "actions.select",
               -- ["<C-s>"] = { "actions.select", opts = { vertical = true } },
               -- ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
               -- ["<C-t>"] = { "actions.select", opts = { tab = true } },
               -- ["<C-p>"] = "actions.preview",
               -- ["<C-c>"] = { "actions.close", mode = "n" },
               ["q"] = { "actions.close", mode = "n" },
               ["<leader>e"] = { "actions.close", mode = "n" },
               ["<C-l>"] = "actions.refresh",
               -- ["-"] = { "actions.parent", mode = "n" },
               ["<bs>"] = { "actions.parent", mode = "n" },
               ["<leader><bs>"] = { "actions.open_cwd", mode = "n" },
               -- ["`"] = { "actions.cd", mode = "n" },
               ["<leader><leader>"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
               -- ["gs"] = { "actions.change_sort", mode = "n" },
               ["gx"] = "actions.open_external",
               ["g."] = { "actions.toggle_hidden", mode = "n" },
               -- ["g\\"] = { "actions.toggle_trash", mode = "n" },
            },
            -- Set to false to disable all of the above keymaps
            use_default_keymaps = true,
            view_options = {
               show_hidden = true,
               -- This function defines what will never be shown, even when `show_hidden` is set
               is_always_hidden = function(name, bufnr) return false end,
               natural_order = "fast",
               case_insensitive = false,
               sort = {
                  { "type", "asc" },
                  { "name", "asc" },
               },
            },
            -- EXPERIMENTAL support for performing file operations with git
            git = {
               -- Return true to automatically git add/mv/rm files
               add = function(path) return false end,
               mv = function(src_path, dest_path) return false end,
               rm = function(path) return false end,
            },
            float = {
               -- Padding around the floating window
               padding = 5,
               -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
               max_width = 80,
               max_height = 0,
               border = "rounded",
               get_win_title = function(winid) return fn.fnamemodify(fn.getcwd(0, 0), ":~") end,
               -- get_win_title = function(winid) return "" end,
               preview_split = "auto",
               override = function(conf) return conf end,
            },
            -- Configuration for the file preview window
            preview_win = {
               update_on_cursor_moved = true,
               preview_method = "fast_scratch",
               disable_preview = function(filename) return false end,
               win_options = {},
            },
            -- Configuration for the floating progress window
            progress = {
               max_width = 0.9,
               min_width = { 40, 0.4 },
               width = nil,
               max_height = { 10, 0.9 },
               min_height = { 5, 0.1 },
               height = nil,
               border = nil,
               minimized_border = "none",
               win_options = {
                  winblend = 0,
               },
            },
            keymaps_help = {
               border = nil,
            },
         },
      },

      {
         -- "alvarez-lucas/Otree.nvim",
         enabled = false,
         dir = "~/repos/Otree.nvim/",
         keys = {
            {
               "<leader>e",
               "<cmd>Otree<cr>",
            },
            {
               "<leader>E",
               "<cmd>OtreeFocus<cr>",
            },
         },
         -- branch = "feature/tab-scoped-directories",
         init = function()
            -- Lazy load on open of directory to hijack netrw (https://www.lazyvim.org/extras/editor/neo-tree)
            vim.api.nvim_create_autocmd("BufEnter", {
               group = vim.api.nvim_create_augroup("Otree_start_directory", { clear = true }),
               desc = "Start Otree with directory",
               once = true,
               callback = function()
                  if package.loaded["Otree"] then
                     return
                  else
                     local stats = vim.uv.fs_stat(vim.fn.argv(0))
                     if stats and stats.type == "directory" then require("Otree") end
                  end
               end,
            })
         end,
         dependencies = {
            "stevearc/oil.nvim",
            "nvim-tree/nvim-web-devicons",
         },
         opts = {
            win_size = 34,
            open_on_startup = false,
            hijack_netrw = true,
            show_hidden = false,
            show_ignore = false,
            cursorline = true,
            focus_on_enter = true,
            open_on_left = true,
            git_signs = true,
            lsp_signs = false,
            oil = "float",
            ignore_patterns = {},

            use_default_keymaps = false,
            keymaps = {
               ["l"] = "actions.select_then_close",
               ["h"] = "actions.close_dir",
               ["<Esc>"] = "actions.close_win",
               ["<bs>"] = "actions.goto_parent",
               ["<CR>"] = "actions.goto_dir",
               ["<R>"] = "actions.goto_home_dir_tab",
               ["cd"] = "actions.change_home_dir_tab",
               ["L"] = "actions.open_dirs",
               ["H"] = "actions.close_dirs",
               ["o"] = "actions.oil_dir",
               ["O"] = "actions.oil_into_dir",
               ["t"] = "actions.open_tab",
               ["v"] = "actions.open_vsplit",
               ["s"] = "actions.open_split",
               ["."] = "actions.toggle_hidden",
               ["i"] = "actions.toggle_ignore",
               ["r"] = "actions.refresh",
               ["f"] = "actions.focus_file",
               ["?"] = "actions.open_help",
            },
            -- tree = {
            --    space_after_icon = " ",
            --    space_after_connector = " ",
            --    connector_space = " ",
            --    -- connector_last = "─",
            --    connector_last = "└",
            --    connector_middle = "│",
            --    -- connector_middle = "├",
            --    vertical_line = "│",
            -- },
            tree = {
               space_after_icon = " ",
               space_after_connector = " ",
               connector_space = " ",
               -- connector_last = "─",
               connector_last = " ",
               connector_middle = " ",
               -- connector_middle = " ",
               vertical_line = " ",
            },
            icons = {
               title = " ",
               default_file = " ",
               default_directory = " ",
               empty_dir = " ",
               trash = " ",
               keymap = "⌨ ",
               oil = " ",
            },

            highlights = {
               directory = "Directory",
               file = "Normal",
               tree = "Comment",
               title = "Title",
               float_normal = "NormalFloat",
               float_border = "FloatBorder",
               link_path = "Comment",
               git_ignored = "NonText",
               git_untracked = "DiagnosticInfo",
               git_modified = "DiagnosticWarn",
               git_added = "DiagnosticHint",
               git_deleted = "DiagnosticError",
               git_conflict = "DiagnosticError",
               git_renamed = "DiagnosticHint",
               git_copied = "DiagnosticHint",
               lsp_warn = "DiagnosticWarn",
               lsp_info = "DiagnosticInfo",
               lsp_hint = "DiagnosticHint",
               lsp_error = "DiagnosticError",
            },

            float = {
               center = true,
               width_ratio = 0.7,
               height_ratio = 0.7,
               padding = 0,
               cursorline = true,
               border = "rounded",
            },
         },
         config = function(_, opts)
            require("Otree").setup(opts)

            -- Trigger only on global directory change (:cd)
            vim.api.nvim_create_autocmd("DirChanged", {
               pattern = "global",
               callback = function()
                  print("Global directory changed")
                  vim.cmd("tcd " .. vim.fn.getcwd())
               end,
            })

            vim.api.nvim_create_autocmd("DirChanged", {
               pattern = "*",
               callback = function()
                  pcall(function() require("Otree.actions").goto_home_dir() end)
               end,
            })
            -- Trigger only on window-local directory change (:lcd)
            vim.api.nvim_create_autocmd("DirChanged", {
               pattern = "window",
               callback = function() print("Window directory changed") end,
            })

            -- Trigger only on tab-local directory change (:tcd)
            vim.api.nvim_create_autocmd("DirChanged", {
               pattern = "tabpage",
               callback = function() print("Tab directory changed") end,
            })

            -- Trigger only on autochdir changes
            vim.api.nvim_create_autocmd("DirChanged", {
               pattern = "auto",
               callback = function() print("Auto directory changed") end,
            })
         end,
      },

      {
         "glacambre/firenvim",
         lazy = not vim.g.started_by_firenvim,
         module = false,
         build = function() vim.fn["firenvim#install"](0) end,
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
         enabled = false,
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
                  "c",
                  "cmake",
                  "cpp",
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
                  "luadoc",
                  "luap",
                  "luau",
                  "make",
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
                  "slint",
                  "qmldir",
                  "qmljs",
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
         config = function() require("rainbow-delimiters.setup").setup({}) end,
      },

      {
         "norcalli/nvim-colorizer.lua",
         event = { "LazyFile", "VeryLazy" },
         lazy = vim.fn.argc(-1) == 0, -- load early when opening a file from the cmdline
         config = function() require("colorizer").setup({ "*" }) end,
      },

      {
         enabled = false,
         "Darazaki/indent-o-matic",
         lazy = vim.fn.argc(-1) == 0, -- load early when opening a file from the cmdline
         -- also set as dependency for hlchunk.nvim { "VeryLazy", "LazyFile" }
         event = {
            "BufNewFile",
            "BufReadPre",
         },
         opts = {
            max_lines = 2048,
            standard_widths = { 2, 3, 4, 8 },
            skip_multiline = true,
         },
      },

      {
         "saghen/blink.indent",
         enabled = false,
         event = "LazyFile",
         lazy = vim.fn.argc(-1) == 0, -- load early when opening a file from the cmdline
         --- @module 'blink.indent'
         --- @type blink.indent.Config
         opts = {
            blocked = {
               buftypes = { include_defaults = true }, -- default: 'terminal', 'quickfix', 'nofile', 'prompt'
               filetypes = { include_defaults = true }, -- default: 'lspinfo', 'packer', 'checkhealth', 'help', 'man', 'gitcommit', 'dashboard', ''
            },
            static = {
               enabled = true,
               -- char = "▎",
               char = "│",
               -- char = "▏",
               priority = 1,
               -- specify multiple highlights here for rainbow-style indent guides
               -- highlights = {
               --    "RainbowDelimiterRed",
               --    "RainbowDelimiterYellow",
               --    "RainbowDelimiterBlue",
               --    "RainbowDelimiterOrange",
               --    "RainbowDelimiterGreen",
               --    "RainbowDelimiterViolet",
               --    "RainbowDelimiterCyan",
               -- },
               -- highlights = {
               --    "BlinkIndentRed",
               --    "BlinkIndentOrange",
               --    "BlinkIndentYellow",
               --    "BlinkIndentGreen",
               --    "BlinkIndentViolet",
               --    "BlinkIndentCyan",
               -- },
               -- highlights = { "BlinkIndent" },
               highlights = { "BlinkIndent" },
            },
            scope = {
               enabled = true,
               char = "│",
               priority = 1000,
               -- highlights = { "BlinkIndentOrange", "BlinkIndentOrange", "BlinkIndentOrange" },
               highlights = { "BlinkIndentScope" },
               -- highlights = { {fg = "#028a9b"}, "BlinkIndentOrange", "BlinkIndentOrange" },
               -- enable to show underlines on the line above the current scope
               underline = {
                  enabled = true,
                  -- optionally add: 'BlinkIndentRedUnderline', 'BlinkIndentCyanUnderline', 'BlinkIndentYellowUnderline', 'BlinkIndentGreenUnderline'
                  highlights = {
                     { "BlinkIndentScopeUnderline" },
                     -- "BlinkIndentOrangeUnderline",
                     -- "BlinkIndentVioletUnderline",
                     -- "BlinkIndentBlueUnderline",
                  },
               },
            },
         },

         --
      },

      {
         enabled = false,
         lazy = vim.fn.argc(-1) == 0, -- load early when opening a file from the cmdline
         event = { "VeryLazy", "LazyFile" },
         "shellRaining/hlchunk.nvim",
         dependencies = {
            "Darazaki/indent-o-matic",
         },
         opts = {
            chunk = {
               enable = true,
               delay = 0,
               style = {
                  "#028a9b",
                  "#d7314b",
               },
               exclude_filetypes = { "norg" },
            },
            -- line_num = {
            -- 	enable = true,
            -- 	style = "#c3399b",
            -- },
            indent = {
               exclude_filetypes = { norg = true },
               enable = true,
               chars = {
                  -- "￨",
                  "│",
                  -- "▏",
               },
               style = {
                  "#b0aea7",
                  -- "#d0cec7",
               },
               -- style = {
               -- 	"#028a9b",
               -- 	"#896aa9",
               -- 	"#c3399b",
               -- 	"#4b8b5a",
               -- 	"#6377b6",
               -- 	"#91772a",
               -- 	"#a8693d",
               -- },
            },
         },
      },

      {
         "lukas-reineke/indent-blankline.nvim",
         enabled = false,
         event = { "VeryLazy", "LazyFile" },
         lazy = vim.fn.argc(-1) == 0, -- load early when opening a file from the cmdline
         main = "ibl",
         opts = {
            scope = { enabled = true },
            indent = {
               -- https://graphemica.com/%E2%96%8F#glyphs
               -- char = "│",
               -- char = "▏",
            },
            exclude = { filetypes = { "dashboard" } },
         },
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
               function() require("todo-comments").jump_next() end,
               desc = "Next Todo Comment",
            },
            {
               "[t",
               function() require("todo-comments").jump_prev() end,
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
               "html",
               -- "tsserver",
               -- "emmet_language_server",
               "ts_ls",
               -- "csharp_ls",
               "neocmake",
               "powershell_es",
               "pylsp",
               "taplo",
               "yamlls",
               "lemminx",
               "clangd",
               "neocmake",
               "slint_lsp",
               "qmlls",
               "marksman",
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
            {
               "rachartier/tiny-inline-diagnostic.nvim",
               opts = {
                  -- "modern", "classic", "minimal", "powerline",
                  -- "ghost", "simple", "nonerdfont", "amongus"
                  preset = "simple",
                  hi = {
                     background = "#fefcf4",
                  },
                  -- blend = {
                  -- 	factor = 1.0,
                  -- },
                  options = {
                     show_source = true,
                     throttle = 0,
                     show_all_diags_on_cursorline = true,
                     multilines = {
                        enabled = true,
                        always_show = false,
                     },
                     break_line = {
                        enabled = true,
                        after = 40,
                     },
                  },
               },
            },
            {
               "nvimdev/lspsaga.nvim",
               enabled = false,
               opts = {},
            },
         },

         event = "LazyFile",
         config = function()
            vim.api.nvim_create_autocmd("LspAttach", {
               group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
               callback = function(event)
                  -- TODO: Check what server is attaching, don't use keybinds for Rust, add Rust keybinds in rust plugin

                  keymap(
                     "n",
                     "grr",
                     function() require("snacks.picker").lsp_references() end,
                     { buffer = event.buf, desc = "[G]oto [R]eferences" }
                  )

                  keymap(
                     "n",
                     "gra",
                     function() vim.lsp.buf.code_action() end,
                     { buffer = event.buf, desc = "[G]oto Code [A]ction" }
                  )

                  keymap(
                     "n",
                     "grr",
                     function() require("snacks.picker").lsp_references() end,
                     { buffer = event.buf, desc = "[G]oto [R]eferences" }
                  )

                  keymap(
                     "n",
                     "gri",
                     function() require("snacks.picker").lsp_implementations() end,
                     { buffer = event.buf, desc = "[G]oto [I]mplementation" }
                  )

                  keymap(
                     "n",
                     "grd",
                     function() require("snacks.picker").lsp_definitions() end,
                     { buffer = event.buf, desc = "[G]oto [D]efinition" }
                  )

                  keymap(
                     "n",
                     "grD",
                     function() require("snacks.picker").lsp_declarations() end,
                     { buffer = event.buf, desc = "[G]oto [D]eclaration" }
                  )

                  keymap(
                     "n",
                     "grt",
                     function() require("snacks.picker").lsp_type_definitions() end,
                     { buffer = event.buf, desc = "[G]oto [T]ype Definition" }
                  )

                  keymap(
                     "n",
                     "gO",
                     function() require("snacks.picker").lsp_symbols() end,
                     { buffer = event.buf, desc = "Open Document Symbols" }
                  )

                  keymap(
                     "n",
                     "gW",
                     function() require("snacks.picker").lsp_workspace_symbols() end,
                     { buffer = event.buf, desc = "Open Workspace Symbols" }
                  )
                  -- - "grn" is mapped in Normal mode to |vim.lsp.buf.rename()|
                  --
                  -- TODO: Consider
                  keymap("n", "gl", function() vim.diagnostic.open_float() end, { buffer = event.buf })
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
                     and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
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

                  if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
                     keymap(
                        "n",
                        "<leader>th",
                        function()
                           vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({
                              bufnr = event.buf,
                              desc = "[T]oggle Inlay [H]ints",
                           }))
                        end,
                        {
                           buffer = event.buf,
                           desc = "Open Workspace Symbols",
                        }
                     )
                  end
               end,
            })

            -- https://www.lazyvim.org/plugins/lsp -- TODO: check this out for the default server options
            local capabilities = require("blink.cmp").get_lsp_capabilities()
            vim.lsp.config("*", {
               capabilities = capabilities,
               root_markers = { ".git" },
               -- on_attach = function(client, bufnr) -- Consider converting to lsp config on_attach
            })

            vim.lsp.config("taplo", { root_dir = require("lspconfig.util").root_pattern("*.toml", ".git") })

            vim.lsp.config("prosemd_lsp", { root_marker = ".obsidian" })

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
               virtual_text = false,
               -- virtual_text = {
               -- 	source = "if_many",
               -- 	spacing = 2,
               -- 	format = function(diagnostic)
               -- 		local diagnostic_message = {
               -- 			[vim.diagnostic.severity.ERROR] = diagnostic.message,
               -- 			[vim.diagnostic.severity.WARN] = diagnostic.message,
               -- 			[vim.diagnostic.severity.INFO] = diagnostic.message,
               -- 			[vim.diagnostic.severity.HINT] = diagnostic.message,
               -- 		}
               -- 		return diagnostic_message[diagnostic.severity]
               -- 	end,
               -- },
            })

            -- vim.lsp.enable("jsonls")
            -- vim.lsp.enable("lua_ls")
            -- vim.lsp.enable("omnisharp")
            -- require("lspconfig").omnisharp.setup({
            --    cmd = { "dotnet", "C:/Users/lucas/Downloads/omnisharp-win-x64-net6.0/OmniSharp.dll" },
            --    settings = {
            --       RoslynExtensionsOptions = {
            --          EnableAnalyzersSupport = true,
            --          -- Enables support for showing unimported types and unimported extension
            --          -- methods in completion lists. When committed, the appropriate using
            --          -- directive will be added at the top of the current file. This option can
            --          -- have a negative impact on initial completion responsiveness,
            --          -- particularly for the first few completion sessions after opening a
            --          -- solution.
            --          EnableImportCompletion = true,
            --          -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
            --          -- true
            --          AnalyzeOpenDocumentsOnly = nil,
            --       },
            --    },
            -- })
            -- -- vim.lsp.enable("csharp_ls")
            -- vim.lsp.enable("powershell_es")
            -- vim.lsp.enable("pylsp")
            -- vim.lsp.enable("taplo")
            -- vim.lsp.enable("yamlls")
            -- vim.lsp.enable("lemminx")
            -- vim.lsp.enable("clangd")
            -- vim.lsp.enable("cmake")
            -- ruff = {},
         end,
      },

      {
         "mrcjkb/rustaceanvim",
         dependencies = { "neovim/nvim-lspconfig" },
         lazy = false,
      },

      {
         "windwp/nvim-autopairs",
         event = "InsertEnter",
         opts = {},
      },

      {
         "folke/snacks.nvim",
         lazy = vim.fn.argc(-1) ~= 0,
         event = "VeryLazy",
         keys = {
            {
               "<leader>nf",
               function() Snacks.picker.files({ dirs = { "~/valuts/notes/" }, exclude = { "*journal*" } }) end,
               desc = "Find Neorg Files",
            },
            {
               "<leader>njf",
               function()
                  Snacks.picker.files({
                     dirs = { "~/vaults/notes/journal/" },
                     sort = { fields = { "file" } },
                  })
               end,
               desc = "Find Neorg Files",
            },
            {
               "<leader>ng",
               function() Snacks.picker.grep({ dirs = { "~/notes/" }, need_search = false }) end,
               desc = "Grep Neorg Files",
            },
            {
               "<leader>m",
               function() Snacks.picker.notifications() end,
               desc = "Notification History",
            },
            {
               "<leader>sg",
               function() Snacks.picker.grep({ need_search = false }) end,
               desc = "Grep",
            },
            {
               "<leader>sg",
               function() Snacks.picker.grep_word() end,
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
               function() Snacks.bufdelete() end,
               desc = "Delete Buffer",
            },
            {
               "<leader>bo",
               function() Snacks.bufdelete.other() end,
               desc = "Delete Other Buffers",
            },
            {
               "<leader>b",
               function()
                  Snacks.picker.buffers({
                     on_show = function() vim.cmd.stopinsert() end,
                     -- filter = {
                     -- 	cwd = ,
                     -- },
                  })
               end,
               desc = "Buffers",
            },
            {
               "<leader>Z",
               function() Snacks.picker.zoxide() end,
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
                           -- vim.cmd("Neotree action=focus source=filesystem position=current")
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
               function() Snacks.picker.recent() end,
               desc = "Recent",
            },
            {
               "<leader>sk",
               function() Snacks.picker.keymaps() end,
               desc = "keymaps",
            },
            {
               "<leader>sm",
               function() Snacks.picker.marks() end,
               desc = "keymaps",
            },
            {
               "<leader>sM",
               function() Snacks.picker.notifications() end,
               desc = "keymaps",
            },
            {
               "<leader>su",
               function() Snacks.picker.undo() end,
               desc = "Undo History",
            },
            {
               '<leader>s"',
               function() Snacks.picker.registers() end,
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
               function() Snacks.picker.help() end,
               desc = "Help Pages",
            },
            {
               "<leader>sH",
               function() Snacks.picker.highlights() end,
               desc = "Highlights",
            },
            {
               "<leader>sj",
               function() Snacks.picker.jumps() end,
               desc = "Highlights",
            },
            {
               "<leader>sl",
               function() Snacks.picker.loclist() end,
               desc = "Location List",
            },
            {
               "<leader>ss",
               function() Snacks.picker.resume() end,
               desc = "Resume",
            },
            {
               "<leader>sq",
               function() Snacks.picker.qflist() end,
               desc = "Quickfix List",
            },
         },
         ---@module "snacks"
         ---@type snacks.Config
         opts = {
            input = {
               enabled = true,
               win = {
                  relative = "cursor",
                  row = -3,
                  col = 0,
                  b = {
                     completion = true,
                  },
               },
            },
            -- dashboard = {
            --    row = nil,
            --    col = nil,
            --    preset = {
            --       header = [[]],
            --    },
            --    sections = {
            --       { section = "header" },
            --    },
            -- },
            picker = {
               layout = {
                  cycle = true,
                  preset = function() return vim.o.columns >= 120 and "default" or "vertical" end,
                  -- hidden = { "input", "preview" },
                  fuzzy = true,
                  smartcase = true,
                  ignorecase = true,
                  -- sort_empty = true,
                  filename_bonus = true,
                  file_pos = true,
                  frecency = true,
               },

               formatters = {
                  selected = {
                     always_show = true,
                     unselected = true,
                  },
               },
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
                  files = {
                     hidden = true,
                  },
                  help = {
                     confirm = function(picker, item)
                        picker:close()
                        if item then vim.schedule(function() vim.cmd("Help " .. item.text) end) end
                     end,
                  },
                  projects = {
                     recent = true,
                     matcher = {
                        frecency = true, -- use frecency boosting
                        sort_empty = true, -- sort even when the filter is empty
                        cwd_bonus = false,
                     },
                  },
               },
            },
         },
      },

      {
         "dmtrKovalenko/fff.nvim",
         build = function() require("fff.download").download_or_build_binary() end,
         opts = { -- (optional)
            debug = {
               enabled = true, -- we expect your collaboration at least during the beta
               show_scores = true, -- to help us optimize the scoring system, feel free to share your scores!
            },
         },
         keys = {
            {
               "ff", -- try it if you didn't it is a banger keybinding for a picker
               function() require("fff").find_files() end,
               desc = "FFFind files",
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

               map("v", "<leader>hs", function() gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)

               map("v", "<leader>hr", function() gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)

               map("n", "<leader>hS", gitsigns.stage_buffer)
               map("n", "<leader>hR", gitsigns.reset_buffer)
               map("n", "<leader>hp", gitsigns.preview_hunk)
               -- map("n", "<leader>hi", gitsigns.preview_hunk_inline)

               map("n", "<leader>hb", function() gitsigns.blame_line({ full = true }) end)

               -- map("n", "<leader>hd", gitsigns.diffthis)

               map("n", "<leader>hD", function() gitsigns.diffthis("~") end)

               map("n", "<leader>hQ", function() gitsigns.setqflist("all") end)
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
         "NeogitOrg/neogit",
         dependencies = {
            "sindrets/diffview.nvim",
            "folke/snacks.nvim", -- optional
         },
         keys = {
            { "<leader>gg", "<cmd>Neogit<cr>" },
            { "<leader>gd", "<cmd>DiffviewOpen<cr>" },
            { "<leader>gl", "<cmd>Neogit log<cr>" },
            { "<leader>gP", "<cmd>Neogit push<cr>" },
         },
         opts = {
            graph_style = "kitty",
         },
         config = function(_, opts)
            local neogit = require("neogit")
            neogit.setup(opts)
         end,
      },

      -- TODO:
      -- <leader>gg - neogit
      -- <leader>gd - dit diff
      -- <leader>gD - git diff picker, or main
      -- <leader>gl - log
      -- <leader>gp - pull
      -- <leader>gP - push
      --
      {
         "obsidian-nvim/obsidian.nvim",
         version = "*", -- recommended, use latest release instead of latest commit
         lazy = true,
         ft = "markdown",
         -- event = {
         --    "BufReadPre " .. vim.fn.expand("~") .. "\\vaults\\notes\\*.md",
         --    "BufNewFile " .. vim.fn.expand("~") .. "\\vaults\\notes\\*.md",
         -- },
         dependencies = {
            "nvim-lua/plenary.nvim",
            "folke/snacks.nvim",
         },
         keys = {
            { "<leader>nn", "<cmd>Obsidian new<cr>" },
            { "<leader>nO", "<cmd>Obsidian open<cr>" },
            { "<leader>nd", "<cmd>Obsidian dailies<cr>" },
            { "<leader>nrn", "<cmd>Obsidian rename<cr>" },
            { "<leader>nt", "<cmd>Obsidian template<cr>" },
            { "<leader>nb", "<cmd>Obsidian backlinks<cr>" },
            { "<leader>ng", "<cmd>Obsidian search<cr>" },
            { "<leader>nf", "<cmd>Obsidian quick_switch<cr>" },
            { "<leader>njf", "<cmd>Obsidian dailies<cr>" },
            { "<leader>njt", "<cmd>Obsidian today<cr>" },
            { "<leader>njT", "<cmd>Obsidian tomorrow<cr>" },
            { "<leader>njy", "<cmd>Obsidian yesterday<cr>" },
         },
         ---@module 'obsidian'
         ---@type obsidian.config
         opts = {
            legacy_commands = false,
            workspaces = {
               {
                  name = "notes",
                  path = "~/vaults/notes",
               },
            },
            picker = { name = "snacks.pick" },
            daily_notes = {
               folder = "journal",
               date_format = "%Y-%m-%d",
               -- template = "daily",
            },
         },
      },

      {
         "nvim-neorg/neorg",
         enabled = false,
         dependencies = {
            "nvim-neorg/lua-utils.nvim",
            "pysan3/pathlib.nvim",
            "nvim-neotest/nvim-nio",
            "benlubas/neorg-interim-ls",
            "neovim/nvim-lspconfig",
         },
         ft = "norg",
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
         opts = {
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
               ["core.esupports.metagen"] = {
                  config = { update_date = true, type = "auto" },
               }, -- do not update date until https://github.com/nvim-neorg/neorg/issues/1579 fixed
               -- https://github.com/nvim-neorg/neorg/issues/1579
               -- ["core.esupports.metagen"] = {
               -- 	config = { type = "auto", update_date = false }, -- TODO: Change update_date after fix
               -- },
               ["core.autocommands"] = {},
               ["core.esupports.indent"] = {},
               ["external.interim-ls"] = {},
               ["core.completion"] = {
                  config = {
                     engine = { module_name = "external.lsp-completion" },
                  },
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
         },
         config = function(_, opts)
            vim.api.nvim_create_autocmd("FileType", {
               group = vim.api.nvim_create_augroup("neorg_keymaps", { clear = true }),
               pattern = { "norg" },
               callback = function()
                  keymap(
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
               callback = function() vim.cmd([[normal mzgg=G`z]]) end,
            })
            vim.wo.foldlevel = 99
            require("neorg").setup(opts)
         end,
      },

      {
         "ThePrimeagen/harpoon",
         branch = "harpoon2",
         keys = {
            { "<leader>1" },
            { "<leader>2" },
            { "<leader>3" },
            { "<leader>4" },
            { "<leader>5" },
            { "<leader>6" },
            { "<leader>7" },
            { "<leader>8" },
            { "<leader>9" },
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

            keymap("n", "<leader>a", function() harpoon:list():add() end)
            keymap("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
            keymap("n", "<leader>1", function() harpoon:list():select(1) end)
            keymap("n", "<leader>2", function() harpoon:list():select(2) end)
            keymap("n", "<leader>3", function() harpoon:list():select(3) end)
            keymap("n", "<leader>4", function() harpoon:list():select(4) end)
            keymap("n", "<leader>5", function() harpoon:list():select(5) end)
            keymap("n", "<leader>6", function() harpoon:list():select(6) end)
            keymap("n", "<leader>7", function() harpoon:list():select(7) end)
            keymap("n", "<leader>8", function() harpoon:list():select(8) end)
            keymap("n", "<leader>9", function() harpoon:list():select(9) end)
         end,
      },

      -- TODO: Pick a surround plugin

      {
         enabled = false,
         "kylechui/nvim-surround",
         keys = { "ys", "ds", "cs" },
         opts = {},
      },

      {
         enabled = true,
         "echasnovski/mini.surround",
         keys = {
            { "gsa", mode = { "n", "v" } },
            { "gsd", mode = { "n", "v" } },
            { "gsf", mode = { "n", "v" } },
            { "gsF", mode = { "n", "v" } },
            { "gsh", mode = { "n", "v" } },
            { "gsr", mode = { "n", "v" } },
            { "gsn", mode = { "n", "v" } },
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
         "kevinhwang91/nvim-hlslens",
         keys = {
            { "?" },
            { "/" },
            { "n" },
            { "N" },
            { "#" },
            { "g*" },
            { "g#" },
         },
         config = function()
            require("hlslens").setup()

            local kopts = { noremap = true, silent = true }

            vim.api.nvim_set_keymap(
               "n",
               "n",
               [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
               kopts
            )
            vim.api.nvim_set_keymap(
               "n",
               "N",
               [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
               kopts
            )
            vim.api.nvim_set_keymap("n", "*", [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "#", [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "g*", [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
            vim.api.nvim_set_keymap("n", "g#", [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
         end,
      },

      {
         "tiagovla/scope.nvim",
         event = "TabNewEntered",
         opts = {},
      },

      {
         "CRAG666/betterTerm.nvim",
         enabled = false,
         keys = {
            { "<leader>:" },
            {
               "<leader>;",
               function() require("betterTerm").open() end,
            },
         },
         opts = {
            position = "bot",
            size = 15,
         },
         config = function(_, opts)
            require("betterTerm").setup(opts)

            local current = 1
            vim.keymap.set({ "n" }, "<leader>:", function()
               require("betterTerm").open(current)
               current = current + 1
            end, { desc = "New terminal" })
         end,
      },

      {
         "CRAG666/code_runner.nvim",
         keys = {
            {
               "<leader>ds",
               function() require("code_runner").run_code() end,
               { desc = "Debug Start (Run Code)" },
            },
         },
         opts = {
            -- mode = "float", -- float, tab, ...
            -- mode = "tab",
            mode = "float",
            float = { border = "rounded" },
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
               -- python = "python3 -u",
               python = "uv run $fileName",
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
               c = {
                  "cd $dir &&",
                  "gcc $fileName -W -Wall -Wextra -pedantic -Werror -g -o $fileNameWithoutExt &&",
                  "$dir/$fileNameWithoutExt",
               },
               -- c = function(...)
               -- 	c_base = {
               -- 		"cd $dir &&",
               -- 		"gcc $fileName -o",
               -- 		"/tmp/$fileNameWithoutExt",
               -- 	}
               -- 	local c_exec = {
               -- 		"&& /tmp/$fileNameWithoutExt &&",
               -- 		"rm /tmp/$fileNameWithoutExt",
               -- 	}
               -- 	vim.ui.input({ prompt = "Add more args:" }, function(input)
               -- 		c_base[4] = input
               -- 		vim.print(vim.tbl_extend("force", c_base, c_exec))
               -- 		require("code_runner.commands").run_from_fn(vim.list_extend(c_base, c_exec))
               -- 	end)
               -- end,
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
               -- lsp_format = "fallback",
            },
            formatters_by_ft = {
               ps1 = { lsp_format = "prefer" },
               lua = { "stylua" },
               python = { "black" },
               rust = { "rustfmt", lsp_format = "fallback" },
               javascript = { "prettierd", "prettier", stop_after_first = true },
               toml = { "taplo" },
               json = { "fixjson", "prettier" },
               cs = { "csharpier" },
               yaml = { "yamlfix" }, -- "yamlfmt",
               markdown = { "rumdl" },
               xml = {},
               -- cpp = { lsp_format = "prefer" },
               -- cpp = {"clang-format"}
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
         cmd = { "Helpview", "Help", "H" },
         ft = "help",
         -- cmd = { "Help", "Helpview" },
         -- ft = "help",
         -- keys = { "<leader>sh" },
      },

      -- {
      --    "maskudo/devdocs.nvim",
      --    cmd = { "DevDocs" },
      --    keys = {
      --       {
      --          "<leader>ho",
      --          mode = "n",
      --          "<cmd>DevDocs get<cr>",
      --          desc = "Get Devdocs",
      --       },
      --       {
      --          "<leader>hi",
      --          mode = "n",
      --          "<cmd>DevDocs install<cr>",
      --          desc = "Install Devdocs",
      --       },
      --       {
      --          "<leader>hv",
      --          mode = "n",
      --          function()
      --             local devdocs = require("devdocs")
      --             local installedDocs = devdocs.GetInstalledDocs()
      --             vim.ui.select(installedDocs, {}, function(selected)
      --                if not selected then return end
      --                local docDir = devdocs.GetDocDir(selected)
      --                -- prettify the filename as you wish
      --                Snacks.picker.files({ cwd = docDir })
      --             end)
      --          end,
      --          desc = "Get Devdocs",
      --       },
      --       {
      --          "<leader>hd",
      --          mode = "n",
      --          "<cmd>DevDocs delete<cr>",
      --          desc = "Delete Devdoc",
      --       },
      --    },
      --    opts = {
      --       ensure_installed = {
      --          "c",
      --          "cpp",
      --          -- "go",
      --          "html",
      --          -- "dom",
      --          "http",
      --          -- "css",
      --          -- "javascript",
      --          -- "rust",
      --          -- some docs such as lua require version number along with the language name
      --          -- check `DevDocs install` to view the actual names of the docs
      --          "lua~5.1",
      --          -- "openjdk~21"
      --       },
      --    },
      -- },

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
               function() require("undotree").toggle() end,
            },
         },
      },

      {
         cmd = "Leet",
         lazy = "le" ~= vim.fn.argv(0, -1),
         "kawre/leetcode.nvim",
         build = ":TSUpdate html", -- if you have `nvim-treesitter` installed
         dependencies = {
            -- "nvim-telescope/telescope.nvim",
            "ibhagwan/fzf-lua",
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
         },
         ---@module 'leetcode.config'
         opts = {
            -- configuration goes here
            lang = "csharp",
            arg = "le",
            injector = {
               ["python3"] = { before = true },
               ["csharp"] = {
                  before = {
                     "using System.Linq;",
                     "using static System.Linq.Enumerable;",
                  },
               },
            },
         },
         -- keys = {
         -- { "<leader>lf" },
         -- {
         --    "<leader>lf",
         --    function() vim.cmd("Leet") end,
         -- },
         -- { "<leader>ldr", "<cmd>Leet run<cr>" },
         -- { "<leader>lds", "<cmd>Leet submit<cr>" },
         -- { "<leader>le", "<cmd>Leet console<cr>" },
         -- },
         config = function(_, opts)
            require("leetcode").setup(opts)
            -- vim.cmd([[Leet list]])
            keymap("n", "<leader>ldt", "<cmd>Leet run<cr>")
            keymap("n", "<leader>lds", "<cmd>Leet submit<cr>")

            keymap("n", "<leader>lf", "<cmd>Leet list<cr>")
            keymap("n", "<leader>li", "<cmd>Leet desc<cr><C-w><C-h>")
            keymap("n", "<leader>lc", "<cmd>Leet console<cr>")
            keymap("n", "<leader>lr", "<cmd>Leet reset<cr>")
            keymap("n", "<leader>lR", "<cmd>Leet restore<cr>")
            keymap("n", "<leader>lI", "<cmd>Leet info<cr>")
            keymap("n", "<leader>lt", "<cmd>Leet tabs<cr>")
            keymap("n", "<leader>lo", "<cmd>Leet open<cr>")
         end,
      },

      {
         "mrcjkb/rustaceanvim",
         version = "^6", -- Recommended
         lazy = false, -- This plugin is already lazy
         filetype = {
            "rust",
         },
      },
   },
})

-- TODO:
-- <leader>gg - neogit
-- <leader>gd - dit diff
-- <leader>gD - git diff picker, or main
-- <leader>gl - log
-- <leader>gp - pull
-- <leader>gP - push
