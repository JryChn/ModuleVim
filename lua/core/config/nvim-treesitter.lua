vim.api.nvim_command("set foldmethod=expr")
vim.api.nvim_command("set foldexpr=nvim_treesitter#foldexpr()")

----------------------------------------------------------------

require 'nvim-treesitter.configs'.setup {
	ensure_installed = {
		"c",
		"lua",
		"rust",
		"java",
		"go",
		"python",
		"bash",
		"cmake",
		"cpp",
		"css",
		"dockerfile",
		"fish",
		"gomod",
		"html",
		"http",
		"kotlin",
		"make",
		"markdown",
		"markdown_inline",
		"php",
		"toml",
		"yaml",
		"xml",
		"vue"
	},
	highlight = {enable = true},
	indent = {enable = true},
	autotag = {enable = true},
	rainbow = {
		enable = true,
		extended_mode = true,

		-- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 2000,
	},
	context_commentstring = {enable = true}
}

vim.cmd ' packadd spellsitter.nvim'
require("spellsitter").setup({hl = 'SpellBad'})
