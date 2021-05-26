vim.g.mapleader = "<Space>"
vim.g.maplocalleader = ","
vim.api.nvim_set_keymap("n","<leader>",":WhichKey '<Space>'<CR>",{noremap=true})
local wk = require('whichkey_setup')
-- vim.api.nvim_set_keymap("v","<space>cl",":Commentary<CR>",{silent=true})

local space_keymap = {
    l = { -- set a nested structure
        name = '+language',
        a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'action'},
        e = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'show diagnostic'},
        r = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'rename'},
        q = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'diagnostic list'},
        c = {
            name = '+commands',
            c = {'<Cmd>Telescope commands<CR>', 'commands'},
            h = {'<Cmd>Telescope command_history<CR>', 'history'},
        },
    },
     w = {
            name = 'workspace',
            a = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>' ,'add workspace folder'},
            r = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>' ,'remove workspace folder'},
            l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>' ,'show workspace list'},
    },
    g = { -- set a nested structure
        name = 'git',
            g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
            c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
            b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
            s = {'<Cmd>Telescope git_status<CR>', 'status'},
    },
   q = {'<Cmd>Telescope quickfix<CR>', 'quickfix'},
}

local leader_keymap = {
}
wk.register_keymap("leader", space_keymap)
--wk.register_keymap('', leader_keymap)
--
--
