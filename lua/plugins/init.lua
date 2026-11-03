return {
  {
    "stevearc/conform.nvim",
    --    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "vue-language-server",
        "html-lsp",
        "typescript-tools",
        "lua-language-server",
        "ruff",
        "ty",
        "rust-analyzer",
        "clang-format",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter", -- Only loads when you start typing
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {
        opts = {
          -- enable_close = true,
          -- enable_rename = true,
          -- enable_close_on_slash = true
        },
      }
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "typescript",
        "javascript",
        "vue",
        "asciidoc",
        "cpp",
        "svelte",
        "json",
        "jsonc",
        "rust",
        "qmljs",
        "cmake",
      },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
  },
  {
    "nvim-flutter/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      -- Attach NvChad's default LSP keymaps and capabilities to dartls
      local on_attach = require("nvchad.configs.lspconfig").on_attach
      local capabilities = require("nvchad.configs.lspconfig").capabilities

      require("flutter-tools").setup {
        lsp = {
          on_attach = on_attach,
          capabilities = capabilities,
        },
      }
    end,
  },
  {
    "authzed/tree-sitter-spicedb",
    ft = "authzed",
    init = function()
      vim.filetype.add({
        extension = {
          zed = "authzed",
        },
      })
    end,
    config = function()
      vim.treesitter.language.register("authzed", "authzed")
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "authzed",
        callback = function(args)
          vim.treesitter.start(args.buf, "authzed")
        end,
      })
    end,
  },
  -- 2. Add the standalone spicedb plugin
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
