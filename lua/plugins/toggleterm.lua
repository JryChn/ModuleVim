return {
  "akinsho/toggleterm.nvim",
  version = "*",
  keys = {
    { [[<C-\>]], [[<cmd>ToggleTerm<cr>]], desc = "Toggle Terminal" },
  },
  config = function()
    require("core.config.nvim-toggleterm")
  end,
}
