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
	"<c-V>",
	"<cmd>lua require\'telescope.builtin\'.registers()<CR>>",
	{silent = true}
)
vim.api.nvim_set_keymap(
	"n",
	"<space>sb",
	"<cmd>lua require\'telescope.builtin\'.current_buffer_fuzzy_find()<CR>>",
	{silent = true}
)

