--HINT: these keymap has already transformed to which-key
vim.api.nvim_set_keymap(
	"n",
	"<space>ff",
	"<cmd>lua require\'telescope.builtin\'.find_files()<CR>",
	{silent = true}
)
vim.api.nvim_set_keymap(
	"n",
	"<space>fg",
	"<cmd>lua require\'telescope.builtin\'.live_grep()<CR>",
	{silent = true}
)
vim.api.nvim_set_keymap(
	"n",
	"<space>fb",
	"<cmd>lua require\'telescope.builtin\'.buffers()<CR>",
	{silent = true}
)
vim.api.nvim_set_keymap(
	"n",
	"<space>fh",
	"<cmd>lua require\'telescope.builtin\'.help_tags()<CR>",
	{silent = true}
)
vim.api.nvim_set_keymap(
	"n",
	"<space>fs",
	"<cmd>lua require\'telescope.builtin\'.grep_string()<CR>",
	{silent = true}
)
vim.api.nvim_set_keymap(
	"n",
	"<space>sb",
	"<cmd>lua require\'telescope.builtin\'.current_buffer_fuzzy_find()<CR>>",
	{silent = true}
)
vim.api.nvim_set_keymap(
	"n",
	"\\p",
	"<cmd>lua require\'telescope.builtin\'.registers()<CR>>",
	{silent = true}
)
vim.api.nvim_set_keymap(
	'n',
	'gr',
	'<cmd>Telescope lsp_references<CR>',
	{noremap = true, silent = true}
)
vim.api.nvim_set_keymap('n', 'gI', '<cmd>Telescope lsp_implementations<CR>', {
	noremap = true,
	silent = true
})
vim.api.nvim_set_keymap('n', '<space>gc', '<cmd>Telescope git_bcommits<CR>', {
	noremap = true,
	silent = true
})
vim.api.nvim_set_keymap('n', '<space>gC', '<cmd>Telescope git_commits<CR>', {
	noremap = true,
	silent = true
})
vim.api.nvim_set_keymap('n', '<space>gB', '<cmd>Telescope git_branches<CR>', {
	noremap = true,
	silent = true
})
vim.api.nvim_set_keymap('n', '<space>gS', '<cmd>Telescope git_status<CR>', {
	noremap = true,
	silent = true
})
vim.api.nvim_set_keymap('n', '<space>lq', '<cmd>Telescope quickfix<CR>', {
	noremap = true,
	silent = true
})
