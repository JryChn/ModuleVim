vim.api.nvim_set_keymap("n", "\\,", ":BufferPrevious<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\.", ":BufferNext<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\1", ":BufferGoto 1<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\2", ":BufferGoto 2<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\3", ":BufferGoto 3<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\4", ":BufferGoto 4<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\5", ":BufferGoto 5<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\6", ":BufferGoto 6<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\7", ":BufferGoto 7<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\8", ":BufferGoto 8<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\9", ":BufferGoto 9<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\0", ":BufferLast<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\c", ":BufferClose<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\s", ":BufferPick<CR>", {silent = true})
vim.api.nvim_set_keymap("n", "\\e", ":enew<CR>", {silent = true})
vim.api.nvim_set_keymap(
	"n",
	"\\C",
	":BufferCloseAllButCurrent<CR>",
	{silent = true}
)
vim.api.nvim_set_keymap(
	"n",
	"\\b",
	":BufferOrderByLanguage<CR>",
	{silent = true}
)
vim.api.nvim_set_keymap(
	"n",
	"\\d",
	":BufferOrderByDirectory<CR>",
	{silent = true}
)
