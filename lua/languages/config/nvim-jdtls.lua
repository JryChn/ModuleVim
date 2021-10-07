local M = {}

function M.setup()
	vim.api.nvim_set_keymap(
		'n',
		'gd',
		'<cmd>lua vim.lsp.buf.definition()<CR>',
		{silent = true}
	)
	vim.api.nvim_set_keymap(
		"i",
		"<C-s>",
		"<Esc>:w! | lua require'jdtls'.organize_imports()<CR>",
		{noremap = true}
	)
	vim.api.nvim_set_keymap(
		"n",
		"<C-s>",
		":w! | lua require'jdtls'.organize_imports()<CR>",
		{noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'gD',
		'<cmd>lua vim.lsp.buf.declaration()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'K',
		'<cmd>lua vim.lsp.buf.hover()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'gI',
		'<cmd>lua vim.lsp.buf.implementation()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'<C-k>',
		'<cmd>lua vim.lsp.buf.signature_help()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'<space>wa',
		'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'<space>wr',
		'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'<space>wl',
		'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'<space>lr',
		'<cmd>lua vim.lsp.buf.rename()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'<space>lR',
		'<cmd>lua require"jdtls".code_action(false, "refactor")<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'<space>la',
		'<cmd>lua require"jdtls".code_action()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'v',
		'<space>la',
		'<cmd>lua require"jdtls".code_action(true)<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'gr',
		'<cmd>lua vim.lsp.buf.references()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'<space>ll',
		'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'[g',
		'<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		']g',
		'<cmd>lua vim.lsp.diagnostic.goto_next()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'<space>bf',
		'<cmd>lua vim.lsp.buf.formatting()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'<space>lcv',
		'<cmd>lua require(\'jdtls\').extract_variable()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'v',
		'<space>lcv',
		'<cmd>lua require(\'jdtls\').extract_variable(true)<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'n',
		'<space>lcc',
		'<cmd>lua require(\'jdtls\').extract_constant()<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'v',
		'<space>lcc',
		'<cmd>lua require(\'jdtls\').extract_constant(true)<CR>',
		{silent = true, noremap = true}
	)
	vim.api.nvim_set_keymap(
		'v',
		'<space>lcm',
		'<cmd>lua lua require(\'jdtls\').extract_method(true)<CR>',
		{silent = true, noremap = true}
	)
	vim.cmd ' packadd which-key.nvim'
	require "which-key".register({["<space>lR"] = {name = "refactor"}})
	require "which-key".register({["<space>lc"] = {name = "extract"}})
	require "which-key".register({["<space>lcv"] = {name = "extract_variable"}})
	require "which-key".register({["<space>lcc"] = {name = "extract_constant"}})
	require "which-key".register({["<space>lcm"] = {name = "extract_method"}})
	require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
		local opts = {};
		require 'telescope.pickers'.new(opts, {
			prompt_title = prompt,
			finder = require 'telescope.finders'.new_table {
				results = items,
				entry_maker = function(entry)
					return {
						value = entry,
						display = label_fn(entry),
						ordinal = label_fn(entry),
					}
				end,
			},
			sorter = require 'telescope.sorters'.get_generic_fuzzy_sorter(),
			attach_mappings = function(prompt_bufnr)
				require 'telescope.actions'.select_default:replace(function()
					local selection = require 'telescope.actions'.get_selected_entry(prompt_bufnr)
					require 'telescope.actions'.close(prompt_bufnr)
					cb(selection.value)
				end)
				return true
			end,
		}):find()
	end

	local install_path = require "lspinstall/util".install_path("java")
	local path = install_path .. "/jdtls.sh"
	local root_markers = {'gradlew', 'pom.xml', '.git'}
	local root_dir = require('jdtls.setup').find_root(root_markers)
	local workspace_folder = os.getenv("HOME") .. "/.local/share/nvim_java_workspace/" .. vim.fn.fnamemodify(
		root_dir,
		":p:h:t"
	)
	print("detect root directory " .. workspace_folder)
	local on_attach = function(client, bufnr)
		require 'jdtls'.setup_dap()
		require 'lsp-status'.register_progress()
	end

	local config = {
		cmd = {path, workspace_folder},
		root_dir = root_dir,
		flags = {allow_incremental_sync = true},
		on_attach = on_attach,
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}

	require('jdtls').start_or_attach(config)
end

return M
