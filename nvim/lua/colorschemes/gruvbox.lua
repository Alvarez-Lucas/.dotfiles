---@type LazySpec
return {
	enabled = false,
	"ellisonleao/gruvbox.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	opts = {
		terminal_colors = true, -- add neovim terminal colors
		undercurl = true,
		underline = true,
		bold = true,
		italic = {
			strings = false,
			emphasis = false,
			comments = false,
			operators = false,
			folds = true,
		},
		strikethrough = true,
		invert_selection = false,
		invert_signs = false,
		invert_tabline = false,
		invert_intend_guides = false,
		inverse = true, -- invert background for search, diffs, statuslines and errors
		contrast = "", -- can be "hard", "soft" or empty string
		palette_overrides = {},
		overrides = {
			SignColumn = { bg = "#282828" },
		},
		dim_inactive = false,
		transparent_mode = false,
	},
	config = function(_, opts)
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {}),
			pattern = "gruvbox",
			callback = function()
				vim.api.nvim_set_hl(0, "SnacksPicker", { link = "GruvboxFg1" })
				vim.api.nvim_set_hl(0, "SnacksPickerBorder", { link = "TelescopeNormal" })
				-- vim.api.nvim_set_hl(0, "SnacksPickerListCursorLine", { bg = "#83A598" })

				-- TelescopeNormal = { link = "GruvboxFg1" },
				-- TelescopeSelection = { link = "GruvboxOrangeBold" },
				-- TelescopeSelectionCaret = { link = "GruvboxRed" },
				-- TelescopeMultiSelection = { link = "GruvboxGray" },
				-- TelescopeBorder = { link = "TelescopeNormal" },
				-- TelescopePromptBorder = { link = "TelescopeNormal" },
				-- TelescopeResultsBorder = { link = "TelescopeNormal" },
				-- TelescopePreviewBorder = { link = "TelescopeNormal" },
				-- TelescopeMatching = { link = "GruvboxBlue" },
				-- TelescopePromptPrefix = { link = "GruvboxRed" },
				-- TelescopePrompt = { link = "TelescopeNormal" },

				-- vim.api.nvim_set_hl(0, "SnacksPickerDir", { link = "GruvboxGray" })
				-- vim.api.nvim_set_hl(0, "SnacksPickerPathHidden", { link = "GruvboxGray" })
				-- vim.api.nvim_set_hl(0, "SnacksPickerGitStatusUntracked", { link = "GruvboxGray" })

				-- vim.api.nvim_set_hl(0, "SnacksPicker", { link = "GruvboxBg0" })
				-- vim.api.nvim_set_hl(0, "SnacksPickerBorder", { link = "GruvboxBlue" })

				-- vim.api.nvim_set_hl(0, "SnacksPickerPathIgnored", { link = "GruvboxBg3" })

				-- vim.api.nvim_set_hl(0, "MiniFilesNormal", { bg = palette.background })
				-- vim.api.nvim_set_hl(0, "MiniFilesTitle", { bg = palette.background })
				-- vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { link = "Title" })
				-- vim.api.nvim_set_hl(0, "MiniFilesFile", { bg = palette.background })
				-- vim.api.nvim_set_hl(0, "MiniFilesDirectory", { bg = palette.background })
				-- vim.api.nvim_set_hl(0, "MiniFilesBorder", { bg = palette.background })
				-- vim.api.nvim_set_hl(0, "MiniFilesBorderModified", { link = "Title" })
				-- -- vim.api.nvim_set_hl(0, "MiniFilesBorderModified", { bg = palette.background })
				-- vim.api.nvim_set_hl(0, "MiniFilesCursorLine", { link = "BlinkCmpMenuSelection" })
			end,
		})
		require("gruvbox").setup(opts)
		vim.cmd.colorscheme("gruvbox")
	end,
}
