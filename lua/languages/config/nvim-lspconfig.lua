-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffe
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end
	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
	buf_set_keymap(
		'n',
		'gh',
		'<Cmd>lua require\'lspsaga.provider\'.lsp_finder()<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', {
		noremap = true,
		silent = true
	})
	buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', {
		noremap = true,
		silent = true
	})
	buf_set_keymap(
		'n',
		'K',
		'<Cmd>lua require(\'lspsaga.hover\').render_hover_doc()<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'n',
		'<C-f>',
		'<Cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'n',
		'<C-b>',
		'<Cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {
		noremap = true,
		silent = true
	})
	buf_set_keymap(
		'n',
		'<C-k>',
		'<cmd>lua require(\'lspsaga.signaturehelp\').signature_help()<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'n',
		'<space>wa',
		'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'n',
		'<space>wr',
		'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'n',
		'<space>wl',
		'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'n',
		'<space>ld',
		'<Cmd>lua require\'lspsaga.provider\'.preview_definition()<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'n',
		'<C-f>',
		'<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'n',
		'<C-b>',
		'<cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'n',
		'<space>lr',
		'<cmd>lua require(\'lspsaga.rename\').rename()<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'n',
		'<space>la',
		'<cmd>lua require(\'lspsaga.codeaction\').code_action()<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'v',
		'<space>la',
		'<C-U>lua require(\'lspsaga.codeaction\').range_code_action()<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'n',
		'gr',
		'<cmd>Telescope lsp_references<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap('n', 'gI', '<cmd>Telescope lsp_implementations<CR>', {
		noremap = true,
		silent = true
	})
	buf_set_keymap(
		'n',
		'[g',
		'<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_prev()<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'n',
		']g',
		'<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_next()<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap(
		'n',
		'<space>ll',
		'<cmd>lua require\'lspsaga.diagnostic\'.show_line_diagnostics()<CR>',
		{noremap = true, silent = true}
	)
	buf_set_keymap("n", "<space>bf", "<cmd>lua vim.lsp.buf.formatting()<CR>", {
		noremap = true,
		silent = true
	})
end

-----------------------------------------------------------

local lspservers = {
	"go",
	"lua",
	"cpp",
	"cmake",
	"java",
	"bash",
	"css",
	"html",
	"rome",
	"json",
	"python",
	"rust",
	"dockerfile",
	"vim",
	"vue"
}
vim.cmd ' packadd nvim-lspinstall'

-- NOTE: first, install the servers we need

local function contains(tables, value)
	for _, values in pairs(tables) do
		if values == value then
			return true
		end
	end
	return false
end

for _, server in ipairs(lspservers) do
	if not contains(require("lspinstall").installed_servers(), server) then
		require("lspinstall").install_server(server)
	end
end

-- NOTE: then, we should setup the servers

require 'lspinstall'.setup()

-- use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local nvim_lsp = require('lspconfig')
local function setup_servers()
	for _, lsp in ipairs(require 'lspinstall'.installed_servers()) do
		-- NOTE: the Java official server can not deserve require
		if lsp == "java" then
			local install_path = require "lspinstall/util".install_path("java")
			local path = install_path .. "/jdtls.sh"
			vim.api.nvim_command('augroup lsp')
			vim.api.nvim_command('au!')
			vim.api.nvim_command('au FileType java lua require(\'jdtls\').start_or_attach({cmd = {\'' .. path .. '\'}})')
			vim.api.nvim_command('augroup end')
			vim.api.nvim_command('au FileType java lua vim.api.nvim_set_keymap(\'n\', \'gd\', \'<cmd>lua vim.lsp.buf.definition()<CR>\', {silent = true})')
			vim.api.nvim_exec(
				[[
  au FileType java lua vim.api.nvim_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', 'gI', '<cmd>lua vim.lsp.buf.implementation()<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', '<space>lr', '<cmd>lua vim.lsp.buf.rename()<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', '<space>lR', '<cmd>lua require"jdtls".code_action(false, "refactor")<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', '<space>la', '<cmd>lua require"jdtls".code_action()<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('v', '<space>la', '<cmd>lua require"jdtls".code_action(true)<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', '<space>ll', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', {silent=true,noremap=true})
  au FileType java lua vim.api.nvim_set_keymap('n', '<space>bf', '<cmd>lua vim.lsp.buf.formatting()<CR>', {silent=true,noremap=true})
  au FileType java packadd which-key.nvim
  au FileType java lua require"which-key".register({["<space>lR"] = {name = "refactor"}})
  au FileType java lua require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb) local opts = {};require'telescope.pickers'.new(opts, {prompt_title = prompt,finder    = require'telescope.finders'.new_table {results = items,entry_maker = function(entry) return {value = entry,display = label_fn(entry),ordinal = label_fn(entry),}end,},sorter = require'telescope.sorters'.get_generic_fuzzy_sorter(),attach_mappings = function(prompt_bufnr) require'telescope.actions'.select_default:replace(function()local selection = require'telescope.actions'.get_selected_entry(prompt_bufnr) require'telescope.actions'.close(prompt_bufnr) cb(selection.value)end)return true end,}):find() end
]],
				true
			)

			-- NOTE: ----------------------------END
		else
			nvim_lsp[lsp].setup {
				on_attach = on_attach,
				flags = {
					debounce_text_changes = 150,
				}
			}
		end
	end
end

setup_servers()

require 'lspinstall'.post_install_hook = function()
	setup_servers()

	-- reload installed servers
	vim.cmd("bufdo e")

	-- this triggers the filetype autocmd that starts the server
end

-- NOTE: finally, setup lsp saga and config
vim.cmd ' packadd lspsaga.nvim'
local saga = require 'lspsaga'
saga.init_lsp_saga {
	use_saga_diagnostic_sign = true,
	error_sign = '✖️',
	warn_sign = '⚠️ ',
	hint_sign = '☀️ ',
	infor_sign = ' ℹ️',
	dianostic_header_icon = '   ',
	code_action_icon = ' '
}

-------------------------------
--NOTE: define the diagnostic color

vim.cmd("hi VirtualTextWarning guifg='yellow'")
vim.cmd("hi VirtualTextError guifg='red'")
vim.cmd("hi VirtualTextInformation guifg='#0db9d7'")
vim.cmd("hi VirtualTextHint guifg=#2c6e4e")
vim.cmd("hi ErrorText cterm=underline gui=undercurl guisp=red")
vim.cmd("hi WarningText cterm=underline gui=undercurl guisp=yellow")
vim.cmd("hi HintText cterm=underline gui=undercurl guisp=#2c6e4e")
vim.cmd("hi InformationText cterm=underline gui=undercurl guisp=#0db9d7")
vim.cmd("hi CursorWord0 ctermbg=239 guibg=#3d3c3b")
vim.cmd("hi SpellBad cterm=underline gui=undercurl guisp=None")

--NOTE: define the auto format on save
vim.api.nvim_exec(
	[[
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * lua vim.lsp.buf.formatting()
augroup END
]],
	true
)

