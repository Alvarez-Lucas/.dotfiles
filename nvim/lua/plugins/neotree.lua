return {
	enabled = false,
	"nvim-neo-tree/neo-tree.nvim",
	-- branch = "v3.x",
	keys = {
		-- { "<leader>e", "<cmd>Neotree reveal current toggle<cr>" },
		{
			"<leader>e",
			function()
				require("neo-tree.command").execute({ position = "current", toggle = true })
				-- action = "focus",          -- OPTIONAL, this is the default value
				-- source = "filesystem",     -- OPTIONAL, this is the default value
				-- position = "left",         -- OPTIONAL, this is the default value
				-- reveal_file = reveal_file, -- path to file or folder to reveal
				-- reveal_force_cwd = true,   -- change cwd without asking if needed
			end,
			-- "<cmd>Neotree reveal current toggle<cr>",
		},
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		"saifulapm/neotree-file-nesting-config",
		-- {"3rd/image.nvim", opts = {}}, -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	lazy = false, -- neo-tree will lazily load itself
	---@module "neo-tree"
	---@type neotree.Config?
	opts = {
		event_handlers = {
			{
				event = "file_open_requested",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
		-- hide_root_node = true,
		-- retain_hidden_root_indent = true,
		filesystem = {
			hijack_netrw_behavior = "open_current",
			filtered_items = {
				hide_dotfiles = false,
				show_hidden_count = true,
				never_show = {
					".DS_Store",
				},
			},
		},
		default_component_configs = {
			indent = {
				with_expanders = true,
				expander_collapsed = "",
				expander_expanded = "",
			},
			trailing_slash = true,
			use_git_status_colors = true,

			git_status = {
				symbols = {
					added = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
					modified = "", -- or "", but this is redundant info if you use git_status_colors on the name
					deleted = "", -- this can only be used in the git_status source
					renamed = "", -- this can only be used in the git_status source
					-- Status type
					untracked = "",
					ignored = "◌",
					unstaged = "",
					staged = "",
					conflict = "",
				},
			},
			-- git_status = { -- TODO
			-- 	symbols = {
			-- 		-- Change type
			-- 		added = "",
			-- 		deleted = "",
			-- 		modified = "",
			-- 		renamed = "",
			-- 		-- Status type
			-- 		untracked = "",
			-- 		ignored = "",
			-- 		unstaged = "",
			-- 		staged = "",
			-- 		conflict = "",
			-- 	},
			-- },
		},
		window = {
			mappings = {
				["<esc>"] = function(state)
					require("neo-tree.command").execute({ action = "close" })
				end,
				["e"] = function(state)
					state.commands["expand_all_nodes"](state)
				end,
				["h"] = function(state)
					local node = state.tree:get_node()
					if node.type == "directory" and node:is_expanded() then
						require("neo-tree.sources.filesystem").toggle_directory(state, node)
					else
						require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
					end
				end,
				["l"] = function(state)
					local node = state.tree:get_node()
					if node.type == "directory" then
						if not node:is_expanded() then
							require("neo-tree.sources.filesystem").toggle_directory(state, node)
						elseif node:has_children() then
							require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
						end
					else
						state.commands["open"](state)
						-- require("neo-tree.sources.filesystem").navigate(state, state.path, node:get_id())
					end
				end,
			},
		},
	},
	config = function(_, opts)
		opts.nesting_rules = require("neotree-file-nesting-config").nesting_rules
		require("neo-tree").setup(opts)
	end,
}
