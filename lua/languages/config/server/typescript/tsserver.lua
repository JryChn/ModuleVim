local M = {}

M.setup = function(on_attach)
	return function(client, bufnr)
		client.resolved_capabilities.document_formatting = false
		client.resolved_capabilities.document_range_formatting = false

		vim.cmd ' packadd nvim-lsp-ts-utils '
		local ts_utils = require("nvim-lsp-ts-utils")

		-- defaults
		ts_utils.setup {
			debug = false,
			disable_commands = false,
			enable_import_on_completion = true,

			-- import all
			import_all_timeout = 5000,

			--[[ eslint
			eslint_enable_code_actions = true,
			eslint_enable_disable_comments = true,
			eslint_bin = "eslint_d",
			eslint_enable_diagnostics = true,
			eslint_opts = {},

      -- formatting
			enable_formatting = true,
			formatter = "prettier",
			formatter_opts = {}, ]]

			-- update imports on file move
			update_imports_on_move = true,
			require_confirmation_on_move = true,
			watch_dir = nil,
		}

		-- required to fix code action ranges and filter diagnostics
		ts_utils.setup_client(client)

		-- no default maps, so you may want to define some here
		local opts = {silent = true}
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"<space>ls",
			":TSLspOrganize<CR>",
			opts
		)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"<space>lR",
			":TSLspRenameFile<CR>",
			opts
		)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"<space>li",
			":TSLspImportAll<CR>",
			opts
		)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"<space>lq",
			":TSLspFixCurrent<CR>",
			opts
		)
		on_attach(client, bufnr)
	end
end
return M
