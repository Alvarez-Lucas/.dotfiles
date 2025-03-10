local bufnr = vim.api.nvim_get_current_buf()

vim.keymap.set(
	"n",
	"<leader>ca",
	function()
		vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
	end,
	-- or vim.lsp.buf.codeAction() if you don't want grouping.
	{ silent = true, buffer = bufnr }
)

-- vim.keymap.set(
--   "n",
--   "<space>k", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
--   function()
--     vim.cmd.RustLsp({ "hover", "actions" })
--   end,
--   { silent = true, buffer = bufnr }
-- )
