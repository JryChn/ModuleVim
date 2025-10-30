-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy and load plugins from lua/plugins/*
require("lazy").setup({ { import = "plugins" } }, {
  change_detection = { notify = false },
  ui = { border = "single" },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "zip", "zipPlugin", "tar", "tarPlugin",
        "tohtml", "tutor", "getscript", "getscriptPlugin",
        "vimball", "vimballPlugin", "matchit", "matchparen",
        "2html_plugin", "netrw", "netrwPlugin", "netrwSettings", "netrwFileHandlers",
      }
    }
  }
})
