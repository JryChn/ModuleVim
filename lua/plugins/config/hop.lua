vim.api.nvim_set_keymap('n', '<space>jw', "<cmd>lua require'hop'.hint_words()<cr>", {})
vim.api.nvim_set_keymap('n', '<space>jl', "<cmd>lua require'hop'.hint_lines()<cr>", {})











require'hop'.setup()

