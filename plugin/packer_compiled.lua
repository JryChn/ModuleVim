-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
	vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
	return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()
	local time
	local profile_info
	local should_profile = false
	if should_profile then
		local hrtime = vim.loop.hrtime
		profile_info = {}
		time = function(chunk, start)
			if start then
				profile_info[chunk] = hrtime()
			else
				profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
			end
		end
	else
		time = function(chunk, start)
		end
	end

	local function save_profiles(threshold)
		local sorted_times = {}
		for chunk_name, time_taken in pairs(profile_info) do
			sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
		end
		table.sort(sorted_times, function(a, b)
			return a[2] > b[2]
		end)
		local results = {}
		for i, elem in ipairs(sorted_times) do
			if not threshold or threshold and elem[2] > threshold then
				results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
			end
		end

		_G._packer = _G._packer or {}
		_G._packer.profile_output = results
	end

	time([[Luarocks path setup]], true)
	local package_path_str = "/home/jeremy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/jeremy/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/jeremy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/jeremy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
	local install_cpath_pattern = "/home/jeremy/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
	if not string.find(package.path, package_path_str, 1, true) then
		package.path = package.path .. ';' .. package_path_str
	end

	if not string.find(package.cpath, install_cpath_pattern, 1, true) then
		package.cpath = package.cpath .. ';' .. install_cpath_pattern
	end

	time([[Luarocks path setup]], false)
	time([[try_loadstring definition]], true)
	local function try_loadstring(s, component, name)
		local success, result = pcall(loadstring(s))
		if not success then
			vim.schedule(function()
				vim.api.nvim_notify(
					'packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result,
					vim.log.levels.ERROR,
					{}
				)
			end)
		end
		return result
	end

	time([[try_loadstring definition]], false)
	time([[Defining packer_plugins]], true)
	_G.packer_plugins = {
		["accelerated-jk"] = {
			config = {
				"\27LJ\2\2:\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\31core.config.accelerated-jk\frequire\0"
			},
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/accelerated-jk"
		},
		["barbar.nvim"] = {
			config = {
				"\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23core.config.barbar\frequire\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/barbar.nvim"
		},
		["compe-tabnine"] = {
			after_files = {
				"/home/jeremy/.local/share/nvim/site/pack/packer/opt/compe-tabnine/after/plugin/compe_tabnine.vim"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/compe-tabnine"
		},
		["dashboard-nvim"] = {
			config = {
				"\27LJ\2\0029\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\30core.config.dashboard-vim\frequire\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/dashboard-nvim"
		},
		["dial.nvim"] = {
			config = {"\27LJ\2\2\v\0\0\1\0\0\0\1K\0\1\0\0"},
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/dial.nvim"
		},
		everforest = {
			config = {
				"\27LJ\2\2{\0\0\5\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\4\0'\3\5\0005\4\6\0B\0\5\1K\0\1\0\1\0\1\vsilent\2$<cmd>colorscheme everforest<cr>\15<space>tc3\6n\20nvim_set_keymap\bapi\bvim\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/everforest"
		},
		["friendly-snippets"] = {
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/friendly-snippets"
		},
		["galaxyline.nvim"] = {
			config = {
				"\27LJ\2\0026\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\27core.config.galaxyline\frequire\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/galaxyline.nvim"
		},
		["github-nvim-theme"] = {
			config = {
				"\27LJ\2\2†\1\0\0\5\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\1\3\0'\2\4\0'\3\5\0005\4\6\0B\0\5\1K\0\1\0\1\0\1\vsilent\2/<cmd>lua require'github-theme'.setup()<cr>\15<space>tc1\6n\20nvim_set_keymap\bapi\bvim\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/github-nvim-theme"
		},
		["gitsigns.nvim"] = {
			config = {
				"\27LJ\2\0027\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\28plugins.config.gitsigns\frequire\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
		},
		["gruvbox-material"] = {
			config = {
				"\27LJ\2\2†\a\0\0\5\0\23\00096\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\6\0'\1\a\0B\0\2\0016\0\0\0009\0\6\0'\1\b\0B\0\2\0016\0\0\0009\0\6\0'\1\t\0B\0\2\0016\0\0\0009\0\6\0'\1\n\0B\0\2\0016\0\0\0009\0\6\0'\1\v\0B\0\2\0016\0\0\0009\0\f\0009\0\r\0'\1\14\0B\0\2\0016\0\0\0009\0\f\0009\0\r\0'\1\15\0B\0\2\0016\0\0\0009\0\f\0009\0\r\0'\1\16\0B\0\2\0016\0\0\0009\0\f\0009\0\r\0'\1\17\0B\0\2\0016\0\0\0009\0\f\0009\0\18\0'\1\19\0'\2\20\0'\3\21\0005\4\22\0B\0\5\1K\0\1\0\1\0\1\vsilent\2*<cmd>colorscheme gruvbox-material<cr>\15<space>tc2\6n\20nvim_set_keymap=highlight default HopUnmatched guifg=#666666 ctermfg=242;highlight default HopNextKey2 guifg=#2b8db3 ctermfg=33Ohighlight default HopNextKey1 guifg=#00dfff gui=bold ctermfg=45 cterm=boldPhighlight default HopNextKey  guifg=#ff007c gui=bold ctermfg=198 cterm=bold\17nvim_command\bapi5hi LspDiagnosticsVirtualTextHint guifg='#10B981'<hi LspDiagnosticsVirtualTextInformation guifg='#0db9d7'6hi LspDiagnosticsVirtualTextError guifg='#db4b4b'7hi LspDiagnosticsVirtualTextWarning guifg='yellow'!colorscheme gruvbox-material\bcmd\bmix\29gruvbox_material_palette\vmedium gruvbox_material_background\6g\bvim\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/gruvbox-material"
		},
		hop = {
			config = {
				"\27LJ\2\0022\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\23plugins.config.hop\frequire\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/hop"
		},
		["indent-blankline.nvim"] = {
			config = {
				"\27LJ\2\2?\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0$plugins.config.indent-blankline\frequire\0"
			},
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim"
		},
		kommentary = {
			config = {
				"\27LJ\2\2;\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0 languages.config.kommentary\frequire\0"
			},
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/kommentary"
		},
		["lspsaga.nvim"] = {
			load_after = {},
			loaded = true,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/lspsaga.nvim"
		},
		["neoscroll.nvim"] = {
			config = {
				"\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0"
			},
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/neoscroll.nvim"
		},
		["nvim-autopairs"] = {
			config = {
				"\27LJ\2\2<\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0"
			},
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
		},
		["nvim-compe"] = {
			after_files = {
				"/home/jeremy/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim"
			},
			config = {
				"\27LJ\2\2;\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0 languages.config.nvim-compe\frequire\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/nvim-compe",
			wants = {"vim-vsnip"}
		},
		["nvim-lspconfig"] = {
			after = {"lspsaga.nvim", "nvim-lspinstall"},
			loaded = true,
			only_config = true
		},
		["nvim-lspinstall"] = {
			load_after = {},
			loaded = true,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/nvim-lspinstall"
		},
		["nvim-markdown-preview"] = {
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/nvim-markdown-preview"
		},
		["nvim-nonicons"] = {
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/nvim-nonicons"
		},
		["nvim-toggleterm.lua"] = {
			config = {
				"\27LJ\2\2;\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0 core.config.nvim-toggleterm\frequire\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/nvim-toggleterm.lua"
		},
		["nvim-transparent"] = {
			config = {
				"\27LJ\2\2?\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0$plugins.config.nvim-transparent\frequire\0"
			},
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/nvim-transparent"
		},
		["nvim-tree.lua"] = {
			config = {
				"\27LJ\2\0025\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\26core.config.nvim-tree\frequire\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
		},
		["nvim-treesitter"] = {
			after = {
				"nvim-ts-autotag",
				"nvim-ts-rainbow",
				"nvim-treesitter-textobjects",
				"spellsitter.nvim"
			},
			loaded = true,
			only_config = true
		},
		["nvim-treesitter-textobjects"] = {
			load_after = {},
			loaded = true,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects"
		},
		["nvim-ts-autotag"] = {
			load_after = {},
			loaded = true,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag"
		},
		["nvim-ts-rainbow"] = {
			load_after = {},
			loaded = true,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow"
		},
		["nvim-web-devicons"] = {
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
		},
		["packer.nvim"] = {
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/packer.nvim"
		},
		["plenary.nvim"] = {
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/plenary.nvim"
		},
		["popup.nvim"] = {
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/popup.nvim"
		},
		sonokai = {
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/sonokai"
		},
		["space-nvim"] = {
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/space-nvim"
		},
		["spellsitter.nvim"] = {
			load_after = {},
			loaded = true,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/spellsitter.nvim"
		},
		["telescope.nvim"] = {
			config = {
				"\27LJ\2\0025\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\26core.config.telescope\frequire\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
		},
		["todo-comments.nvim"] = {
			config = {
				"\27LJ\2\2<\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0!plugins.config.todo-comments\frequire\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/todo-comments.nvim"
		},
		["vim-bookmarks"] = {
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/vim-bookmarks"
		},
		["vim-cursorword"] = {
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/vim-cursorword"
		},
		["vim-rooter"] = {
			config = {
				"\27LJ\2\0025\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\24rooter_silent_chdir\6g\bvim\0"
			},
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/vim-rooter"
		},
		["vim-sayonara"] = {
			config = {
				"\27LJ\2\0028\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\29core.config.vim-sayonara\frequire\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/vim-sayonara"
		},
		["vim-vsnip"] = {
			after = {"vim-vsnip-integ"},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/vim-vsnip",
			wants = {"friendly-snippets"}
		},
		["vim-vsnip-integ"] = {
			after_files = {
				"/home/jeremy/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ/after/plugin/vsnip_integ.vim"
			},
			load_after = {["vim-vsnip"] = true},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/vim-vsnip-integ"
		},
		["vista.vim"] = {
			config = {
				"\27LJ\2\0021\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\22core.config.vista\frequire\0"
			},
			loaded = false,
			needs_bufread = false,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/opt/vista.vim"
		},
		["which-key.nvim"] = {
			config = {
				"\27LJ\2\0028\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\29plugins.config.which-key\frequire\0"
			},
			loaded = true,
			path = "/home/jeremy/.local/share/nvim/site/pack/packer/start/which-key.nvim"
		}
	}

	time([[Defining packer_plugins]], false)

	-- Config for: nvim-treesitter
	time([[Config for nvim-treesitter]], true)
	try_loadstring(
		"\27LJ\2\2;\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0 core.config.nvim-treesitter\frequire\0",
		"config",
		"nvim-treesitter"
	)
	time([[Config for nvim-treesitter]], false)

	-- Config for: dial.nvim
	time([[Config for dial.nvim]], true)
	try_loadstring("\27LJ\2\2\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "dial.nvim")
	time([[Config for dial.nvim]], false)

	-- Config for: which-key.nvim
	time([[Config for which-key.nvim]], true)
	try_loadstring(
		"\27LJ\2\0028\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\29plugins.config.which-key\frequire\0",
		"config",
		"which-key.nvim"
	)
	time([[Config for which-key.nvim]], false)

	-- Config for: neoscroll.nvim
	time([[Config for neoscroll.nvim]], true)
	try_loadstring(
		"\27LJ\2\0027\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14neoscroll\frequire\0",
		"config",
		"neoscroll.nvim"
	)
	time([[Config for neoscroll.nvim]], false)

	-- Config for: indent-blankline.nvim
	time([[Config for indent-blankline.nvim]], true)
	try_loadstring(
		"\27LJ\2\2?\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0$plugins.config.indent-blankline\frequire\0",
		"config",
		"indent-blankline.nvim"
	)
	time([[Config for indent-blankline.nvim]], false)

	-- Config for: accelerated-jk
	time([[Config for accelerated-jk]], true)
	try_loadstring(
		"\27LJ\2\2:\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0\31core.config.accelerated-jk\frequire\0",
		"config",
		"accelerated-jk"
	)
	time([[Config for accelerated-jk]], false)

	-- Config for: nvim-transparent
	time([[Config for nvim-transparent]], true)
	try_loadstring(
		"\27LJ\2\2?\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0$plugins.config.nvim-transparent\frequire\0",
		"config",
		"nvim-transparent"
	)
	time([[Config for nvim-transparent]], false)

	-- Config for: kommentary
	time([[Config for kommentary]], true)
	try_loadstring(
		"\27LJ\2\2;\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0 languages.config.kommentary\frequire\0",
		"config",
		"kommentary"
	)
	time([[Config for kommentary]], false)

	-- Config for: nvim-lspconfig
	time([[Config for nvim-lspconfig]], true)
	try_loadstring(
		"\27LJ\2\2?\0\0\2\0\2\0\0046\0\0\0'\1\1\0B\0\2\1K\0\1\0$languages.config.nvim-lspconfig\frequire\0",
		"config",
		"nvim-lspconfig"
	)
	time([[Config for nvim-lspconfig]], false)

	-- Config for: nvim-autopairs
	time([[Config for nvim-autopairs]], true)
	try_loadstring(
		"\27LJ\2\2<\0\0\2\0\3\0\0066\0\0\0'\1\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0",
		"config",
		"nvim-autopairs"
	)
	time([[Config for nvim-autopairs]], false)

	-- Config for: vim-rooter
	time([[Config for vim-rooter]], true)
	try_loadstring(
		"\27LJ\2\0025\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0\24rooter_silent_chdir\6g\bvim\0",
		"config",
		"vim-rooter"
	)
	time([[Config for vim-rooter]], false)

	-- Load plugins in order defined by `after`
	time([[Sequenced loading]], true)
	vim.cmd [[ packadd lspsaga.nvim ]]
	vim.cmd [[ packadd nvim-lspinstall ]]
	vim.cmd [[ packadd spellsitter.nvim ]]
	vim.cmd [[ packadd nvim-treesitter-textobjects ]]
	vim.cmd [[ packadd nvim-ts-rainbow ]]
	vim.cmd [[ packadd nvim-ts-autotag ]]
	time([[Sequenced loading]], false)
	vim.cmd [[augroup packer_load_aucmds]]
	vim.cmd [[au!]]

	-- Event lazy-loads
	time([[Defining lazy-load event autocommands]], true)
	vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'galaxyline.nvim', 'dashboard-nvim', 'barbar.nvim', 'vista.vim', 'vim-sayonara', 'nvim-toggleterm.lua', 'telescope.nvim', 'nvim-tree.lua'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
	vim.cmd [[au InsertCharPre * ++once lua require("packer.load")({'nvim-compe', 'compe-tabnine', 'vim-vsnip-integ', 'vim-vsnip'}, { event = "InsertCharPre *" }, _G.packer_plugins)]]
	vim.cmd [[au BufRead * ++once lua require("packer.load")({'hop', 'gitsigns.nvim', 'github-nvim-theme', 'todo-comments.nvim', 'everforest', 'gruvbox-material'}, { event = "BufRead *" }, _G.packer_plugins)]]
	time([[Defining lazy-load event autocommands]], false)
	vim.cmd("augroup END")
	if should_profile then
		save_profiles()
	end
end)

if not no_errors then
	vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: ' .. error_msg .. '" | echom "Please check your config for correctness" | echohl None')
end
