return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      filetypes = { "*" },
      user_default_options = {
        names = true,
        tailwind = true,
        mode = "background",
      },
    })
  end,
}
