-- ModuleVim modern bootstrap (lazy.nvim)
-- Base options and keymaps
pcall(require, "core.config.basic-configuration")

-- GUI tweaks (optional)
pcall(require, "gui")

-- Plugin manager and specs
require("lazy-setup")
