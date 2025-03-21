vim.cmd("let &fcs='eob: '")
-- vim.opt.background = "light"
vim.opt.inccommand = "split" -- Preview for substitute
vim.opt.laststatus = 3 -- Global status line
vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.splitbelow = true -- Vertical split direction
vim.opt.splitright = true -- Horizontal split direction
vim.opt.expandtab = true --
vim.opt.smarttab = true --
vim.opt.ignorecase = true --
vim.opt.smartcase = true --
vim.opt.hlsearch = true --
vim.opt.incsearch = true --
vim.opt.signcolumn = "yes" --
vim.opt.swapfile = false --
vim.opt.wrap = true --
vim.opt.linebreak = true --
vim.opt.breakindent = true --
vim.opt.shiftwidth = 2 --
vim.opt.tabstop = 2 --
vim.opt.cursorline = true --
vim.opt.mouse = "" --
vim.opt.scrolloff = 8 --
vim.opt.sidescrolloff = 8 --
vim.opt.termguicolors = true --
vim.opt.showmode = false
vim.opt.undofile = true
vim.opt.updatetime = 250
vim.opt.hidden = true
-- vim.cmd [[set hidden]]
vim.opt.confirm = true
vim.opt.iskeyword:append("-") --Make Keywords include "-"
vim.opt.shortmess:append({ I = true }) -- Removes the nvim splash screen
-- vim.opt.shortmess = "" -- What do?

-- vim.opt.fillchars = { eob = " " } -- Remove end of buffer character
vim.opt.cmdheight = 1 -- Command Height

-- What does this do?
-- Don't have `o` add a comment
-- opt.formatoptions:remove "o"
