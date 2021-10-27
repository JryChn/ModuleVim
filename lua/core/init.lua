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
	-- use {
	--Icon sets for neovim plugins and settings
	-- 'yamatsum/nvim-nonicons',
	-- requires = {'kyazdani42/nvim-web-devicons'}
	-- }
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
		requires = {
			{'nvim-lua/popup.nvim'},
			{'nvim-lua/plenary.nvim'},
		},
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
		requires = {
			{'kyazdani42/nvim-web-devicons'},
			{"SmiteshP/nvim-gps"},
		},
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
			{'windwp/nvim-ts-autotag', after = 'nvim-treesitter'},
			{
				'JoosepAlviste/nvim-ts-context-commentstring',
				after = 'nvim-treesitter'
			}
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
			{'williamboman/nvim-lsp-installer', after = 'nvim-lspconfig'},
			{'tami5/lspsaga.nvim', after = 'nvim-lspconfig'},
			{'mfussenegger/nvim-jdtls', after = 'nvim-lspconfig'},
			{'jose-elias-alvarez/nvim-lsp-ts-utils', after = 'nvim-lspconfig'},
			{'jose-elias-alvarez/null-ls.nvim', after = 'nvim-lspconfig'},
		},
		config = function()
			require 'languages.config.nvim-lspconfig'
		end
	}
	use {
		--auto completion
		'hrsh7th/nvim-cmp',
		requires = {
			{'onsails/lspkind-nvim'},
			{
				'hrsh7th/vim-vsnip',
				requires = {'rafamadriz/friendly-snippets'},
				event = "InsertCharPre"
			},
			{
				'hrsh7th/vim-vsnip-integ',
				after = "vim-vsnip",
			},
			{
				'tzachar/cmp-tabnine',
				run = "./install.sh",
				after = "nvim-cmp",
				event = "InsertCharPre"
			},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-buffer', after = "nvim-cmp", event = "InsertCharPre"},
			{'hrsh7th/cmp-path', after = "nvim-cmp", event = "InsertCharPre"},
			{
				'hrsh7th/cmp-nvim-lua',
				after = "nvim-cmp",
				event = "InsertCharPre"
			},
			{'octaltree/cmp-look', after = "nvim-cmp", event = "InsertCharPre"},
			{'hrsh7th/cmp-vsnip', after = "nvim-cmp", event = "InsertCharPre"},
			{'kdheepak/cmp-latex-symbols', after = "nvim-cmp", ft = "tex"},
			{'hrsh7th/cmp-calc', after = "nvim-cmp", event = "InsertCharPre"},
			{
				'ray-x/cmp-treesitter',
				after = "nvim-cmp",
				event = "InsertCharPre"
			},
			{
				'quangnguyen30192/cmp-nvim-ultisnips',
				after = "nvim-cmp",
				event = "InsertCharPre"
			},
			{'hrsh7th/cmp-emoji', after = "nvim-cmp", event = "InsertCharPre"},
			{'f3fora/cmp-spell', after = "nvim-cmp", event = "InsertCharPre"},
			{
				'quangnguyen30192/cmp-nvim-tags',
				after = "nvim-cmp",
				event = "InsertCharPre"
			}
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
			vim.api.nvim_set_keymap(
				'n',
				'<space>tc1',
				"<cmd>colorscheme github_dark<cr>",
				{silent = true}
			)
		end,
	}
	use {
		'sainnhe/gruvbox-material',
		config = function()
			-- vim.g.gruvbox_material_transparent_background = 1
			vim.g.gruvbox_material_background = 'soft'
			vim.g.gruvbox_material_enable_italic = 1
			vim.g.gruvbox_material_disable_italic_comment = 1
			vim.g.gruvbox_material_palette = 'mix'
			vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
			vim.api.nvim_set_keymap(
				'n',
				'<space>tc2',
				"<cmd>colorscheme gruvbox-material<cr>",
				{silent = true}
			)
		end,
	}
	use {
		'sainnhe/everforest',
		requires = {"sainnhe/sonokai", "Th3Whit3Wolf/space-nvim"},
		config = function()
			vim.g.everforest_diagnostic_virtual_text = 'colored'
			vim.api.nvim_set_keymap(
				'n',
				'<space>tc3',
				"<cmd>colorscheme everforest<cr>",
				{silent = true}
			)
		end,
	}
	use {
		'tjdevries/colorbuddy.vim',
		requires = {
			{
				'Th3Whit3Wolf/onebuddy',
				config = function()
					vim.api.nvim_set_keymap(
						'n',
						'<space>tc4',
						"<cmd>lua require'colorbuddy'.colorscheme('onebuddy')<cr>",
						{silent = true}
					)
				end
			},
			{
				'tjdevries/gruvbuddy.nvim',
				config = function()
					vim.api.nvim_set_keymap(
						'n',
						'<space>tc5',
						"<cmd>lua require'colorbuddy'.colorscheme('gruvbuddy')<cr>",
						{silent = true}
					)
				end
			},
			{
				'sainnhe/edge',
				config = function()
					vim.g.edge_diagnostic_virtual_text = 'colored', vim.api.nvim_set_keymap(
						'n',
						'<space>tc6',
						"<cmd>colorscheme edge<cr>",
						{silent = true}
					)
				end
			},
		}
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
vim.cmd("colorscheme gruvbox-material")

-------------------------------------------------------------

