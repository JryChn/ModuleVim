return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = { "Neotree" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    config = function()
      require("neo-tree").setup({
        filesystem = {
          filtered_items = { hide_dotfiles = false, hide_gitignored = true },
          follow_current_file = { enabled = true },
          hijack_netrw_behavior = "open_default",
        },
        window = { position = "left", width = 34 },
        default_component_configs = {
          indent = { with_markers = true, indent_size = 2 },
          icon = { folder_closed = "", folder_open = "", folder_empty = "" },
        },
      })
      vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>", { silent = true, desc = "File Explorer" })
    end,
  },
}
