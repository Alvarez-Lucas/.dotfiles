if vim.g.neovide then
	vim.g.neovide_scale_factor = 1.0
	vim.g.neovide_padding_top = 8
	vim.g.neovide_padding_bottom = 8
	vim.g.neovide_padding_right = 8
	vim.g.neovide_padding_left = 8

	-- vim.keymap.set("n", "<c-s>", ":w<CR>") -- Save
	-- vim.keymap.set("v", "<c-c>", '"+y') -- Copy
	-- vim.keymap.set("n", "<v-v>", '"+P') -- Paste normal mode
	-- vim.keymap.set("v", "<c-v>", '"+P') -- Paste visual mode
	-- vim.keymap.set("c", "<c-v>", "<C-R>+") -- Paste command mode
	-- vim.keymap.set("i", "<c-v>", '<ESC>l"+Pli') -- Paste insert mode

	local change_scale_factor = function(delta)
		vim.g.neovide_scale_factor = vim.g.neovide_scale_factor * delta
	end
	vim.keymap.set("n", "<C-=>", function()
		change_scale_factor(1.25)
	end)
	vim.keymap.set("n", "<C-->", function()
		change_scale_factor(1 / 1.25)
	end)
end
--
-- vim.api.nvim_set_keymap("", "<C-v>", "+p<CR>", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("!", "<C-v>", "<C-R>+", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("t", "<C-v>", "<C-R>+", { noremap = true, silent = true })
-- vim.api.nvim_set_keymap("v", "<C-v>", "<C-R>+", { noremap = true, silent = true })
