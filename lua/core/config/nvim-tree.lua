local tree_cb = require 'nvim-tree.config'.nvim_tree_callback
vim.g.nvim_tree_bindings = {
	{key = {"<CR>", "o", "l"}, cb = tree_cb("edit")},
	{key = {"<C-]>"}, cb = tree_cb("cd")},
	{key = "v", cb = tree_cb("vsplit")},
	{key = "x", cb = tree_cb("split")},
	{key = "t", cb = tree_cb("tabnew")},
	{key = "<", cb = tree_cb("prev_sibling")},
	{key = ">", cb = tree_cb("next_sibling")},
	{key = "P", cb = tree_cb("parent_node")},
	{key = "<BS>", cb = tree_cb("close_node")},
	{key = "h", cb = tree_cb("close_node")},
	{key = "<Tab>", cb = ":wincmd w<CR>"},
	{key = "K", cb = tree_cb("first_sibling")},
	{key = "J", cb = tree_cb("last_sibling")},
	{key = "I", cb = tree_cb("toggle_ignored")},
	{key = ".", cb = tree_cb("toggle_dotfiles")},
	{key = "R", cb = tree_cb("refresh")},
	{key = "a", cb = tree_cb("create")},
	{key = "d", cb = tree_cb("remove")},
	{key = "r", cb = tree_cb("rename")},
	{key = "<C-r>", cb = tree_cb("full_rename")},
	{key = "x", cb = tree_cb("cut")},
	{key = "c", cb = tree_cb("copy")},
	{key = "p", cb = tree_cb("paste")},
	{key = "y", cb = tree_cb("copy_name")},
	{key = "Y", cb = tree_cb("copy_path")},
	{key = "gy", cb = tree_cb("copy_absolute_path")},
	{key = "[c", cb = tree_cb("prev_git_item")},
	{key = "]c", cb = tree_cb("next_git_item")},
	{key = "-", cb = tree_cb("dir_up")},
	{key = "q", cb = tree_cb("close")},
	{key = "?", cb = tree_cb("toggle_help")},
}

--------------------------------------------------------------------------------------

vim.api.nvim_set_keymap(
	"n",
	"<F3>",
	":NvimTreeToggle<CR>",
	{noremap = true, silent = true}
)

local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_side = "left"
g.nvim_tree_width = 26
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 1
g.nvim_tree_quit_on_open = 0
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1

--g.nvim_tree_hide_dotfiles = 1
g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = ":t"
g.nvim_tree_tab_open = 0
g.nvim_tree_allow_resize = 1

g.nvim_tree_show_icons = {git = 1, folders = 1, files = 1}

g.nvim_tree_icons = {
	default = " ",
	symlink = " ",
	git = {
		unstaged = "✗",
		staged = "✓",
		unmerged = "",
		renamed = "➜",
		untracked = "★"
	},
	folder = {default = "", open = "", symlink = ""}
}

local get_lua_cb = function(cb_name)
	return string.format(
		":lua require'nvim-tree'.on_keypress('%s')<CR>",
		cb_name
	)
end
