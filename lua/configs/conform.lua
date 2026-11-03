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

  formatters = {
    ruff_format = {
      command = vim.fn.executable "ruff" == 1 and "ruff" or vim.fn.expand "~/.local/bin/ruff",
      require_cwd = false,
    },
    ruff_organize_imports = {
      command = vim.fn.executable "ruff" == 1 and "ruff" or vim.fn.expand "~/.local/bin/ruff",
      require_cwd = false,
    },
  },

  format_on_save = {
    timeout_ms = 50000,
    lsp_fallback = true,
  },
}

return options
