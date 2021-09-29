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
local dbg_list = require("dap-install.api.debuggers").get_installed_debuggers()

for debugger, _ in pairs(dbg_list) do
	if debugger == "go_delve_dbg" then
		dap_install.config(debugger, {})
	end
end

-- ui
vim.g.dap_virtual_text = 'all frames'
local dap, dapui = require('dap'), require('dapui')
dap.listeners.after.event_initialized['dapui_config'] = function()
	dapui.open()
end
dap.listeners.before.event_terminated['dapui_config'] = function()
	dapui.close()
end
dap.listeners.before.event_exited['dapui_config'] = function()
	dapui.close()
end
