return {
  "smoka7/hop.nvim",
  version = "*",
  keys = {
    { "s", function() require("hop").hint_words() end, mode = {"n","x","o"}, desc = "Hop words" },
  },
  config = function()
    require("plugins.config.hop")
  end,
}
