return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    require("plugins.config.which-key")
    -- General keymaps hosted under which-key spec per user choice
    vim.keymap.set("n", "\\e", ":enew<CR>", { desc = "New buffer" })
  end,
}
