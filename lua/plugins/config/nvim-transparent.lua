vim.api.nvim_set_keymap('n', '<space>tp', "<cmd>TransparentToggle<cr>", {})
vim.g.transparent_enabled = 0
require("transparent").setup({
	enable = true,

	-- boolean: enable transparent
	extra_groups = {
		-- table/string: additional groups that should be clear
		-- In particular, when you set it to 'all', that means all avaliable groups

		-- example of akinsho/nvim-bufferline.lua
		--[[ "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected", ]]
	},
	exclude = {},

	-- table: groups you don't want to clear
})
