-- Shared LSP defaults: capabilities and on_attach
local M = {}

-- Capabilities from nvim-cmp
M.capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Rich on_attach with Telescope/Diagnostics/Trouble integrations
M.on_attach = function(_, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr }
  local builtin_ok, builtin = pcall(require, "telescope.builtin")

  -- Core LSP
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)

  -- Diagnostics navigation
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  -- Float is handled nicely by noice/trouble, so we avoid binding <leader>e here

  -- Telescope integrations (fallback to builtins only if available)
  if builtin_ok then
    vim.keymap.set("n", "gr", builtin.lsp_references, opts)
    vim.keymap.set("n", "gi", builtin.lsp_implementations, opts)
  else
    vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
  end

  -- Trouble shortcuts (safe even if Trouble not installed; user can override)
  vim.keymap.set("n", "<space>lq", "<cmd>TroubleToggle quickfix<CR>", opts)
  vim.keymap.set("n", "<space>ll", "<cmd>TroubleToggle document_diagnostics<CR>", opts)
end

return M
