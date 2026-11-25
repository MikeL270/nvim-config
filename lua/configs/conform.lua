local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    python = { "ruff_organize_imports", "ruff_format" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    svelte = { "prettier" },
    vue = { "prettier" },
    rust = { "rustfmt" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    qml = { "qmlformat" },
    qmljs = { "qmlformat" },
  },

  format_on_save = {
    timeout_ms = 3000,
    lsp_format = "fallback",
  },
}

return options
