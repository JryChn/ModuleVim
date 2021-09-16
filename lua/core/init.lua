-- start ModuleVim and install plugin packer

require('core.config.basic-configuration')
require('core.config.packer')
local packer = require("packer")
local use = packer.use
packer.reset()

-----------------------start to loading plugins--------------
packer.startup(function(use)
	use 'wbthomason/packer.nvim'

	-----------NOTE:core layer-----------
	use {
		--Icon sets for neovim plugins and settings
		-- 'yamatsum/nvim-nonicons',
		-- requires = {'kyazdani42/nvim-web-devicons'}
	}
	use {
		--vim plugin to accelerate up-down moving
		'rhysd/accelerated-jk',
		config = function()
			require 'core.config.accelerated-jk'
		end
	}
	use {
		--a minimalist autopairs
		'windwp/nvim-autopairs',
		config = function()
			require 'nvim-autopairs'.setup()
		end
	}
	use {
		--extended increment/decrement
		'monaqa/dial.nvim',
		config = function()
		end
	}
	use {
		--a smooth scrolling neovim plugin written in lua
		'karb94/neoscroll.nvim',
		config = function()
			require 'neoscroll'.setup()
		end
	}
	use {
		--provide a single command that deletes the current buffer
		'mhinz/vim-sayonara',
		config = function()
			require 'core.config.vim-sayonara'
		end,
		event = "BufWinEnter"
	}
	use {
		--provide a directory root
		'airblade/vim-rooter',
		config = function()
			vim.g.rooter_silent_chdir = 1
		end
	}
	use {
		--provide a single command that deletes the current buffer
		'norcalli/nvim-colorizer.lua',
		config = function()
			require 'colorizer'.setup()
		end,

		-- event = "BufWinEnter"
	}

	--use{ --a surround text object plugin TODO: open this plugin later
	--'blackcauldron7/surround.nvim',
	--config = function()
	--require'surround'.setup()
	--end
	--}
	use {
		--highly extendable fuzzy finder over lists
		'nvim-telescope/telescope.nvim',
		requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
		config = function()
			require 'core.config.telescope'
		end,
		event = "BufWinEnter"
	}
	use {
		--a minimalist dashboard for neovim
		'glepnir/dashboard-nvim',
		config = function()
			require 'core.config.dashboard-vim'
		end,
		event = "BufWinEnter"
	}
	use {
		--tabline plugin
		'romgrk/barbar.nvim',
		requires = {'kyazdani42/nvim-web-devicons'},
		config = function()
			require 'core.config.barbar'
		end,
		event = "BufWinEnter"
	}
	use {
		--light-weight and super fast stataus line plugin
		'glepnir/galaxyline.nvim',
		branch = 'main',
		requires = {'kyazdani42/nvim-web-devicons'},
		config = function()
			require 'core.config.galaxyline'
		end,
		event = "BufWinEnter"
	}
	use {
		--view and search LSP symbols
		'liuchengxu/vista.vim',
		config = function()
			require 'core.config.vista'
		end,
		event = "BufWinEnter"
	}
	use {
		--file explorer
		'kyazdani42/nvim-tree.lua',
		requires = {'kyazdani42/nvim-web-devicons'},
		config = function()
			require 'core.config.nvim-tree'
		end,
		event = "BufWinEnter"
	}
	use {
		--terminal intergration
		'akinsho/nvim-toggleterm.lua',
		config = function()
			require 'core.config.nvim-toggleterm'
		end,
		event = "BufWinEnter"
	}
	use {
		--NVIM Treesitter configurations and abstraction layer
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
		requires = {
			{
				'nvim-treesitter/nvim-treesitter-textobjects',
				after = 'nvim-treesitter'
			},
			{'p00f/nvim-ts-rainbow', after = 'nvim-treesitter'},
			{'lewis6991/spellsitter.nvim', after = 'nvim-treesitter'},
			{'windwp/nvim-ts-autotag', after = 'nvim-treesitter'}
		},
		config = function()
			require 'core.config.nvim-treesitter'
		end
	}

	--------------------------------
	---------NOTE:language layer---------
	use {
		--language service protocol client
		'neovim/nvim-lspconfig',
		requires = {
			{'kabouzeid/nvim-lspinstall', after = 'nvim-lspconfig'},
			{'glepnir/lspsaga.nvim', after = 'nvim-lspconfig'},
			{'mfussenegger/nvim-jdtls', after = 'nvim-lspconfig'},
		},
		config = function()
			require 'languages.config.nvim-lspconfig'
		end
	}
	use {
		--auto completion
		'hrsh7th/nvim-cmp',

		-- event = "InsertCharPre",
		requires = {
			{'onsails/lspkind-nvim'},
			{
				'hrsh7th/vim-vsnip',
				requires = {'rafamadriz/friendly-snippets'},
			},
			{
				'hrsh7th/vim-vsnip-integ',
				after = 'vim-vsnip',
			},
			{
				'tzachar/cmp-tabnine',
				run = "./install.sh",
			},
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-buffer',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-nvim-lua',
			'octaltree/cmp-look',
			'hrsh7th/cmp-vsnip',
			'kdheepak/cmp-latex-symbols',
			'hrsh7th/cmp-calc',
			'ray-x/cmp-treesitter',
			'hrsh7th/cmp-emoji',
			'hrsh7th/cmp-emoji',
			'f3fora/cmp-spell',
			'quangnguyen30192/cmp-nvim-tags'
		},
		config = function()
			require 'languages.config.nvim-cmp'
		end
	}
	use {
		--highlight and search for todo comments
		"b3nj5m1n/kommentary",
		config = function()
			require 'languages.config.kommentary'
		end
	}

	use {
		--debug plugin
		"mfussenegger/nvim-dap",
		requires = {
			"rcarriga/nvim-dap-ui",
			"Pocco81/DAPInstall.nvim",
			"theHamsta/nvim-dap-virtual-text"
		},
		config = function()
			require 'languages.config.nvim-dap'
		end,

		-- event = 'BufferRead'
	}

	--use{ --formatter TODO: Not use now, instead by lsp
	--'mhartington/formatter.nvim',
	--config = function()
	--require'languages.config.formatter'
	--end
	--}
	--------------------------------
	----------NOTE:style layer-----------
	use {
		'projekt0n/github-nvim-theme',
		config = function()
			vim.cmd("hi VirtualTextWarning guifg='yellow'")
			vim.cmd("hi VirtualTextError guifg='red'")
			vim.cmd("hi VirtualTextInfo guifg='#0db9d7'")
			vim.cmd("hi VirtualTextHint guifg='#2c6e4e'")
			vim.cmd("hi ErrorText cterm=underline gui=undercurl guisp=red")
			vim.cmd("hi WarningText cterm=underline gui=undercurl guisp=yellow")
			vim.cmd("hi HintText cterm=underline gui=undercurl guisp=#2c6e4e")
			vim.cmd("hi InformationText cterm=underline gui=undercurl guisp=#0db9d7")
			vim.cmd("hi CursorWord0 ctermbg=239 guibg=#3d3c3b")
			vim.cmd("hi SpellBad cterm=underline gui=undercurl guisp=None")
			vim.api.nvim_set_keymap(
				'n',
				'<space>tc1',
				"<cmd>lua require'github-theme'.setup()<cr>",
				{silent = true}
			)
		end,
		event = "BufRead"
	}
	use {
		'sainnhe/gruvbox-material',
		config = function()
			-- vim.g.gruvbox_material_transparent_background = 1
			vim.g.gruvbox_material_background = 'medium'
			vim.g.gruvbox_material_palette = 'mix'
			vim.cmd("colorscheme gruvbox-material")
			vim.api.nvim_command('highlight default HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold')
			vim.api.nvim_command('highlight default HopNextKey1 guifg=#00dfff gui=bold ctermfg=45 cterm=bold')
			vim.api.nvim_command('highlight default HopNextKey2 guifg=#2b8db3 ctermfg=33')
			vim.api.nvim_command('highlight default HopUnmatched guifg=#666666 ctermfg=242')
			vim.cmd("hi VirtualTextWarning guifg='yellow'")
			vim.cmd("hi VirtualTextError guifg='red'")
			vim.cmd("hi VirtualTextInfo guifg='#0db9d7'")
			vim.cmd("hi VirtualTextHint guifg='#2c6e4e'")
			vim.cmd("hi ErrorText cterm=underline gui=undercurl guisp=red")
			vim.cmd("hi WarningText cterm=underline gui=undercurl guisp=yellow")
			vim.cmd("hi HintText cterm=underline gui=undercurl guisp=#2c6e4e")
			vim.cmd("hi InformationText cterm=underline gui=undercurl guisp=#0db9d7")
			vim.cmd("hi CursorWord0 ctermbg=239 guibg=#3d3c3b")
			vim.cmd("hi SpellBad cterm=underline gui=undercurl guisp=None")
			vim.api.nvim_set_keymap(
				'n',
				'<space>tc2',
				"<cmd>colorscheme gruvbox-material<cr>",
				{silent = true}
			)
		end,
		event = "BufRead"
	}
	use {
		'sainnhe/everforest',
		requires = {"sainnhe/sonokai", "Th3Whit3Wolf/space-nvim"},
		config = function()
			vim.cmd("hi VirtualTextWarning guifg='yellow'")
			vim.cmd("hi VirtualTextError guifg='red'")
			vim.cmd("hi VirtualTextInfo guifg='#0db9d7'")
			vim.cmd("hi VirtualTextHint guifg='#2c6e4e'")
			vim.cmd("hi ErrorText cterm=underline gui=undercurl guisp=red")
			vim.cmd("hi WarningText cterm=underline gui=undercurl guisp=yellow")
			vim.cmd("hi HintText cterm=underline gui=undercurl guisp=#2c6e4e")
			vim.cmd("hi InformationText cterm=underline gui=undercurl guisp=#0db9d7")
			vim.cmd("hi CursorWord0 ctermbg=239 guibg=#3d3c3b")
			vim.cmd("hi SpellBad cterm=underline gui=undercurl guisp=None")
			vim.api.nvim_set_keymap(
				'n',
				'<space>tc3',
				"<cmd>colorscheme everforest<cr>",
				{silent = true}
			)
		end,
		event = "BufRead"
	}

	--------------------------------
	----------NOTE:tools layer-----------
	--------------------------------
	----------NOTE:plugins layer---------
	use {
		-- displays a popup with possible key bindings of the command you started typing
		"folke/which-key.nvim",
		config = function()
			require 'plugins.config.which-key'
		end,
		event = "BufWinEnter"
	}
	use {
		--transparent function
		'xiyaowong/nvim-transparent',
		config = function()
			require 'plugins.config.nvim-transparent'
		end,
		event = "BufWinEnter"
	}

	use {
		--add line indent
		'lukas-reineke/indent-blankline.nvim',
		config = function()
			require 'plugins.config.indent-blankline'
		end,
		event = "BufWinEnter"
	}
	use {
		--git plugin
		'lewis6991/gitsigns.nvim',
		requires = {
			'nvim-lua/plenary.nvim',
		},
		config = function()
			require 'plugins.config.gitsigns'
		end,
		event = "BufRead"
	}
	use {
		--highlight underline with your cursorword
		'itchyny/vim-cursorword',

		--config = function()
		--require 'plugins.config.'
		--end
	}
	use {
		--EasyMotion-like plugin allowing you to jump anywhere
		'phaazon/hop.nvim',
		as = 'hop',
		config = function()
			require 'plugins.config.hop'
		end,
		event = "BufRead",
	}
	use {
		--highlight and search for todo comments
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require 'plugins.config.todo-comments'
		end,
		event = "BufRead"
	}

	--[[ use{ -- add zen mode  TODO: add it later
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    event = "BufRead",
    config = function ()
        require 'plugins.config.zen-mode'
    end
        } ]]
	use {
		--markdown preview plugins
		"davidgranstrom/nvim-markdown-preview"
	}

	use {
		--BookMarks toggling
		"MattesGroeger/vim-bookmarks"
	}

	--------------------------------
end)
require 'packer'.install()

-------------------------------------------------------------

