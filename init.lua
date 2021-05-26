  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
	  vim.fn.system({'git','clone','https://github.com/wbthomason/packer.nvim',install_path})
  end





  local packer = require("packer")
  local use = packer.use
  packer.reset()
  packer.startup(function()
  use "wbthomason/packer.nvim"
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      {"nvim-lua/popup.nvim"},
      {"nvim-lua/plenary.nvim"}
    },
  }
   use {
    "akinsho/nvim-bufferline.lua",
    requires = {"kyazdani42/nvim-web-devicons"},
  }
    use {
   "glepnir/galaxyline.nvim",
    requires = {"kyazdani42/nvim-web-devicons"},
  }
    use {
    "glepnir/dashboard-nvim",
  }
    use {
    "kyazdani42/nvim-tree.lua",
  }
  use {
    'AckslD/nvim-whichkey-setup.lua',
    requires = {'liuchengxu/vim-which-key'},
}

   use "windwp/nvim-autopairs"
   use "rhysd/accelerated-jk" -- more powerful j and k
   use 'monaqa/dial.nvim'
   use 'tpope/vim-commentary'
   use "psliwka/vim-smoothie"
     use {
    "rhysd/vim-operator-surround",
    requires = {"kana/vim-operator-user"},
  }
    use "mhinz/vim-sayonara"
    use {
    "lukas-reineke/indent-blankline.nvim",
    branch = 'lua'
  }
    --use "itchyny/vim-cursorword"
    --use "phaazon/hop.nvim"
    --
-- UI Style
    use 'marko-cerovac/material.nvim'
-- LSP

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      {"nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter"},
      {"p00f/nvim-ts-rainbow", after = "nvim-treesitter"},
      {"folke/lsp-colors.nvim", after = "nvim-treesitter"}
    },
  }
  use{
    "neovim/nvim-lspconfig",
    requires = {
      {"kabouzeid/nvim-lspinstall",after = "nvim-lspconfig"},
      {"glepnir/lspsaga.nvim",after = "nvim-lspconfig"},
      {"JoosepAlviste/nvim-ts-context-commentstring",after = "nvim-lspconfig"}
    },
  }
   use "liuchengxu/vista.vim" -- light-weight lsp client
   use {"hrsh7th/nvim-compe",
         requires = {
      {
        "hrsh7th/vim-vsnip",
        requires = {
          {"rafamadriz/friendly-snippets"}
        },
      },
      {"hrsh7th/vim-vsnip-integ"},
      {"tzachar/compe-tabnine", run = "./install.sh"}
    }
}
   use {"lewis6991/gitsigns.nvim", -- git
       requires = {
    'nvim-lua/plenary.nvim'
  }
  }
  use {"akinsho/nvim-toggleterm.lua"}
end
)
require'packer'.install()

  require('core')
  require('style')
  require('language')
  -- use "liuchengxu/vim-which-key" -- mapping key leader
  -- use "sbdchd/neoformat" -- formatter
  -- use "Raimondi/delimitMate" --
