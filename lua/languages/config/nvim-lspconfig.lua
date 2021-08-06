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
	"java",
	"bash",
	"css",
	"html",
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
		nvim_lsp[lsp].setup {
			on_attach = on_attach,
			flags = {
				debounce_text_changes = 150,
			}
		}
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
	infor_sign = 'ℹ️',
	dianostic_header_icon = '   ',
	code_action_icon = ' '
}

-------------------------------
--NOTE: define the diagnostic color

vim.cmd("hi LspDiagnosticsVirtualTextWarning guifg='yellow'")
vim.cmd("hi LspDiagnosticsVirtualTextError guifg='#db4b4b'")
vim.cmd("hi LspDiagnosticsVirtualTextInformation guifg='#0db9d7'")
vim.cmd("hi LspDiagnosticsVirtualTextHint guifg='#10B981'")

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
