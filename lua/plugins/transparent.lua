return {
  "xiyaowong/transparent.nvim",
  cmd = { "TransparentEnable", "TransparentDisable", "TransparentToggle" },
  config = function()
    require("plugins.config.nvim-transparent")
  end,
}