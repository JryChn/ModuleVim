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

-- ui
--
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

local dap = require "dap"

dap.adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local port = 38697
    local dlv_path = vim.fn.stdpath("data") .. "/dapinstall/go_delve_dbg/delve/cmd/dlv"
    local opts = {
      stdio = {nil, stdout},
      args = {"dap", "-l", "127.0.0.1:" .. port},
      detached = true
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print('dlv exited with code', code)
      end
    end)
    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require('dap.repl').append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(
      function()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
      100)
  end
  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
  dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}",
    },
    {
      type = "go",
      name = "Debug test", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}",
    },
    -- works with go.mod packages and sub packages 
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}",
    } 
}
