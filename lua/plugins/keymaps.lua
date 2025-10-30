return {
  name = "modulevim-general-keymaps",
  event = "VeryLazy",
  config = function()
    -- New empty buffer, as in your old mapping label
    vim.keymap.set("n", "\\e", ":enew<CR>", { desc = "New buffer" })
  end,
}
