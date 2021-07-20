vim.api.nvim_command 'packadd nvim-lspinstall'
vim.api.nvim_command 'packadd lspsaga.nvim'
local nvim_lsp = require('lspconfig')
local servers = {"angular","bash","cpp","css","dockerfile","go","html","java","json","lua","python","vim","vue","yaml"}


  local saga = require "lspsaga"
  saga.init_lsp_saga(
    {
      code_action_icon = "💡"
    }
  )

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gh', '<Cmd>lua require("lspsaga.provider").lsp_finder()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua require("lspsaga.hover").render_hover_doc()', opts)
  buf_set_keymap('n', '<C-f>', '<Cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)', opts)
  buf_set_keymap('n', '<C-b>', '<Cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '[g', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']g', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches

local function contains(tables,value)
  for _, values in pairs(tables) do
  if values == value then
    return true
      end
end
return false
  end

local function install_servers()
  for _, server in pairs(servers) do
    if(not contains(require'lspinstall'.installed_servers(),server)) then
  require'lspinstall'.install_server(server)
    end
    end
  end

local function setup_servers()
  require'lspinstall'.setup()
  local server_installed = require'lspinstall'.installed_servers()
  for _, server in pairs(server_installed) do
    require'lspconfig'[server].setup{ on_attach = on_attach}
  end
end

install_servers()
setup_servers()
nvim_lsp.gopls.setup{
        cmd = {"gopls", "serve"},
    settings = {
      gopls = {
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
      },
    },
}

-- Automatically reload after `:LspInstall <server>` so we don't have to restart neovim
require'lspinstall'.post_install_hook = function ()
  setup_servers() -- reload installed servers
  vim.cmd("bufdo e") -- this triggers the FileType autocmd that starts the server
end
