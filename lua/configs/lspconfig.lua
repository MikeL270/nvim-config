require("nvchad.configs.lspconfig").defaults()

local mason_path = vim.fn.stdpath "data" .. "/mason/packages/vue-language-server"
local vue_plugin_path = mason_path .. "/node_modules/@vue/language-server"

vim.lsp.config("ts_ls", {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_plugin_path,
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = { "javascript", "typescript", "vue" },
})

vim.lsp.config("vue_ls", {
  filetypes = { "vue" },
  root_dir = vim.fs.root(0, { "package.json", "tsconfig.json", ".git" }),
  init_options = {
    typescript = {
      tsdk = mason_path .. "/node_modules/typescript/lib",
    },
  },
})

vim.lsp.config("clangd", {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--query-driver=/usr/bin/clang++,/usr/local/bin/clang++,/usr/bin/g++,/usr/bin/*-g++",
    "--header-insertion=never",
  },
  filetypes = { "c", "cpp", "objc", "objcpp" },
})

vim.lsp.config("rust_analyzer", {
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
      cargo = {
        allFeatures = true,
      },
      procMacro = {
        enable = true,
      },
    },
  },
})

vim.lsp.config("qmlls", {
  cmd = { "qmlls" },
  filetypes = { "qml", "qmljs" },
})

vim.lsp.config("asciidoc_lsp", {
  cmd = { "asciidoc-lsp", "--stdio" },
  filetypes = { "asciidoc", "adoc" },
  root_dir = vim.fs.root(0, { ".git" }),
})

vim.lsp.config("ty", {
  settings = {
    ty = {
      -- Add custom ty settings here if needed
    },
  },
})

local servers = {
  "html",
  "cssls",
  "ty",
  "ruff",
  "clangd",
  "rust_analyzer",
  "qmlls",
  "ts_ls",
  "vue_ls",
  "svelte",
  "eslint",
  "asciidoc_lsp",
}
vim.lsp.enable(servers)

vim.lsp.config("ruff", {
  on_attach = function(client, _)
    client.server_capabilities.hoverProvider = false
  end,
})

-- read :h vim.lsp.config for changing options of lsp servers
