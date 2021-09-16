vim.g.indent_blankline_filetype_exclude = [['help','dashboard','NvimTree','vista','sagahover']]
vim.g.indent_blankline_use_treesitter = true
vim.api.nvim_set_keymap('n', '<space>ti', "<cmd>IndentBlanklineToggle<cr>", {})
vim.g.indent_blankline_enabled = false
