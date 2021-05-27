vim.g.mapleader = "<Space>"
vim.g.maplocalleader = ","
local wk = require('which-key')
-- vim.api.nvim_set_keymap("v","<space>cl",":Commentary<CR>",{silent=true})


require("which-key").setup{
    plugins = {
        spelling = {enabled = true},
    }
}

 vim.api.nvim_set_keymap("v","<space>cl",":Commentary<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>la","<cmd>lua vim.lsp.buf.code_action()<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>le","<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>lr","<cmd>lua vim.lsp.buf.rename()<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>lq","<cmd>lua vim.lsp.buf.type_definition()<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>lc","<cmd>Commentary<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>wa","<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>wr","<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>wl","<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>gg","<Cmd>Telescope git_commits<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>gc","<Cmd>Telescope git_bcommits<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>gb","<Cmd>Telescope git_branches<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>gs","<Cmd>Telescope git_status<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>ff","<cmd>Telescope find_files<cr>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>fr","<cmd>Telescope oldfiles<cr>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>fc","<Cmd>Telescope commands<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>fh","<Cmd>Telescope command_history<CR>",{silent=true})
 vim.api.nvim_set_keymap("n","<space>q","<Cmd>Telescope quickfix<CR>",{silent=true})

-- local space_keymap = {
--     l = { -- set a nested structure
--         name = '+language',
--         a = {'<cmd>lua vim.lsp.buf.code_action()<CR>', 'action'},
--         e = {'<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'show diagnostic'},
--         r = {'<cmd>lua vim.lsp.buf.rename()<CR>', 'rename'},
--         q = {'<cmd>lua vim.lsp.buf.type_definition()<CR>', 'diagnostic list'},
--         c = {'<cmd>Commentary<CR>', 'Comment'},
--     },
--      w = {
--             name = 'workspace',
--             a = {'<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>' ,'add workspace folder'},
--             r = {'<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>' ,'remove workspace folder'},
--             l = {'<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>' ,'show workspace list'},
--     },
--     g = { -- set a nested structure
--         name = 'git',
--             g = {'<Cmd>Telescope git_commits<CR>', 'commits'},
--             c = {'<Cmd>Telescope git_bcommits<CR>', 'bcommits'},
--             b = {'<Cmd>Telescope git_branches<CR>', 'branches'},
--             s = {'<Cmd>Telescope git_status<CR>', 'status'},
--     },
--     f = {
--     name = "file", -- optional group name
--     f = {'<cmd>Telescope find_files<cr>', "Find File" }, -- create a binding with label
--     r = {'<cmd>Telescope oldfiles<cr>', "Open Recent File" },
--     c = {'<Cmd>Telescope commands<CR>', 'commands'},
--     h = {'<Cmd>Telescope command_history<CR>', 'history'},
--   },
--    q = {'<Cmd>Telescope quickfix<CR>', 'quickfix'}
-- }

-- local leader_keymap = {
-- }
-- wk.register(space_keymap,{prefix="<leader>",mode="n"})
--wk.register_keymap('', leader_keymap)
