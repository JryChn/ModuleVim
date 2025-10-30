return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      "ahmedkhalf/project.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local actions = require("telescope.actions")
      telescope.setup({
        defaults = {
          mappings = { n = { ["q"] = actions.close } },
          file_ignore_patterns = { "node_modules", ".git/" },
          layout_config = { prompt_position = "top" },
          sorting_strategy = "ascending",
          prompt_prefix = "   ",
        },
        pickers = {
          find_files = { hidden = true },
        },
        extensions = {
          fzf = { fuzzy = true, override_generic_sorter = true, override_file_sorter = true, case_mode = "smart_case" },
        },
      })
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "projects")

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<space>ff", builtin.find_files, { silent = true, desc = "Telescope find files" })
      vim.keymap.set("n", "<space>fg", builtin.live_grep, { silent = true, desc = "Telescope live grep" })
      vim.keymap.set("n", "<space>fb", builtin.buffers, { silent = true, desc = "Telescope buffers" })
      vim.keymap.set("n", "<space>fh", builtin.help_tags, { silent = true, desc = "Telescope help tags" })
      vim.keymap.set("n", "<space>fs", builtin.grep_string, { silent = true, desc = "Telescope grep string" })
      vim.keymap.set("n", "<space>sb", builtin.current_buffer_fuzzy_find, { silent = true, desc = "Telescope in buffer" })
      vim.keymap.set("n", "\\p", builtin.registers, { silent = true, desc = "Telescope registers" })
      vim.keymap.set("n", "gr", builtin.lsp_references, { silent = true, desc = "LSP references" })
      vim.keymap.set("n", "gI", builtin.lsp_implementations, { silent = true, desc = "LSP implementations" })
      vim.keymap.set("n", "<space>gc", builtin.git_bcommits, { silent = true, desc = "Git buffer commits" })
      vim.keymap.set("n", "<space>gC", builtin.git_commits, { silent = true, desc = "Git commits" })
      vim.keymap.set("n", "<space>gB", builtin.git_branches, { silent = true, desc = "Git branches" })
      vim.keymap.set("n", "<space>gS", builtin.git_status, { silent = true, desc = "Git status" })
      vim.keymap.set("n", "<space>lq", builtin.quickfix, { silent = true, desc = "Quickfix list" })
    end,
  },
}
