return {
	"nyoom-engineering/oxocarbon.nvim",
	-- Add in any other configuration;
	--   event = foo,
	--   config = bar
	--   end,
	--
	enabled = true,
	priority = 1000,
	config = function()
		vim.opt.background = "light" -- set this to dark or light
		vim.cmd.colorscheme("oxocarbon")
	end,
}
