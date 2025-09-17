local plugins = {

  -- { "elkowar/yuck.vim", lazy = false }, -- load a plugin at startup

  -- {
  -- 	"folke/which-key.nvim",
  -- 	enabled = false,
  -- },

  -- {
  -- 	"neovim/nvim-lspconfig",
  -- 	config = function()
  -- 		require("plugins.configs.lspconfig")
  -- 		require("custom.configs.lspconfig")
  -- 	end,
  -- },

  --{
  --	"nvim-treesitter/nvim-treesitter",
  --	opts = {
  --		ensure_installed = {
  --			"vim",
  --			"lua",
  --			"html",
  --			"css",
  --			"typescript",
  --			"javascript",
  --			"c",
  --			"hcl",
  --			"astro",
  --			"svelte",
  --			"prisma",
  --			"python",
  --			"elixir",
  --			"heex",
  --			"eex",
  --			"rust",
  --			"sql",
  --		},
  --	},
  --},
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
        "autopep8",
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
    "alexghergh/nvim-tmux-navigation",
    config = function()
      local nvim_tmux_nav = require("nvim-tmux-navigation")

      nvim_tmux_nav.setup({
        disable_when_zoomed = true, -- defaults to false
      })

      vim.keymap.set("n", "<C-H>", nvim_tmux_nav.NvimTmuxNavigateLeft)
      vim.keymap.set("n", "<C-J>", nvim_tmux_nav.NvimTmuxNavigateDown)
      vim.keymap.set("n", "<C-K>", nvim_tmux_nav.NvimTmuxNavigateUp)
      vim.keymap.set("n", "<C-L>", nvim_tmux_nav.NvimTmuxNavigateRight)
      vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
      vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    end,
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

  --{
  --	"tpope/vim-fugitive",
  --},

  --{
  --	"hrsh7th/cmp-path",
  --	enabled = false,
  --},
  {
    "epwalsh/obsidian.nvim",
    version = "*", -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
      -- Required.
      "nvim-lua/plenary.nvim",

      -- see below for full list of optional dependencies 👇
    },
    opts = {
      workspaces = {
        {
          name = "kraken",
          path = "~/Documents/kraken",
        },
      },
    },
  },
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
