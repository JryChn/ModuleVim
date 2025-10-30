return {
  "stevearc/aerial.nvim",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("aerial").setup({
      backends = { "lsp", "treesitter", "markdown" },
      layout = { default_direction = "prefer_right", min_width = 28 },
      show_guides = true,
      filter_kind = false,
    })
    -- Keymaps
    vim.keymap.set("n", "<leader>o", "<cmd>AerialToggle! right<CR>", { desc = "Symbols Outline" })
  end,
}
