vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")
require 'nvim-treesitter.configs'.setup{
  ensure_installed = "all",
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  rainbow = {
    enable = true
  },
}
