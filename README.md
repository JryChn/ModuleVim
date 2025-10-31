# ModuleVim

A modern, modular, and fast Neovim configuration built from scratch with `lazy.nvim`. This setup provides a complete IDE-like experience, focusing on performance, aesthetics, and modern developer tooling.

## 📸 Screenshots

| Gruvbox Material | GitHub Dark Theme |
| :---: | :---: |
| ![gruvybox](ScreenCut/gruvbox.PNG) | ![github](ScreenCut/github-theme.PNG) |
| **Which-key** Hinting | **Transparent** Mode |
| ![which-key](ScreenCut/which-key.PNG) | ![transparent](ScreenCut/transparent.PNG) |

## ✨ Features

* **⚡ Fast & Lazy-Loaded**: Built with `lazy.nvim` to ensure minimal startup time. Plugins are loaded only when needed.
* **🛠️ Modern Tooling**: Out-of-the-box support for LSP, formatting, linting, and debugging.
    * **LSP Management** via `mason.nvim` for easy installation of language servers.
    * **Formatting** via `conform.nvim`, configured for format-on-save.
    * **Linting** via `nvim-lint` for asynchronous, on-the-fly code checking.
    * **Debugging** via `nvim-dap` and `nvim-dap-ui`.
* **💅 Beautiful & Functional UI**:
    * **Statusline**: Sleek and informative statusline from `lualine.nvim`.
    * **Buffer Tabs**: `bufferline.nvim` provides a clean tab interface.
    * **File Explorer**: Modern file tree with `neo-tree.nvim`.
    * **Key Hints**: `which-key.nvim` provides helpful popups for keybindings.
    * **Command UI**: `noice.nvim` beautifies the command line and notifications.
    * **Themes**: Easy theme cycling with support for `gruvbox-material`, `github_dark`, `everforest`, and more.
* **📝 Rich Editing Experience**:
    * **Fuzzy Finding**: `telescope.nvim` for finding files, text, buffers, and more.
    * **Completion**: `nvim-cmp` provides powerful autocompletion.
    * **Syntax Highlighting**: Advanced highlighting with `nvim-treesitter`.
    * **Git Integration**: `gitsigns.nvim` for hunk management and line blame.
    * **Diagnostics**: `trouble.nvim` for a clean list of project-wide diagnostics.
    * **Navigation**: `hop.nvim` and `accelerated-jk.nvim` for rapid cursor movement.
    * **Commenting**: Smart, context-aware commenting with `Comment.nvim`.

## 🚀 Installation

1.  **Backup your existing configuration**:
    ```bash
    # Make a backup of your current nvim config
    mv ~/.config/nvim ~/.config/nvim.bak
    mv ~/.local/share/nvim ~/.local/share/nvim.bak
    ```

2.  **Clone the repository**:
    ```bash
    git clone [https://github.com/jrychn/modulevim.git](https://github.com/jrychn/modulevim.git) ~/.config/nvim
    ```

3.  **Start Neovim**:
    ```bash
    nvim
    ```
    On the first launch, `lazy.nvim` will automatically bootstrap itself and install all the plugins.

## ⌨️ Key Mappings

This configuration uses `<Space>` as the leader key. `which-key.nvim` will guide you, but here are some of the most important bindings:

### General

| Key | Action | Plugin |
| --- | --- | --- |
| `<Space>` | Leader key / Open `which-key` | which-key.nvim |
| `<C-\>` | Toggle floating terminal | toggleterm.nvim |
| `<leader>e` | Toggle file explorer | neo-tree.nvim |
| `<leader>o` | Toggle symbols outline | aerial.nvim |
| `<leader>aa` | Show welcome screen | alpha-nvim |

### Searching (Telescope)

| Key | Action |
| --- | --- |
| `<leader>ff` | Find Files |
| `<leader>fg` | Live Grep (Search Text) |
| `<leader>fb` | Find Buffers |
| `<leader>fh` | Find Help Tags |
| `gr` | LSP References |
| `gi` | LSP Implementations |

### Buffers & Style

| Key | Action | Plugin |
| --- | --- | --- |
| `<leader>bd` | Close current buffer | mini.bufremove |
| `<S-l>` | Next buffer | bufferline.nvim |
| `<S-h>` | Previous buffer | bufferline.nvim |
| `<leader>tc` | Cycle color theme | (custom) |
| `<leader>tp` | Toggle transparent background | transparent.nvim |

### LSP & Diagnostics

| Key | Action |
| --- | --- |
| `gd` | Go to Definition |
| `gD` | Go to Declaration |
| `K` | Hover Documentation |
| `gh` | Hover Documentation (alias) |
| `<leader>ca` | Code Action |
| `<leader>rn` | Rename Symbol |
| `[d` | Go to Previous Diagnostic |
| `]d` | Go to Next Diagnostic |
| `<leader>xx` | Toggle diagnostics list |
| `<leader>ll` | Toggle document diagnostics |
| `<leader>lq` | Toggle quickfix list |

### Debugging (DAP)

| Key | Action |
| --- | --- |
| `<F5>` | Continue |
| `<F10>` | Step Over |
| `<F11>` | Step Into |
| `<F12>` | Step Out |
| `<leader>db` | Toggle Breakpoint |
| `<leader>du` | Toggle DAP UI |

## 🔌 Core Plugins

This is not a complete list, but highlights the main plugins used in this configuration.

| Function | Plugin |
| --- | --- |
| Plugin Manager | `folke/lazy.nvim` |
| Fuzzy Finder | `nvim-telescope/telescope.nvim` |
| LSP Management | `williamboman/mason.nvim` |
| LSP Config | `neovim/nvim-lspconfig` |
| Formatting | `stevearc/conform.nvim` |
| Linting | `mfussenegger/nvim-lint` |
| Completion | `hrsh7th/nvim-cmp` |
| Statusline | `nvim-lualine/lualine.nvim` |
| Tab/Buffer Line | `akinsho/bufferline.nvim` |
| File Tree | `nvim-neo-tree/neo-tree.nvim` |
| Keymap Hints | `folke/which-key.nvim` |
| Welcome Screen | `goolord/alpha-nvim` |
| Git Signs | `lewis6991/gitsigns.nvim` |
| Diagnostics UI | `folke/trouble.nvim` |
| Code Outline | `stevearc/aerial.nvim` |
| Terminal | `akinsho/toggleterm.nvim` |
| Debugging | `mfussenegger/nvim-dap` |