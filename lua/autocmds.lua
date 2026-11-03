require "nvchad.autocmds"
--
-- local autocmd = vim.api.nvim_create_autocmd
--
-- autocmd("BufWritePre", {
--   pattern = "*.py",
--   callback = function()
--     vim.lsp.buf.code_action({
--       context = { only = { "source.organizeImports" }, diagnostics = {} },
--       apply = true,
--     })
--
--     vim.lsp.buf.format({
--       async = false,
--       filter = function(client)
--         return client.name == "ruff"
--       end,
--     })
--   end,
-- })
--

vim.filetype.add {
  extension = {
    containerfile = "dockerfile",
  },
  filename = {
    ["Containerfile"] = "dockerfile",
  },
}
