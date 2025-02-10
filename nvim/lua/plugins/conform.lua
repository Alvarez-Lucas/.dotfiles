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
			timeout_ms = 500,
			lsp_format = "fallback",
		},
		formatters_by_ft = {
			ps1 = { lsp_format = "prefer" },
			lua = { "stylua" },
			-- Conform will run multiple formatters sequentially
			python = { "isort", "black" },
			-- You can customize some of the format options for the filetype (:help conform.format)
			rust = { "rustfmt", lsp_format = "fallback" },
			-- Conform will run the first available formatter
			javascript = { "prettierd", "prettier", stop_after_first = true },
			-- toml = { "taplo" },
			json = { "prettier" },
		},
	},
}
