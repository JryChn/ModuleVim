vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")




----------------------------------------------------------------

require 'nvim-treesitter.configs'.setup{
  ensure_installed = "all",
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  },
  autotag = {
      enable = true
  },
  rainbow = {
    enable = true,
    extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
    max_file_lines = 2000,
  },
  context_commentstring = {
    enable = true
  }
}
vim.cmd' packadd lsp-colors.nvim'
require("lsp-colors").setup({
  Error = "#db4b4b",
  Warning = "#e0af68",
  Information = "#0db9d7",
  Hint = "#10B981"
})

vim.cmd' packadd spellsitter.nvim'
require("spellsitter").setup({
	hl = 'SpellBad'
})
