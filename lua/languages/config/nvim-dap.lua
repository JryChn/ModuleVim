vim.api.nvim_set_keymap("n", "<f5>", "<cmd>lua require'dap'.continue()<cr>", {})
vim.api.nvim_set_keymap(
	"n",
	"<f6>",
	"<cmd>lua require'dap'.toggle_breakpoint()<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"n",
	"<f7>",
	"<cmd>lua require'dap'.step_into()<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"n",
	"<f8>",
	"<cmd>lua require'dap'.step_over()<cr>",
	{}
)
vim.api.nvim_set_keymap(
	"n",
	"<f9>",
	"<cmd>lua require'dap'.step_out()()<cr>",
	{}
)

--------------------------------------------------------------------------------
local dap_install = require("dap-install")

dap_install.setup({
	installation_path = vim.fn.stdpath("data") .. "/dapinstall/",
	verbosely_call_debuggers = false,
})
local dbg_list = require("dap-install.debuggers_list").debuggers

for debugger, _ in pairs(dbg_list) do
    if debugger=="go_delve_dbg"
        then
	dap_install.config(debugger, {})
end
end
-- ui
vim.g.dap_virtual_text = 'all frames'
require("dapui").setup({
	icons = {expanded = "▾", collapsed = "▸"},
	mappings = {
		-- Use a table to apply multiple mappings
		expand = {"<CR>", "<2-LeftMouse>"},
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
	},
	sidebar = {
		open_on_start = true,

		-- You can change the order of elements in the sidebar
		elements = {
			-- Provide as ID strings or tables with "id" and "size" keys
			{
				id = "scopes",
				size = 0.25,

				-- Can be float or integer > 1
			},
			{id = "breakpoints", size = 0.25},
			{id = "stacks", size = 0.25},
			{id = "watches", size = 00.25},
		},
		width = 40,
		position = "left",

		-- Can be "left" or "right"
	},
	tray = {
		open_on_start = true,
		elements = {"repl"},
		height = 10,
		position = "bottom",

		-- Can be "bottom" or "top"
	},
	floating = {
		max_height = nil,

		-- These can be integers or a float between 0 and 1.
		max_width = nil,

		-- Floats will be treated as percentage of your screen.
		mappings = {
			close = {"q", "<Esc>"},
		},
	},
	windows = {indent = 1},
})
