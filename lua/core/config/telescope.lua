vim.api.nvim_set_keymap("n","<space>ff",":Telescope find_files<CR>",{silent=true})
vim.api.nvim_set_keymap("n","<space>fg",":Telescope live_grep<CR>",{silent=true})
vim.api.nvim_set_keymap("n","<space>fb",":Telescope buffers<CR>",{silent=true})
vim.api.nvim_set_keymap("n","<space>fh",":Telescope help_tags<CR>",{silent=true})
