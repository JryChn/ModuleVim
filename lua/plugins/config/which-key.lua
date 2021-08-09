require("which-key").setup {
	plugins = {
		marks = true,

		-- shows a list of your marks on ' and `
		registers = true,

		-- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = false,

			-- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20,

			-- how many suggestions should be shown in the list?
		},

		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = true,

			-- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = true,

			-- adds help for motions
			text_objects = true,

			-- help for text objects triggered after entering an operator
			windows = true,

			-- default bindings on <c-w>
			nav = true,

			-- misc bindings to work with windows
			z = true,

			-- bindings for folds, spelling and others prefixed with z
			g = true,

			-- bindings for prefixed with g
		},
	},

	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	operators = {gc = "Comments"},
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<cr>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "»",

		-- symbol used in the command line area that shows your active key combo
		separator = "➜",

		-- symbol used between a key and it's label
		group = "+",

		-- symbol prepended to a group
	},
	window = {
		border = "none",

		-- none, single, double, shadow
		position = "bottom",

		-- bottom, top
		margin = {1, 0, 1, 0},

		-- extra window margin [top, right, bottom, left]
		padding = {2, 2, 2, 2},

		-- extra window padding [top, right, bottom, left]
	},
	layout = {
		height = {min = 4, max = 25},

		-- min and max height of the columns
		width = {min = 20, max = 50},

		-- min and max width of the columns
		spacing = 3,

		-- spacing between columns
		align = "left",

		-- align columns left, center or right
	},
	ignore_missing = false,

	-- enable this to hide mappings for which you didn't specify a label
	hidden = {"<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ "},

	-- hide mapping boilerplate
	show_help = true,

	-- show help message on the command line when the popup is visible
	triggers = "auto",

	-- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = {"j", "k"},
		v = {"j", "k"},
	},
}

local wk = require("which-key")

wk.register({
	["<space>a"] = {name = "Starting"},
	["<space>b"] = {name = "+buffer"},
	["<space>c"] = {name = "+comment"},
	["<space>f"] = {name = "+Find"},
	["<space>g"] = {name = "+Git"},
	["<space>s"] = {name = "+Search"},
	["<space>t"] = {name = "style"},
	["<space>j"] = {name = "jump"},
	["<space>l"] = {name = "+Language"},
	["<space>w"] = {name = "+Workspace"},
	["\\e"] = {name = "new buffer"},
	["\\p"] = {name = "register paste"},

	----------------------------------
	["<space>aa"] = {name = "Welcome page"},
	["<space>bf"] = {name = "format the buffer"},

	----------------------------------
	["<space>cl"] = {name = "comment line"},
	["<space>cd"] = {name = "comment motion"},

	----------------------------------
	["<space>ff"] = {name = "find file"},
	["<space>fg"] = {name = "live grep"},
	["<space>fb"] = {name = "find buffers"},
	["<space>fh"] = {name = "help tags"},
	["<space>fs"] = {name = "search cursor string"},

	----------------------------------
	["<space>gb"] = {name = "Git Blame"},
	["<space>gr"] = {name = "Git reset hunk"},
	["<space>gR"] = {name = "Git reset buffer"},
	["<space>gp"] = {name = "Git preview hunk"},
	["<space>gs"] = {name = "Git stage"},
	["<space>gu"] = {name = "Git unstage"},
	["<space>gc"] = {name = "Git buffer commits"},
	["<space>gC"] = {name = "Git commits"},
	["<space>gB"] = {name = "Git branchs"},
	["<space>gS"] = {name = "Git status"},
	["<space>gl"] = {name = "toggle line blame"},

	----------------------------------
	["<space>sb"] = {name = "search in buffer"},

	----------------------------------
	["<space>ti"] = {name = "toggle indent line"},
	["<space>tp"] = {name = "toggle transparent"},
	["<space>tc"] = {name = "change theme"},
	["<space>tc1"] = {name = "change to github style"},
	["<space>tc2"] = {name = "change to gruvbox-material"},
	["<space>tc3"] = {name = "change to everforest"},

	----------------------------------
	["<space>jw"] = {name = "jump to word"},
	["<space>jl"] = {name = "jump to line"},

	----------------------------------
	["<space>wa"] = {name = "add worksapce folder"},
	["<space>wr"] = {name = "remove workspace folder"},
	["<space>wl"] = {name = "show workspace"},

	----------------------------------
	["<space>la"] = {name = "action"},
	["<space>ld"] = {name = "preview Definition"},
	["<space>lr"] = {name = "rename"},
	["<space>ll"] = {name = "toggle diagnostic"},
	["<space>lq"] = {name = "quickfix"},

	----------------------------------
	["gd"] = {name = "go to Definition"},
	["gD"] = {name = "go to Declaration"},
	["gr"] = {name = "go to Reference"},
	["gh"] = {name = "show information"},
	["gI"] = {name = "go to implementation"},
})
