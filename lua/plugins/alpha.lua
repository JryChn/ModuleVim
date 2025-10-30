return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    local ok, banner = pcall(require, "style.banner")
    dashboard.section.header.val = ok and banner or {
      "",
      "  Welcome to ModuleVim",
      "",
    }
    dashboard.section.buttons.val = {
      dashboard.button("f", "  Find file", ":Telescope find_files<CR>"),
      dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("s", "  Settings", ":e $MYVIMRC<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }
    dashboard.section.footer.val = "  Powered by lazy.nvim"
    alpha.setup(dashboard.config)
    -- Keymap to open the dashboard
    vim.keymap.set("n", "<leader>aa", ":Alpha<CR>", { desc = "Alpha (welcome)" })
  end,
}