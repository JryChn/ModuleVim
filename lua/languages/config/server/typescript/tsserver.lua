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

			-- ms
			import_all_priorities = {
				buffers = 4,

				-- loaded buffer names
				buffer_content = 3,

				-- loaded buffer content
				local_files = 2,

				-- git files or files with relative path markers
				same_file = 1,

				-- add to existing import statement
			},
			import_all_scan_buffers = 100,
			import_all_select_source = false,

			-- eslint
			eslint_enable_code_actions = true,
			eslint_enable_disable_comments = true,
			eslint_bin = "eslint_d",
			eslint_enable_diagnostics = true,
			eslint_opts = {},

			-- formatting
			enable_formatting = true,
			formatter = "eslint_d",
			formatter_opts = {},

			-- update imports on file move
			update_imports_on_move = true,
			require_confirmation_on_move = false,
			watch_dir = nil,

			-- filter diagnostics
			filter_out_diagnostics_by_severity = {},
			filter_out_diagnostics_by_code = {},
		}

		-- required to fix code action ranges and filter diagnostics
		ts_utils.setup_client(client)

		-- no default maps, so you may want to define some here
		local opts = {silent = true}
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"gs",
			":TSLspOrganize<CR>",
			opts
		)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"gr",
			":TSLspRenameFile<CR>",
			opts
		)
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"gi",
			":TSLspImportAll<CR>",
			opts
		)
		on_attach(client, bufnr)
	end
end
return M
