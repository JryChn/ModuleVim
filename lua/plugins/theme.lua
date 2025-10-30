return {
  {
    -- Host spec for theme init & keymaps (runs very early)
    "projekt0n/github-nvim-theme",
    priority = 1000,
    lazy = false,
    init = function()
      local theme = require("style")
      theme.apply_current()
      -- Keymaps for switching themes
      vim.keymap.set("n", "<leader>tc", theme.cycle, { desc = "Theme: cycle" })
      vim.keymap.set("n", "<leader>tc1", function() theme.set("github_dark") end, { desc = "Theme: GitHub Dark" })
      vim.keymap.set("n", "<leader>tc2", function() theme.set("gruvbox-material") end, { desc = "Theme: gruvbox-material" })
      vim.keymap.set("n", "<leader>tc3", function() theme.set("everforest") end, { desc = "Theme: everforest" })
      vim.keymap.set("n", "<leader>tc4", function() theme.set("onebuddy") end, { desc = "Theme: onebuddy" })
      vim.keymap.set("n", "<leader>tc5", function() theme.set("gruvbuddy") end, { desc = "Theme: gruvbuddy" })
      vim.keymap.set("n", "<leader>tc6", function() theme.set("edge") end, { desc = "Theme: edge" })
    end,
  },
  { "sainnhe/gruvbox-material", lazy = true },
  { "sainnhe/everforest", lazy = true },
  { "Th3Whit3Wolf/onebuddy", lazy = true },
  { "tjdevries/colorbuddy.vim", lazy = true },
  { "tjdevries/gruvbuddy.nvim", lazy = true },
  { "sainnhe/edge", lazy = true },
}
