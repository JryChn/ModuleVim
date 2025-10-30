return {
  "mfussenegger/nvim-jdtls",
  ft = { "java" },
  config = function()
    require("languages.config.server.java.nvim-jdtls").setup()
  end,
}
