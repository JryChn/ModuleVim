vim.g.kommentary_create_default_mappings = false
vim.api.nvim_set_keymap("n", "<space>cl", "<Plug>kommentary_line_default", {})
vim.api.nvim_set_keymap("n", "<space>cd", "<Plug>kommentary_motion_default", {})
vim.api.nvim_set_keymap("x", "<space>cv", "<Plug>kommentary_visual_default", {})
vim.api.nvim_set_keymap("v", "<space>cv", "<Plug>kommentary_visual_default", {})

---------------------------------------------------------------------------------------------

