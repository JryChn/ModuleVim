local list = {
	{key = {"<CR>", "o", "l"}, action = "edit"},
	{key = {"<C-]>"}, action = "cd"},
	{key = "v", action = "vsplit"},
	{key = "s", action = "split"},
	{key = "t", action = "tabnew"},
	{key = "<", action = "prev_sibling"},
	{key = ">", action = "next_sibling"},
	{key = "P", action = "parent_node"},
	{key = "<BS>", action = "close_node"},
	{key = "h", action = "close_node"},
	{key = "<Tab>", action = ""},
	{key = "K", action = "first_sibling"},
	{key = "J", action = "last_sibling"},
	{key = "I", action = "toggle_ignored"},
	{key = ".", action = "toggle_dotfiles"},
	{key = "R", action = "refresh"},
	{key = "a", action = "create"},
	{key = "d", action = "remove"},
	{key = "r", action = "rename"},
	{key = "<C-r>", action = "full_rename"},
	{key = "x", action = "cut"},
	{key = "c", action = "copy"},
	{key = "p", action = "paste"},
	{key = "y", action = "copy_name"},
	{key = "Y", action = "copy_path"},
	{key = "gy", action = "copy_absolute_path"},
	{key = "[c", action = "prev_git_item"},
	{key = "]c", action = "next_git_item"},
	{key = "-", action = "dir_up"},
	{key = "q", action = "close"},
	{key = "?", action = "toggle_help"},
	{key = "<C-k>", action = "toggle_file_info"},

	-- {key = "<K>", action = "preview"},
}

--------------------------------------------------------------------------------------

vim.api.nvim_set_keymap(
	"n",
	"<F3>",
	":NvimTreeToggle<CR>",
	{noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
	"n",
	"<space>ft",
	":NvimTreeFindFile<CR>",
	{noremap = true, silent = true}
)
vim.cmd 'packadd which-key.nvim'
require "which-key".register({["<space>ft"] = {name = "focus this file on tree"}})
require 'nvim-tree'.setup {
	view = {
		-- width of the window, can be either a number (columns) or a string in `%`
		width = 26,

		-- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
		side = 'left',

		mappings = {
			-- custom only false will merge the list with the default mappings
			-- if true, it will only use your list to set the mappings
			custom_only = false,

			-- list of mappings to set on the tree manually
			list = list
		}
	}
}

local g = vim.g

vim.o.termguicolors = true

g.nvim_tree_disable_window_picker = 1

g.nvim_tree_root_folder_modifier = ":t"

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

-- closes neovim automatically when the tree is the last **WINDOW** in the view
vim.cmd("autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif")
