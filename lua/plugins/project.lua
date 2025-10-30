return {
  "ahmedkhalf/project.nvim",
  event = "VeryLazy",
  config = function()
    require("project_nvim").setup({
      manual_mode = false,
      detection_methods = { "lsp", "pattern" },
      patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "package.json", "pyproject.toml", "Makefile" },
      ignore_lsp = {},
      exclude_dirs = { "~/.cargo/*" },
      show_hidden = true,
      silent_chdir = true,
    })
    require("telescope").load_extension("projects")
  end,
}
