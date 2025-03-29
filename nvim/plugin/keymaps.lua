local defaultOpts = { noremap = true, silent = true }

-- Keep cursor line centered on page scroll
vim.keymap.set("n", "<c-d>", "<c-d>zz", defaultOpts)
vim.keymap.set("n", "<c-u>", "<c-u>zz", defaultOpts)

-- Scroll a half page and center
vim.keymap.set("n", "<c-d>", "<c-d>zz", defaultOpts)
vim.keymap.set("n", "<c-u>", "<c-u>zz", defaultOpts)

-- Delete a buffer
-- vim.keymap.set("", "<leader>d", "<cmd>bdelete<cr>", defaultOpts)

-- Yank into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y') -- yank motion
vim.keymap.set({ "n", "v" }, "<leader>Y", '"+Y') -- yank line

-- Delete into system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", '"+d') -- delete motion
vim.keymap.set({ "n", "v" }, "<leader>D", '"+D') -- delete line

-- Paste from system clipboard
vim.keymap.set("n", "<leader>p", '"+p') -- paste after cursor
vim.keymap.set("n", "<leader>P", '"+P') -- paste before cursor
vim.keymap.set("v", "<leader>p", '"+p')

-- Copy from register into clipboard
vim.keymap.set("n", "<Leader>xy", "<cmd>call setreg('+', getreg('@'))<CR>", defaultOpts)

-- Save File
vim.keymap.set("n", "<C-s>", "<cms>w<cr>", defaultOpts)
vim.keymap.set("n", "<leader>s", "<cmd>w<cr>", defaultOpts)

-- Clear Highlights
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<cr>", defaultOpts)

-- Lazy
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", defaultOpts)

-- Keep register after paste
vim.keymap.set("v", "p", '"_dP', defaultOpts)

-- Quick switch to previous buffer
vim.keymap.set("n", "<bs>", "<C-^>", defaultOpts)

-- Yank to end of line
vim.keymap.set("v", "Y", "y$", defaultOpts)

-- Keep Selection After Indent TODO: Convert to lua
vim.cmd(":vnoremap < <gv", defaultOpts)
vim.cmd(":vnoremap > >gv", defaultOpts)

-- Move Text
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- Navidate buffers
vim.keymap.set("n", "<left>", "<cmd>bprevious<cr>", defaultOpts)
vim.keymap.set("n", "<right>", "<cmd>bnext<cr>", defaultOpts)

-- Navigate split
-- vim.keymap.set("n", "<C-h>", "<C-w><C-h>", defaultOpts)
-- vim.keymap.set("n", "<C-j>", "<C-w><C-j>", defaultOpts)
-- vim.keymap.set("n", "<C-k>", "<C-w><C-k>", defaultOpts)
-- vim.keymap.set("n", "<C-l>", "<C-w><C-l>", defaultOpts)
vim.keymap.set("n", "<C-S-h>", "<C-w><C-h>", defaultOpts)
vim.keymap.set("n", "<C-S-j>", "<C-w><C-j>", defaultOpts)
vim.keymap.set("n", "<C-S-k>", "<C-w><C-k>", defaultOpts)
vim.keymap.set("n", "<C-S-l>", "<C-w><C-l>", defaultOpts)

-- Create veritcal and horizontal split
vim.keymap.set("n", "<leader>oL", "<cmd>set splitright<cr><cmd>vsplit<cr>", defaultOpts)
vim.keymap.set("n", "<leader>oJ", "<cmd>set splitbelow<cr><cmd>split<cr>", defaultOpts)
vim.keymap.set("n", "<leader>oK", "<cmd>set nosplitright<cr><cmd>split<cr><C-w><c-k>", defaultOpts)
vim.keymap.set("n", "<leader>oH", "<cmd>set nosplitbelow<cr><cmd>vsplit<cr><C-w><c-h>", defaultOpts)

-- Resize split
vim.keymap.set("n", "<C-Up>", "<cmd>resize -5<CR>", defaultOpts)
vim.keymap.set("n", "<C-Down>", "<cmd>resize +5<CR>", defaultOpts)
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -5<CR>", defaultOpts)
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +5<CR>", defaultOpts)

-- Navigate terminal
vim.keymap.set("t", "<C-h>", "<C-\\><C-N><C-w>h", defaultOpts)
vim.keymap.set("t", "<C-j>", "<C-\\><C-N><C-w>j", defaultOpts)
vim.keymap.set("t", "<C-k>", "<C-\\><C-N><C-w>k", defaultOpts)
vim.keymap.set("t", "<C-l>", "<C-\\><C-N><C-w>l", defaultOpts)

-- Leave terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-N>", defaultOpts)

-- Open quickfix list
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Oil nvim
vim.keymap.set("n", "-", "<cmd>Oil<cr>", { desc = "Open parent directory" })

--   { "-",    "<CMD>Oil<CR>", desc = "" },
--
--   { "<bs>", "<CMD>Oil<CR>", desc = "Open parent directory", ft = { "Oil" } }

-- vim.keymap.set("n", "<leader>x", "<cmd>.lua<CR>", { desc = "Execute the current line" })
-- vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- vim.keymap.set("n", "<leader>e", "<cmd>Lexplore<cr>")
-- vim.keymap.set("n", "<leader>E", "<cmd>Lexplore %:p:h<cr>")
