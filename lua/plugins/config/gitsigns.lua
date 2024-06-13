--vim.api.nvim_set_keymap('n', '<space>gb', "<cmd>GitBlameToggle<cr>", {})

------------------------------------------------------------------------------

require 'gitsigns'.setup({
	numhl = true,
	linehl = true,
	keymaps = {
		-- Default keymap options
		noremap = true,

		['n <space>g]'] = {
			expr = true,
			"&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"
		},
		['n <space>g['] = {
			expr = true,
			"&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"
		},

		['n <space>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
		['v <space>gs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		['n <space>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
		['n <space>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
		['v <space>gr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
		['n <space>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
		['n <space>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
		['n <space>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
		['n <space>gl'] = '<cmd>Gitsigns toggle_current_line_blame<CR>',

		-- Text objects
		['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
		['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
	},
})

