return {
  "akinsho/bufferline.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("bufferline").setup({
      options = {
        mode = "buffers",
        diagnostics = "nvim_lsp",
        show_tab_indicators = true,
        separator_style = "slant",
        offsets = {
          { filetype = "neo-tree", text = "File Explorer", highlight = "Directory", text_align = "left" },
        },
      },
    })
    vim.keymap.set("n", "<S-l>", ":bnext<CR>", { silent = true, desc = "Next buffer" })
    vim.keymap.set("n", "<S-h>", ":bprevious<CR>", { silent = true, desc = "Prev buffer" })
  end,
}
