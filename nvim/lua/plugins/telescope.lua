-- Telescope
-- See `:help telescope.builtin`

return {
	tag = "0.1.8", -- or branch = '0.1.x',
	"nvim-telescope/telescope.nvim",
	event = "VeryLazy",
	keys = { -- Sourced from kickstart.nvim
		{ "<leader>sf", ":<CMD>Telescope find_files<cr>", { desc = "[S]earch [F]iles" } },
		{ "<leader>sg", ":<CMD>Telescope live_grep<cr>", { desc = "[S]earch by [G]rep" } },
		{ "<leader>sd", ":<CMD>Telescope diagnostics<cr>", { desc = "[S]earch [D]iagnostics" } },
		{ "<leader>s.", ":<CMD>Telescope oldfiles<cr>", { desc = '[S]earch Recent Files ("." for repeat)' } },
		{ "<leader><leader>", ":<CMD>Telescope buffers<cr>", { desc = "[ ] Find existing buffers" } },
		{ "<leader>sz", ":<CMD>Telescope zoxide list<cr>", { desc = "[S] Zoxide" } },
		{ "<leader>/" },
		{ "<leader>sn" },
		-- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' }) -- meh, probably don't need this
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"natecraddock/telescope-zf-native.nvim",
		"jvgrootveld/telescope-zoxide",
	},
	config = function()
		local actions = require("telescope.actions")
		local z_utils = require("telescope._extensions.zoxide.utils")
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<esc>"] = actions.close,
					},
				},
			},
			pickers = {
				-- Default configuration for builtin pickers goes here:
				-- picker_name = {
				--   picker_config_key = value,
				--   ...
				-- }
				-- Now the picker_config_key will be applied every time you call this
				-- builtin picker
			},
			extensions = {
				["zf-native"] = {
					file = { -- options for sorting file-like items
						enable = true, -- override default telescope file sorter
						highlight_results = true, -- highlight matching text in results
						match_filename = true, -- enable zf filename match priority
						initial_sort = nil, -- optional function to define a sort order when the query is empty
						smart_case = true, -- set to false to enable case sensitive matching
					},
					generic = { -- options for sorting all other items
						enable = true, -- override default telescope generic item sorter
						highlight_results = true, -- highlight matching text in results
						match_filename = false, -- disable zf filename match priority
						initial_sort = nil, -- optional function to define a sort order when the query is empty
						smart_case = true, -- set to false to enable case sensitive matching
					},
				},
				zoxide = {
					prompt_title = "zoxide",
					mappings = {
						default = {
							after_action = function(selection)
								print("Update to (" .. selection.z_score .. ") " .. selection.path)
							end,
						},
						["<C-s>"] = {
							before_action = function(selection)
								print("before C-s")
							end,
							action = function(selection)
								vim.cmd.edit(selection.path)
							end,
						},
						-- Opens the selected entry in a new split
						["<C-q>"] = { action = z_utils.create_basic_command("split") },
					},
				},
			},
		})
		require("telescope").load_extension("zf-native")

		local builtin = require("telescope.builtin")

		-- TODO: Convert to lazy keybind, see if you really like that theme
		-- Slightly advanced example of overriding default behavior and theme
		vim.keymap.set("n", "<leader>/", function()
			-- You can pass additional configuration to Telescope to change the theme, layout, etc.
			builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				winblend = 10,
				previewer = false,
			}))
		end, { desc = "[/] Fuzzily search in current buffer" })

		-- TODO: Convert to lazy keybind, see if you really like that theme
		-- It's also possible to pass additional configuration options.
		--  See `:help telescope.builtin.live_grep()` for information about particular keys
		-- vim.keymap.set("n", "<leader>s/", function()
		--   builtin.live_grep({
		--     grep_open_files = true,
		--     prompt_title = "Live Grep in Open Files",
		--   })
		-- end, { desc = "[S]earch [/] in Open Files" })

		-- Shortcut for searching your Neovim configuration files
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })
	end,
}

-- Old keys
-- keys = { -- Sourced from kickstart.nvim
-- 	{ "<leader>sh", ":<CMD>Telescope help_tags<cr>", { desc = "[S]earch [H]elp" } },
-- 	{ "<leader>sk", ":<CMD>Telescope keymaps<cr>", { desc = "[S]earch [K]eymaps" } },
-- 	{ "<leader>sf", ":<CMD>Telescope find_files<cr>", { desc = "[S]earch [F]iles" } },
-- 	{ "<leader>ss", ":<CMD>Telescope builtin<cr>", { desc = "[S]earch [S]elect Telescope" } },
-- 	{ "<leader>sw", ":<CMD>Telescope grep_string<cr>", { desc = "[S]earch current [W]ord" } },
-- 	{ "<leader>sg", ":<CMD>Telescope live_grep<cr>", { desc = "[S]earch by [G]rep" } },
-- 	{ "<leader>sd", ":<CMD>Telescope diagnostics<cr>", { desc = "[S]earch [D]iagnostics" } },
-- 	{ "<leader>s.", ":<CMD>Telescope oldfiles<cr>", { desc = '[S]earch Recent Files ("." for repeat)' } },
-- 	{ "<leader><leader>", ":<CMD>Telescope buffers<cr>", { desc = "[ ] Find existing buffers" } },
-- 	{ "<leader>sz", ":<CMD>Telescope zoxide list<cr>", { desc = "[S] Zoxide" } },
-- 	-- vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' }) -- meh, probably don't need this
--
