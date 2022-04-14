vim.api.nvim_set_keymap('n', '<space>z', "<cmd>ZenMode<cr>", {})
require "zen-mode".setup {}
vim.cmd 'packadd which-key.nvim'
require "which-key".register({["<space>z"] = {name = "ZenMode"}})
