local plugins = {
	{
		"mason-org/mason.nvim",
		keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
		build = ":MasonUpdate",
		opts_extend = { "ensure_installed" },
		opts = {
			ensure_installed = {
				-- lua stuff
				"lua-language-server",
				"stylua",

				-- web dev stuff
				"css-lsp",
				"html-lsp",
				"typescript-language-server",
				"eslint-lsp",
				"eslint_d",
				"terraform-ls",
				"astro-language-server",
				"svelte-language-server",
				"prisma-language-server",
				"golangci-lint-langserver",
				"golangci-lint",
				"pyright",
				"python-lsp-server",
				"black",
				"ruff",
				"elixir-ls",
				"rust-analyzer",
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			local registry = require("mason-registry")
			registry.refresh(function()
				for _, tool in ipairs(opts.ensure_installed) do
					local p = registry.get_package(tool)
					if not p:is_installed() then
						p:install()
					end
				end
			end)
		end,
	},
	{ "mason-org/mason-lspconfig.nvim", version = "^1.0.0" },

	--{
	--	"max397574/better-escape.nvim",
	--	event = "InsertEnter",
	--	config = function()
	--		require("better_escape").setup()
	--	end,
	--},

	-- {
	-- 	"jose-elias-alvarez/null-ls.nvim",
	-- 	after = "nvim-lspconfig",
	-- 	lazy = false,
	-- 	config = function()
	-- 		require("custom.configs.null-ls")
	-- 	end,
	-- },

	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
			"TmuxNavigatorProcessList",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	--{
	--	"tanvirtin/vgit.nvim",
	--	lazy = false,
	--	after = { "nvim-web-devicons" },
	--	requires = { "nvim-lua/plenary.nvim" },
	--	config = function()
	--		require("vgit").setup()
	--	end,
	--},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
			vim.g.mkdp_auto_refresh = 1
			vim.g.mkdp_refresh_slow = 1
			vim.g.mkdp_command_for_global = 0
			vim.g.mkdp_echo_preview_url = 1
			vim.g.mkdp_port = 7777
		end,
		ft = { "markdown" },
	},

	{
		"nvim-treesitter/nvim-treesitter",
		opts = { ensure_installed = { "git_config", "gitcommit", "git_rebase", "gitignore", "gitattributes" } },
	},
	--{
	--	"tpope/vim-fugitive",
	--},

	--{
	--	"hrsh7th/cmp-path",
	--	enabled = false,
	--},
	-- {
	-- 	"CopilotC-Nvim/CopilotChat.nvim",
	-- 	branch = "canary",
	-- 	lazy = false,
	-- 	dependencies = {
	-- 		{ "zbirenbaum/copilot.lua" }, -- or github/copilot.vim
	-- 		{ "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
	-- 	},
	-- 	opts = {
	-- 		debug = true, -- Enable debugging
	-- 		-- See Configuration section for rest
	-- 	},
	-- 	-- See Commands section for default commands if you want to lazy load on them
	-- },
}

return plugins
