return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPost", "BufWritePost", "InsertLeave" },
  config = function()
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      sh = { "shellcheck" },
      python = { "ruff" },
    }

    local function try_lint()
      local names = lint.linters_by_ft[vim.bo.filetype]
      if names then
        lint.try_lint()
      end
    end

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      callback = try_lint,
    })
  end,
}