vim.g.indent_blankline_filetype_exclude = [['help','dashboard','NvimTree','vista','sagahover']]
--vim.g.indent_blankline_char = '| '
--vim.g.indent_blankline_show_end_of_line = true
--vim.g.indent_blankline_use_treesitter = true
--vim.cmd [[highlight IndentBlanklineChar1 guibg=#4E5F00 guifg=#788898 gui=nocombine]]
--vim.g.indent_blankline_char_highlight_list={'IndentBlanklineChar1'}
--vim.g.indent_blankline_space_char_highlight_list = 'highlight IndentBlanklineSpaceChar1 guibg=#4E5F00 gui=nocombine'
--vim.api.nvim_command("IndentBlanklineEnable")
vim.cmd [[highlight IndentOdd guifg=NONE guibg=NONE gui=nocombine]]
vim.cmd [[highlight IndentEven guifg=NONE guibg=#0000ff gui=nocombine]]
-- and then use the highlight groups
vim.g.indent_blankline_char_highlight_list = {"IndentOdd", "IndentEven"}
vim.g.indent_blankline_space_char_highlight_list = {"IndentOdd", "IndentEven"}
--
-- -- don't show any characters
vim.g.indent_blankline_char = " "
vim.g.indent_blankline_space_char = " "
--
-- -- when using background, the trailing indent is not needed / looks wrong
vim.g.indent_blankline_show_trailing_blankline_indent = false
