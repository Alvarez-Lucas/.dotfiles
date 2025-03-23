vim.keymap.set("n", "<leader>e", "<cmd>:Lexplore<cr>", { buffer = true })
vim.keymap.set("n", "H", "u", { buffer = true })
vim.keymap.set("n", "h", "^", { buffer = true })
vim.keymap.set("n", "L", "<cr>", { buffer = true })
vim.keymap.set("n", "l", "<cr><cmd>Lexplore<cr>", { buffer = true })
vim.keymap.set("n", "q", "<cmd>Lexplore<cr>", { buffer = true })
vim.keymap.set("n", "P", "<c-w>z", { buffer = true })

-- function! NetrwMapping()
--   nmap <buffer> h -^
--
--   nmap <buffer> . gh
--   nmap <buffer> P <C-w>z
--
--   nmap <buffer> <Leader>dd :Lexplore<CR>
-- endfunction
