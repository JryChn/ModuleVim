return {
  "echasnovski/mini.bufremove",
  keys = {
    { "<leader>bd", function() require("mini.bufremove").delete(0, false) end, desc = "Delete buffer" },
    { "<leader>bD", function() require("mini.bufremove").delete(0, true) end,  desc = "Force delete buffer" },
  },
  config = function()
    require("mini.bufremove").setup()
  end,
}
