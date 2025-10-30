return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  opts = {
    notify_on_error = false,
    format_on_save = function(bufnr)
      local disabled = vim.b[bufnr].disable_autoformat or vim.g.disable_autoformat
      if disabled then return end
      return { timeout_ms = 1500, lsp_fallback = true }
    end,
    formatters_by_ft = {
      lua = { "stylua" },
      javascript = { "prettierd", "prettier" },
      javascriptreact = { "prettierd", "prettier" },
      typescript = { "prettierd", "prettier" },
      typescriptreact = { "prettierd", "prettier" },
      json = { "prettierd", "prettier" },
      css = { "prettierd", "prettier" },
      html = { "prettierd", "prettier" },
      go = { "gofumpt", "goimports-reviser" },
      sh = { "shfmt" },
      python = { "ruff_format", "black" },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)
    -- Keymaps to toggle autoformat
    vim.api.nvim_create_user_command("FormatDisable", function()
      vim.g.disable_autoformat = true
    end, { desc = "Disable autoformat-on-save" })
    vim.api.nvim_create_user_command("FormatEnable", function()
      vim.g.disable_autoformat = false
    end, { desc = "Enable autoformat-on-save" })
    local function do_format()
      require("conform").format({ async = true })
    end
    vim.keymap.set({"n","v"}, "<leader>f", do_format, { desc = "Format buffer" })
    vim.keymap.set({"n"}, "<leader>bf", do_format, { desc = "Format this buffer" })
  end,
}