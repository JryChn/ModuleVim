return {
  "folke/trouble.nvim",
  cmd = { "Trouble", "TroubleToggle" },
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    use_diagnostic_signs = true,
  },
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", desc = "Trouble Diagnostics" },
    { "<leader>xq", "<cmd>Trouble qflist toggle<cr>", desc = "Trouble Quickfix" },
  },
}
