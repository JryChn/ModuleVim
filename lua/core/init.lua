-- start ModuleVim and install plugin packer


require('core.config.basic-configuration')
require('core.config.packer')
local packer = require("packer")
local use = packer.use
packer.reset()
-----------------------start to loading plugins--------------
packer.startup(
function(use)
    use 'wbthomason/packer.nvim'
    -----------core layer-----------
    use{ --Icon sets for neovim plugins and settings
        'yamatsum/nvim-nonicons',
        requires = {'kyazdani42/nvim-web-devicons'}
    }
    use{ --vim plugin to accelerate up-down moving
        'rhysd/accelerated-jk',
        config= function()
        require'core.config.accelerated-jk'
        end
    }
    use{ --a minimalist autopairs
        'windwp/nvim-autopairs',
        config = function()
        require'nvim-autopairs'.setup()
        end
    }
    use{ --extended increment/decrement
        'monaqa/dial.nvim',
        config = function()
        end
    }
    use{ --a smooth scrolling neovim plugin written in lua
        'karb94/neoscroll.nvim',
        config = function()
        require 'neoscroll'.setup()
        end
    }
    use{ --provide a single command that deletes the current buffer
        'mhinz/vim-sayonara',
        config = function()
        require 'core.config.vim-sayonara'
        end
    }
    --use{ --a surround text object plugin
        --'blackcauldron7/surround.nvim',
        --config = function()
        --require'surround'.setup()
        --end
    --}
    use{--highly extendable fuzzy finder over lists
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'},{'nvim-lua/plenary.nvim'}},
        config = function()
            require 'core.config.telescope'
        end
    }
    use{ --a minimalist dashboard for neovim
       'glepnir/dashboard-nvim',
        config = function()
            require 'core.config.dashboard-vim'
        end
    }
    use{ --tabline plugin
        'romgrk/barbar.nvim',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require 'core.config.barbar'
        end
    }
    use{ --light-weight and super fast stataus line plugin
        'glepnir/galaxyline.nvim',
        branch = 'main',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require 'core.config.galaxyline'
        end
    }
    use{ --view and search LSP symbols
        'liuchengxu/vista.vim',
        config = function()
            require 'core.config.vista'
        end
    }
    use{ --file explorer
        'kyazdani42/nvim-tree.lua',
        requires = {'kyazdani42/nvim-web-devicons'},
        config = function()
            require 'core.config.nvim-tree'
        end
    }
    use{ --terminal intergration
        'akinsho/nvim-toggleterm.lua',
        config = function()
            require 'core.config.nvim-toggleterm'
        end
    } 
    use{ --NVIM Treesitter configurations and abstraction layer
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate',
        requires = {
		{'nvim-treesitter/nvim-treesitter-textobjects',after = 'nvim-treesitter'},
		{'p00f/nvim-ts-rainbow',after = 'nvim-treesitter'},
		{'lewis6991/spellsitter.nvim',after = 'nvim-treesitter'},
		{'folke/lsp-colors.nvim',after = 'nvim-treesitter'},
		{'windwp/nvim-ts-autotag',after = 'nvim-treesitter'}
        },
        config = function()
            require 'core.config.nvim-treesitter'
        end
    }
    
    --------------------------------
    ---------language layer---------
    --use{ --
        --'neovim/nvim-lspconfig',
	--requires = {
		--{'kabouzeid/nvim-lspinstall',after = 'nvim-lspconfig'},
		--{'glepnir/lspsaga.nvim',after = 'nvim-lspconfig'}
		--},
        --config = function()
            --require 'languages.config.nvim-lspconfig'
        --end
    --} 
    --use{ --
        --'hrsh7th/nvim-compe',
	--requires = {
		--{'hrsh7th/vim-vsnip',requires = { 'rafamadriz/friendly-snippets'}},
		--{'hrsh7th/vim-vsnip-integ',after = 'vim-vsnip'},
		--{'tzachar/compe-tabnine',run = "./install.sh"}
		--},
        --config = function()
            --require 'languages.config.nvim-compe'
        --end
    --} 
    --------------------------------
    ----------style layer-----------
    use{
        'projekt0n/github-nvim-theme',
        config = function()
            require'github-theme'.setup()
        end
        }
    --------------------------------
    ----------tools layer-----------
    --------------------------------
    ----------plugins layer---------
    use{ --
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require 'plugins.config.indent-blankline'
        end
    } 
    --use{ --
        --'lewis6991/gitsigns.nvim',
	--requires = 'nvim-lua/plenary.nvim',
        --config = function()
            --require 'plugins.config.gitsigns'
        --end
    --} 
    --use{ --
        --'itchyny/vim-cursorword',
        --config = function()
            --require 'plugins.config.'
        --end
    --} 
    --use{ --
        --'phaazon/hop.nvim',
        --config = function()
            --require 'plugins.config.'
        --end
    --} 
    --------------------------------
end
)
require'packer'.install()
-------------------------------------------------------------

