-- local list = {
-- 	{key = {"<CR>", "o", "l"}, action = "edit"},
-- 	{key = {"<C-]>"}, action = "cd"},
-- 	{key = "v", action = "vsplit"},
-- 	{key = "s", action = "split"},
-- 	{key = "t", action = "tabnew"},
-- 	{key = "<", action = "prev_sibling"},
-- 	{key = ">", action = "next_sibling"},
-- 	{key = "P", action = "parent_node"},
-- 	{key = "<BS>", action = "close_node"},
-- 	{key = "h", action = "close_node"},
-- 	{key = "<Tab>", action = ""},
-- 	{key = "K", action = "first_sibling"},
-- 	{key = "J", action = "last_sibling"},
-- 	{key = "I", action = "toggle_ignored"},
-- 	{key = ".", action = "toggle_dotfiles"},
-- 	{key = "R", action = "refresh"},
-- 	{key = "a", action = "create"},
-- 	{key = "d", action = "remove"},
-- 	{key = "r", action = "rename"},
-- 	{key = "<C-r>", action = "full_rename"},
-- 	{key = "x", action = "cut"},
-- 	{key = "c", action = "copy"},
-- 	{key = "p", action = "paste"},
-- 	{key = "y", action = "copy_name"},
-- 	{key = "Y", action = "copy_path"},
-- 	{key = "gy", action = "copy_absolute_path"},
-- 	{key = "[c", action = "prev_git_item"},
-- 	{key = "]c", action = "next_git_item"},
-- 	{key = "-", action = "dir_up"},
-- 	{key = "q", action = "close"},
-- 	{key = "?", action = "toggle_help"},
-- 	{key = "<C-k>", action = "toggle_file_info"},
--
-- 	-- {key = "<K>", action = "preview"},
-- }

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
	on_attach = on_attach,
	view = {
		-- width of the window, can be either a number (columns) or a string in `%`
		width = 26,

		-- side of the tree, can be one of 'left' | 'right' | 'top' | 'bottom'
		side = 'left',

		-- not use mappings anymore, use on_attach.
		-- 		mappings = {
		-- 			-- custom only false will merge the list with the default mappings
		-- 			-- if true, it will only use your list to set the mappings
		-- 			custom_only = false,
		--
		-- 			-- list of mappings to set on the tree manually
		-- 			list = list
		-- 		}
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

--
-- This function has been generated from your
--   view.mappings.list
--   view.mappings.custom_only
--   remove_keymaps
--
-- You should add this function to your configuration and set on_attach = on_attach in the nvim-tree setup call.
--
-- Although care was taken to ensure correctness and completeness, your review is required.
--
-- Please check for the following issues in auto generated content:
--   "Mappings removed" is as you expect
--   "Mappings migrated" are correct
--
-- Please see https://github.com/nvim-tree/nvim-tree.lua/wiki/Migrating-To-on_attach for assistance in migrating.
--

local function on_attach(bufnr)
	local api = require('nvim-tree.api')

	local function opts(desc)
		return {
			desc = 'nvim-tree: ' .. desc,
			buffer = bufnr,
			noremap = true,
			silent = true,
			nowait = true
		}
	end

	-- Default mappings. Feel free to modify or remove as you wish.
	--
	-- BEGIN_DEFAULT_ON_ATTACH
	vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
	vim.keymap.set(
		'n',
		'<C-e>',
		api.node.open.replace_tree_buffer,
		opts('Open: In Place')
	)
	vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
	vim.keymap.set(
		'n',
		'<C-r>',
		api.fs.rename_sub,
		opts('Rename: Omit Filename')
	)
	vim.keymap.set('n', '<C-t>', api.node.open.tab, opts('Open: New Tab'))
	vim.keymap.set(
		'n',
		'<C-v>',
		api.node.open.vertical,
		opts('Open: Vertical Split')
	)
	vim.keymap.set(
		'n',
		'<C-x>',
		api.node.open.horizontal,
		opts('Open: Horizontal Split')
	)
	vim.keymap.set(
		'n',
		'<BS>',
		api.node.navigate.parent_close,
		opts('Close Directory')
	)
	vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
	vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
	vim.keymap.set(
		'n',
		'>',
		api.node.navigate.sibling.next,
		opts('Next Sibling')
	)
	vim.keymap.set(
		'n',
		'<',
		api.node.navigate.sibling.prev,
		opts('Previous Sibling')
	)
	vim.keymap.set('n', '.', api.node.run.cmd, opts('Run Command'))
	vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
	vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
	vim.keymap.set('n', 'bd', api.marks.bulk.delete, opts('Delete Bookmarked'))
	vim.keymap.set('n', 'bmv', api.marks.bulk.move, opts('Move Bookmarked'))
	vim.keymap.set(
		'n',
		'B',
		api.tree.toggle_no_buffer_filter,
		opts('Toggle No Buffer')
	)
	vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
	vim.keymap.set(
		'n',
		'C',
		api.tree.toggle_git_clean_filter,
		opts('Toggle Git Clean')
	)
	vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
	vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
	vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
	vim.keymap.set('n', 'D', api.fs.trash, opts('Trash'))
	vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
	vim.keymap.set('n', 'e', api.fs.rename_basename, opts('Rename: Basename'))
	vim.keymap.set(
		'n',
		']e',
		api.node.navigate.diagnostics.next,
		opts('Next Diagnostic')
	)
	vim.keymap.set(
		'n',
		'[e',
		api.node.navigate.diagnostics.prev,
		opts('Prev Diagnostic')
	)
	vim.keymap.set('n', 'F', api.live_filter.clear, opts('Clean Filter'))
	vim.keymap.set('n', 'f', api.live_filter.start, opts('Filter'))
	vim.keymap.set('n', 'g?', api.tree.toggle_help, opts('Help'))
	vim.keymap.set(
		'n',
		'gy',
		api.fs.copy.absolute_path,
		opts('Copy Absolute Path')
	)
	vim.keymap.set(
		'n',
		'H',
		api.tree.toggle_hidden_filter,
		opts('Toggle Dotfiles')
	)
	vim.keymap.set(
		'n',
		'I',
		api.tree.toggle_gitignore_filter,
		opts('Toggle Git Ignore')
	)
	vim.keymap.set(
		'n',
		'J',
		api.node.navigate.sibling.last,
		opts('Last Sibling')
	)
	vim.keymap.set(
		'n',
		'K',
		api.node.navigate.sibling.first,
		opts('First Sibling')
	)
	vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))
	vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
	vim.keymap.set(
		'n',
		'O',
		api.node.open.no_window_picker,
		opts('Open: No Window Picker')
	)
	vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
	vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
	vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
	vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
	vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
	vim.keymap.set('n', 's', api.node.run.system, opts('Run System'))
	vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))
	vim.keymap.set(
		'n',
		'U',
		api.tree.toggle_custom_filter,
		opts('Toggle Hidden')
	)
	vim.keymap.set('n', 'W', api.tree.collapse_all, opts('Collapse'))
	vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
	vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
	vim.keymap.set(
		'n',
		'Y',
		api.fs.copy.relative_path,
		opts('Copy Relative Path')
	)
	vim.keymap.set('n', '<2-LeftMouse>', api.node.open.edit, opts('Open'))
	vim.keymap.set(
		'n',
		'<2-RightMouse>',
		api.tree.change_root_to_node,
		opts('CD')
	)

	-- END_DEFAULT_ON_ATTACH

	-- Mappings removed via:
	--   remove_keymaps
	--   OR
	--   view.mappings.list..action = ""
	--
	-- The dummy set before del is done for safety, in case a default mapping does not exist.
	--
	-- You might tidy things by removing these along with their default mapping.
	vim.keymap.set('n', '<Tab>', '', {buffer = bufnr})
	vim.keymap.del('n', '<Tab>', {buffer = bufnr})

	-- Mappings migrated from view.mappings.list
	--
	-- You will need to insert "your code goes here" for any mappings with a custom action_cb
	vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
	vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
	vim.keymap.set('n', 'l', api.node.open.edit, opts('Open'))
	vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
	vim.keymap.set(
		'n',
		'v',
		api.node.open.vertical,
		opts('Open: Vertical Split')
	)
	vim.keymap.set(
		'n',
		's',
		api.node.open.horizontal,
		opts('Open: Horizontal Split')
	)
	vim.keymap.set('n', 't', api.node.open.tab, opts('Open: New Tab'))
	vim.keymap.set(
		'n',
		'<',
		api.node.navigate.sibling.prev,
		opts('Previous Sibling')
	)
	vim.keymap.set(
		'n',
		'>',
		api.node.navigate.sibling.next,
		opts('Next Sibling')
	)
	vim.keymap.set('n', 'P', api.node.navigate.parent, opts('Parent Directory'))
	vim.keymap.set(
		'n',
		'<BS>',
		api.node.navigate.parent_close,
		opts('Close Directory')
	)
	vim.keymap.set(
		'n',
		'h',
		api.node.navigate.parent_close,
		opts('Close Directory')
	)
	vim.keymap.set(
		'n',
		'K',
		api.node.navigate.sibling.first,
		opts('First Sibling')
	)
	vim.keymap.set(
		'n',
		'J',
		api.node.navigate.sibling.last,
		opts('Last Sibling')
	)
	vim.keymap.set(
		'n',
		'I',
		api.tree.toggle_gitignore_filter,
		opts('Toggle Git Ignore')
	)
	vim.keymap.set(
		'n',
		'.',
		api.tree.toggle_hidden_filter,
		opts('Toggle Dotfiles')
	)
	vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
	vim.keymap.set('n', 'a', api.fs.create, opts('Create'))
	vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
	vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
	vim.keymap.set(
		'n',
		'<C-r>',
		api.fs.rename_sub,
		opts('Rename: Omit Filename')
	)
	vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
	vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
	vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
	vim.keymap.set('n', 'y', api.fs.copy.filename, opts('Copy Name'))
	vim.keymap.set(
		'n',
		'Y',
		api.fs.copy.relative_path,
		opts('Copy Relative Path')
	)
	vim.keymap.set(
		'n',
		'gy',
		api.fs.copy.absolute_path,
		opts('Copy Absolute Path')
	)
	vim.keymap.set('n', '[c', api.node.navigate.git.prev, opts('Prev Git'))
	vim.keymap.set('n', ']c', api.node.navigate.git.next, opts('Next Git'))
	vim.keymap.set('n', '-', api.tree.change_root_to_parent, opts('Up'))
	vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
	vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
	vim.keymap.set('n', '<C-k>', api.node.show_info_popup, opts('Info'))
end
