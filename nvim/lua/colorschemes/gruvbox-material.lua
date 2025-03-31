---@type LazySpec
return {
	enabled = false,
	"sainnhe/gruvbox-material",
	init = function()
		vim.g.gruvbox_material_disable_italic_comment = 1
		vim.g.gruvbox_material_enable_bold = 1
		vim.g.gruvbox_material_better_performance = 1

		--        " Set contrast.
		--        " This configuration option should be placed before `colorscheme gruvbox-material`.
		--        " Available values: 'hard', 'medium'(default), 'soft'
		--        let g:gruvbox_material_background = 'soft'
		vim.g.gruvbox_material_background = "hard"
	end,
	config = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("custom_highlights_gruvboxmaterial", {}),
			pattern = "gruvbox-material",
			callback = function()
				local config = vim.fn["gruvbox_material#get_configuration"]()
				local palette =
					vim.fn["gruvbox_material#get_palette"](config.background, config.foreground, config.colors_override)
				-- local set_hl = vim.fn['gruvbox_material#highlight']
				-- set_hl('Search', palette.none, palette.bg_visual_yellow)
				-- set_hl('IncSearch', palette.none, palette.bg_visual_red)
				vim.api.nvim_set_hl(0, "MiniFilesNormal", { bg = palette.background })
				vim.api.nvim_set_hl(0, "MiniFilesTitle", { bg = palette.background })
				vim.api.nvim_set_hl(0, "MiniFilesTitleFocused", { link = "Title" })
				vim.api.nvim_set_hl(0, "MiniFilesFile", { bg = palette.background })
				vim.api.nvim_set_hl(0, "MiniFilesDirectory", { bg = palette.background })
				vim.api.nvim_set_hl(0, "MiniFilesBorder", { bg = palette.background })
				vim.api.nvim_set_hl(0, "MiniFilesBorderModified", { link = "Title" })
				-- vim.api.nvim_set_hl(0, "MiniFilesBorderModified", { bg = palette.background })
				vim.api.nvim_set_hl(0, "MiniFilesCursorLine", { link = "BlinkCmpMenuSelection" })
			end,
		})

		vim.cmd.colorscheme("gruvbox-material")
	end,
}
