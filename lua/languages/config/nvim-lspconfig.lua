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
	buf_set_keymap('n', '<space>lq', '<cmd>TroubleToggle quickfix<CR>', {
		noremap = true,
		silent = true
	})
	buf_set_keymap("n", "<space>bf", "<cmd>lua vim.lsp.buf.formatting()<CR>", {
		noremap = true,
		silent = true
	})
end

-----------------------------------------------------------

local lspservers = {
	"go:gopls",
	"lua:sumneko_lua",
	"cpp:clangd",
	"cmake:cmake",
	"java:jdtls",
	"bash:bashls",
	"css:cssls",
	"html:html",
	"typescript:tsserver",
	"json:jsonls",
	"python:pyright",
	"rust:rust_analyzer",
	"docker:dockerls",
	"vim:vimls",
	"vue:vuels",
	"yaml:yamlls",
	"xml:lemminx",
	"emmet:emmet_ls"
}
-- vim.cmd 'packadd nvim-lsp-installer'

local function split(s, delimiter)
	local result = {};
	for match in (s .. delimiter):gmatch("(.-)" .. delimiter) do
		table.insert(result, match);
	end
	return result;
end

local function contains(tables, value)
	for _, values in pairs(tables) do
		if values == value then
			return true
		end
	end
	return false
end

-- NOTE: first, install the servers we need
for _, server in ipairs(lspservers) do
	local ac_server = split(server, ':');
	if not require("nvim-lsp-installer.servers").is_server_installed(ac_server[2]) then
		require("nvim-lsp-installer").install(ac_server[2])
	end
end

-- NOTE: then, we should setup the servers

-- use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local lsp_installer = require("nvim-lsp-installer")

vim.cmd('packadd null-ls.nvim')

require("null-ls").setup({
	sources = {
		-- require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.diagnostics.eslint,
	},
})

lsp_installer.on_server_ready(function(server)
	local opts = {
		autostart = true,
		on_attach = on_attach,
		flags = {
			debounce_text_changes = 150,
		},
		capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
	}

	-- special language lua
	if server.name == "sumneko_lua" then
		opts.settings = {Lua = {diagnostics = {globals = {'vim'}}}}
	end

	-- special language typescript
	if server.name == "tsserver" then
		if vim.fn.executable('npm') ~= 1 then
			print("npm was not found" .. "\n")
		else
			if vim.fn.executable('eslint_d') ~= 1 then
				os.execute('sudo npm install -g eslint_d')
			end
			if vim.fn.executable('prettier') ~= 1 then
				os.execute('sudo npm install -g prettier')
			end
		end
		opts.root_dir = function(fname)
			return require 'lspconfig/util'.root_pattern(
				"package.json",
				"tsconfig.json",
				".git"
			)(fname) or vim.loop.cwd()
		end
		opts.on_attach = require('languages.config.server.typescript.tsserver').setup(on_attach)
	end

	if server.name == "jdtls" or server.name == 'clangd' then
		goto
		continue
	end

	-- Other default languages
	server:setup(opts)
	vim.cmd("bufdo e")::continue::
end)

-- special language java
vim.api.nvim_exec(
	[[
			augroup jdtls_lsp
			au!
		    au FileType java lua require('languages.config.server.java.nvim-jdtls').setup()
            augroup end
            ]],
	false
)

-- specical language c/cpp
vim.cmd 'packadd clangd_extensions.nvim'
require("clangd_extensions").setup()

-- NOTE: finally, setup lsp saga and config
vim.cmd ' packadd lspsaga.nvim'
local saga = require 'lspsaga'
saga.init_lsp_saga {
	use_saga_diagnostic_sign = true,
	error_sign = '❌',
	warn_sign = '⚠️ ',
	hint_sign = '🌵',
	infor_sign = 'ℹ️',
	diagnostic_header_icon = '🐞',
	code_action_icon = '💡'
}

-------------------------------
--NOTE: define the diagnostic color
--[[ vim.cmd("hi VirtualTextWarning guifg='yellow'")
vim.cmd("hi VirtualTextError guifg='red'")
vim.cmd("hi VirtualTextInfo guifg='#0db9d7'")
vim.cmd("hi VirtualTextHint guifg=#2c6e4e")
vim.cmd("hi ErrorText cterm=underline gui=undercurl guisp=red")
vim.cmd("hi WarningText cterm=underline gui=undercurl guisp=yellow")
vim.cmd("hi HintText cterm=underline gui=undercurl guisp=#2c6e4e")
vim.cmd("hi InformationText cterm=underline gui=undercurl guisp=#0db9d7")
vim.cmd("hi CursorWord0 ctermbg=239 guibg=#3d3c3b")
vim.cmd("hi SpellBad cterm=underline gui=undercurl guisp=None") ]]

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

