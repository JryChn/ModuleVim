vim.api.nvim_set_keymap('n', '<F2>', ':Vista!!<CR>', {silent = true})

vim.g.vista_disable_statusline = 1
vim.g.vista_default_executive = "nvim_lsp"
vim.g.vista_echo_cursor_strategy = "scroll"
vim.g.vista_vimwiki_executive = "markdown"
vim.g.vista_highlight_whole_line = 1
vim.g.vista_executive_for = {
	vimwiki = "markdown",
	pandoc = "markdown",
}
vim.cmd([[autocmd bufenter * if winnr("$") == 1 && vista#sidebar#IsOpen() | execute "normal! :q!\<CR>" | endif]])
