local defaultOpts = { noremap = true, silent = true }

-- Keep cursor line centered on page scroll
vim.keymap.set("n", "<c-d>", "<c-d>zz", defaultOpts)
vim.keymap.set("n", "<c-u>", "<c-u>zz", defaultOpts)

-- Scroll a half page and center
vim.keymap.set("n", "<c-d>", "<c-d>zz", defaultOpts)
vim.keymap.set("n", "<c-u>", "<c-u>zz", defaultOpts)

-- Delete a buffer
vim.keymap.set("", "<leader>d", "<cmd>bdelete<cr>", defaultOpts)

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
vim.cmd(":vnoremap < <gv")
vim.cmd(":vnoremap > >gv")

-- Move Text
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- Navidate buffers
vim.keymap.set("n", "<left>", "<cmd>bprevious<cr>", defaultOpts)
vim.keymap.set("n", "<right>", "<cmd>bnext<cr>", defaultOpts)

-- Navigate split
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", defaultOpts)
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", defaultOpts)
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", defaultOpts)
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", defaultOpts)

-- Create veritcal and horizontal split
vim.keymap.set("n", "<leader>oL", "<cmd>set splitright<cr>:vsplit<cr>", defaultOpts)
vim.keymap.set("n", "<leader>oJ", "<cmd>set splitbelow<cr>:split<cr>", defaultOpts)
vim.keymap.set("n", "<leader>oK", "<cmd>set nosplitright<cr>:split<cr><C-w><c-k>", defaultOpts)
vim.keymap.set("n", "<leader>oH", "<cmd>set nosplitbelow<cr>:vsplit<cr><C-w><c-h>", defaultOpts)

-- Resize split
vim.keymap.set("n", "<C-Up>", ":resize -5<CR>", defaultOpts)
vim.keymap.set("n", "<C-Down>", ":resize +5<CR>", defaultOpts)
vim.keymap.set("n", "<C-Left>", ":vertical resize -5<CR>", defaultOpts)
vim.keymap.set("n", "<C-Right>", ":vertical resize +5<CR>", defaultOpts)

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
--
--
