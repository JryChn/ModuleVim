-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffe
  local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')
buf_set_keymap('n', 'gh', '<Cmd>lua require\'lspsaga.provider\'.lsp_finder()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', 'gd', '<Cmd>lua require\'lspsaga.provider\'.preview_definition()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', 'K', '<Cmd>lua require(\'lspsaga.hover\').render_hover_doc()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', '<C-f>', '<Cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(1)<CR>', { noremap=true, silent=true })
buf_set_keymap('n', '<C-b>', '<Cmd>lua require(\'lspsaga.action\').smart_scroll_with_saga(-1)<CR>', { noremap=true, silent=true })
buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', '<C-k>', '<cmd>lua require(\'lspsaga.signaturehelp\').signature_help()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', { noremap=true, silent=true })
buf_set_keymap('n', '<space>ld', '<cmd>lua vim.lsp.buf.type_definition()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', '<space>lr', '<cmd>lua lua require(\'lspsaga.rename\').rename()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', '<space>la', '<cmd>lua lua require(\'lspsaga.codeaction\').code_action<CR>', { noremap=true, silent=true })
buf_set_keymap('v', '<space>la', '<C-U>lua lua require(\'lspsaga.codeaction\').range_code_action<CR>', { noremap=true, silent=true })
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', '[g', '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_prev()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', ']g', '<cmd>lua require\'lspsaga.diagnostic\'.lsp_jump_diagnostic_next()<CR>', { noremap=true, silent=true })
buf_set_keymap('n', '<space>ll', '<cmd>lua require\'lspsaga.diagnostic\'.show_line_diagnostics()<CR>', { noremap=true, silent=true })
buf_set_keymap("n", "<space>bf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { noremap=true, silent=true })
end




-----------------------------------------------------------

local lspservers = { "go", "lua", "cpp" }
-- NOTE: first, install the servers we need
for _,server in ipairs(lspservers) do
 require("lspinstall").install_server(server)
end
-- NOTE: then, we should setup the servers

require'lspinstall'.setup()

-- use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local nvim_lsp = require('lspconfig')
local function setup_server()
for _, lsp in ipairs(require'lspinstall'.installed_servers()) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end
end
setup_servers()
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the filetype autocmd that starts the server
end



-- NOTE: finally, setup lsp saga and config
vim.cmd' packadd lspsaga.nvim'
local saga = require 'lspsaga'

-- default value
-- use_saga_diagnostic_sign = true
-- error_sign = '',
-- warn_sign = '',
-- hint_sign = '',
-- infor_sign = '',
-- dianostic_header_icon = '   ',
-- code_action_icon = ' ',
-- code_action_prompt = {
--   enable = true,
--   sign = true,
--   sign_priority = 20,
--   virtual_text = true,
-- },
-- finder_definition_icon = '  ',
-- finder_reference_icon = '  ',
-- max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
-- finder_action_keys = {
--   open = 'o', vsplit = 's',split = 'i',quit = 'q',scroll_down = '<C-f>', scroll_up = '<C-b>' -- quit can be a table
-- },
-- code_action_keys = {
--   quit = 'q',exec = '<CR>'
-- },
-- rename_action_keys = {
--   quit = '<C-c>',exec = '<CR>'  -- quit can be a table
-- },
-- definition_preview_icon = '  '
-- "single" "double" "round" "plus"
-- border_style = "single"
-- rename_prompt_prefix = '➤',
-- if you don't use nvim-lspconfig you must pass your server name and
-- the related filetypes into this table
-- like server_filetype_map = {metals = {'sbt', 'scala'}}
-- server_filetype_map = {}
saga.init_lsp_saga()
