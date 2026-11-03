require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "]d", vim.diagnostic.goto_next, { desc = "LSP go to next diagnostic" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "LSP go to prev diagnostic" })

map("n", "]e", function()
  vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
end, { desc = "LSP go to next error" })

map("n", "[e", function()
  vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
end, { desc = "LSP go to prev error" })

map("n", "<leader>ds", vim.diagnostic.open_float, { desc = "LSP show diagnostic error" })

map("n", "<leader>mp", "<cmd>MarkdownPreviewToggle<CR>", { desc = "Toggle Markdown Preview" })
