return {
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup({ ui = { border = "single" } })
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "tsserver", "gopls", "pyright", "bashls", "jsonls", "html", "cssls", "clangd", "jdtls", "rust_analyzer", "yamlls", "taplo", "eslint" },
        automatic_installation = true,
      })
    end,
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = function()
      require("mason-tool-installer").setup({
        ensure_installed = {
          -- formatters
          "prettierd", "stylua", "shfmt", "gofumpt", "goimports-reviser", "black",
          -- linters/formatters
          "eslint_d", "shellcheck", "ruff",
          -- DAPs
          "delve", "debugpy", "codelldb",
        },
        auto_update = true,
        run_on_start = true,
        start_delay = 3000, -- ms
      })
    end,
  },
}