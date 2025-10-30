return {
  {
    -- Colorschemes you used before
    "projekt0n/github-nvim-theme",
    lazy = true,
  },
  { "sainnhe/gruvbox-material", lazy = true },
  { "sainnhe/everforest", lazy = true },
  { "Th3Whit3Wolf/onebuddy", lazy = true },
  { "tjdevries/colorbuddy.vim", lazy = true },
  { "tjdevries/gruvbuddy.nvim", lazy = true },
  { "sainnhe/edge", lazy = true },

  -- Theme manager and keymaps
  {
    name = "modulevim-theme-manager",
    dir = "./lua/style",
    -- We just need to run our theme setup on startup
    priority = 1000, -- load before UI plugins
    config = function()
      local theme = require("style")
      -- Apply last used theme or a default
      theme.apply_current()

      -- Keymaps
      vim.keymap.set("n", "<leader>tc", theme.cycle, { desc = "Theme: cycle" })
      vim.keymap.set("n", "<leader>tc1", function() theme.set("github_dark") end, { desc = "Theme: GitHub Dark" })
      vim.keymap.set("n", "<leader>tc2", function() theme.set("gruvbox-material") end, { desc = "Theme: gruvbox-material" })
      vim.keymap.set("n", "<leader>tc3", function() theme.set("everforest") end, { desc = "Theme: everforest" })
      vim.keymap.set("n", "<leader>tc4", function() theme.set("onebuddy") end, { desc = "Theme: onebuddy" })
      vim.keymap.set("n", "<leader>tc5", function() theme.set("gruvbuddy") end, { desc = "Theme: gruvbuddy" })
      vim.keymap.set("n", "<leader>tc6", function() theme.set("edge") end, { desc = "Theme: edge" })
    end,
  },
}
