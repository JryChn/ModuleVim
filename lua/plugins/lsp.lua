return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lsp = require("mason-lspconfig")
    local defaults = require("lsp.defaults")

    mason_lsp.setup_handlers({
      -- default handler for most servers
      function(server)
        if server == "jdtls" then
          return -- use dedicated Java module
        end
        lspconfig[server].setup({
          capabilities = defaults.capabilities,
          on_attach = defaults.on_attach,
        })
      end,
      -- custom server: Lua
      lua_ls = function()
        lspconfig.lua_ls.setup({
          capabilities = defaults.capabilities,
          on_attach = defaults.on_attach,
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
              telemetry = { enable = false },
            },
          },
        })
      end,
      -- ensure we do not auto-config jdtls here; Java module will handle it
      jdtls = function() end,
    })
  end,
}