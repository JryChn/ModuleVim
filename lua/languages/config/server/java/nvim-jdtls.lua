-- Simplified Java LSP setup using lspconfig + Mason
local M = {}

function M.setup()
  local lspconfig = require("lspconfig")
  local defaults = require("lsp.defaults")

  -- 1) Mason installs jdtls and puts it on PATH
  -- 2) lspconfig discovers it automatically
  -- 3) We reuse global defaults (capabilities + on_attach)
  lspconfig.jdtls.setup({
    capabilities = defaults.capabilities,
    on_attach = defaults.on_attach,
    -- You may add jdtls-specific settings here if needed, e.g.:
    -- settings = { java = { format = { settings = { url = "", profile = "" } } } }
  })
end

return M
