---@type LazySpec
return {
	enabled = true,
	"echasnovski/mini.files",
	lazy = false,
	keys = {
		{
			"<leader>e",
			function()
				if not MiniFiles.close() then
					MiniFiles.open()
				end
			end,
		},
	},
	opts = {
		-- Module mappings created only inside explorer.
		-- Use `''` (empty string) to not create one.
		mappings = {
			close = "q",
			go_in = "L",
			go_in_plus = "",
			go_out = "H",
			go_out_plus = "",
			mark_goto = "'",
			mark_set = "m",
			reset = "<BS>",
			reveal_cwd = ".",
			show_help = "g?",
			synchronize = "=",
			trim_left = "<",
			trim_right = ">",
		},

		-- General options
		options = {
			-- Whether to delete permanently or move into module-specific trash
			permanent_delete = true,
			-- Whether to use for editing directories
			use_as_default_explorer = true,
		},

		-- Customization of explorer windows
		windows = {
			-- Maximum number of windows to show side by side
			max_number = math.huge,
			-- Whether to show preview of file/directory under cursor
			preview = true,
			-- Width of focused window
			width_focus = 30,
			-- -- Width of non-focused window
			width_nofocus = 30,
			-- Width of preview window
			width_preview = 30,
			-- width_preview = 120,
		},
	},
	config = function(_, opts)
		require("mini.files").setup(opts)

		-- local config = vim.fn["gruvbox_material#get_configuration"]()
		-- local palette =
		-- 	vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
		-- vim.api.nvim_set_hl(0, "MiniFilesNormal", { bg = palette.background })
		-- vim.api.nvim_set_hl(0, "MiniFilesTitle", { bg = palette.background })
		-- vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { bg = palette.background })
		-- vim.api.nvim_set_hl(0, "MiniFilesCursorLine", { bg = palette.background })
		-- vim.api.nvim_set_hl(0, "MiniFiles", { bg = palette.background })

		-- * `MiniFilesBorder` - border of regular windows.
		-- * `MiniFilesBorderModified` - border of windows showing modified buffer.
		-- * `MiniFilesCursorLine` - cursor line in explorer windows.
		-- * `MiniFilesDirectory` - text and icon representing directory.
		-- * `MiniFilesFile` - text representing file.
		-- * `MiniFilesNormal` - basic foreground/background highlighting.
		-- * `MiniFilesTitle` - title of regular windows.
		-- * `MiniFilesTitleFocused` - title of focused window.

		-- local set_hl = vim.fn["gruvbox_material#highlight"]
		--
		-- set_hl("Search", palette.none, palette.bg_visual_yellow)
		-- set_hl("IncSearch", palette.none, palette.bg_visual_red)

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesWindowOpen",
			callback = function(args)
				local win_id = args.data.win_id

				-- Customize window-local settings
				vim.api.nvim_win_set_config(win_id, { border = "rounded" })
			end,
		})

		local map_split = function(buf_id, lhs, direction, close_on_file)
			local rhs = function()
				local new_target_window
				local cur_target_window = require("mini.files").get_explorer_state().target_window
				if cur_target_window ~= nil then
					vim.api.nvim_win_call(cur_target_window, function()
						vim.cmd("belowright " .. direction .. " split")
						new_target_window = vim.api.nvim_get_current_win()
					end)

					require("mini.files").set_target_window(new_target_window)
					require("mini.files").go_in({ close_on_file = close_on_file })
				end
			end

			local desc = "Open in " .. direction .. " split"
			if close_on_file then
				desc = desc .. " and close"
			end
			vim.keymap.set("n", lhs, rhs, { buffer = buf_id, desc = desc })
		end

		local files_set_cwd = function(path)
			-- Works only if cursor is on the valid file system entry
			local cur_entry_path = MiniFiles.get_fs_entry().path
			local cur_directory = vim.fs.dirname(cur_entry_path)
			vim.fn.chdir(cur_directory)
		end

		vim.api.nvim_create_autocmd("User", {
			pattern = "MiniFilesBufferCreate",
			callback = function(args)
				local buf_id = args.data.buf_id
				vim.keymap.set("n", "gc", files_set_cwd, { buffer = args.data.buf_id })
				-- vim.keymap.set(
				-- 	"n",
				-- 	opts.mappings and opts.mappings.change_cwd or "gc",
				-- 	files_set_cwd,
				-- 	{ buffer = args.data.buf_id, desc = "Set cwd" }
				-- )
				map_split(
					buf_id,
					opts.mappings and opts.mappings.go_in_horizontal_plus or "<leader>oJ",
					"horizontal",
					false
				)
				map_split(
					buf_id,
					opts.mappings and opts.mappings.go_in_vertical_plus or "<leader>oL",
					"vertical",
					false
				)
			end,
		})
	end,
}
