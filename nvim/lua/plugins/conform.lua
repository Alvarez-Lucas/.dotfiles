---@type LazySpec
return {
	"stevearc/conform.nvim",
	event = {
		"BufWritePre",
	},
	dependencies = {
		"williamboman/mason.nvim",
		{ "zapling/mason-conform.nvim", opts = {} },
	},
	opts = {
		format_on_save = {
			-- These options will be passed to conform.format()
			timeout_ms = 3000,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			ps1 = { lsp_format = "prefer" },
			lua = { "stylua", stop_after_first = true },
			-- Conform will run multiple formatters sequentially
			python = { "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
			-- toml = { "taplo" },
			json = { "fixjson", "prettier" },
			cs = { "csharpier" },
			yaml = { "yamlfix" }, -- "yamlfmt"
			-- norg = { command = "C:/Users/lalvarez/source/repos/norg-fmt/target/release/norg-fmt.exe" },
		},
	},
}
