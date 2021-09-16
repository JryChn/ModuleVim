local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(
		col,
		col
	):match("%s") == nil
end

local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(
		vim.api.nvim_replace_termcodes(key, true, true, true),
		mode,
		true
	)
end
local tab_complete = function(fallback)
	if vim.fn.pumvisible() == 1 then
		vim.api.nvim_feedkeys(
			vim.api.nvim_replace_termcodes("<C-n>", true, true, true),
			"n",
			true
		)
	elseif has_words_before() and vim.fn["vsnip#available"]() == 1 then
		vim.api.nvim_feedkeys(
			vim.api.nvim_replace_termcodes(
				"<Plug>(vsnip-expand-or-jump)",
				true,
				true,
				true
			),
			"",
			true
		)
	else
		fallback()
	end
end
local s_tab_complete = function(fallback)
	if vim.fn.pumvisible() == 1 then
		vim.api.nvim_feedkeys(
			vim.api.nvim_replace_termcodes("<C-p>", true, true, true),
			"n",
			true
		)
	elseif has_words_before() and vim.fn["vsnip#available"]() == 1 then
		vim.api.nvim_feedkeys(
			vim.api.nvim_replace_termcodes(
				"<Plug>(vsnip-jump-prev)",
				true,
				true,
				true
			),
			"",
			true
		)
	else
		fallback()
	end
end

local cmp = require('cmp')
cmp.setup {
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body)
		end
	},
	mapping = {
		["<Tab>"] = tab_complete,
		["<C-j>"] = tab_complete,
		["<S-Tab>"] = s_tab_complete,
		["<CR>"] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false
		},
		["<C-k>"] = s_tab_complete
	},
	formatting = {
		format = function(entry, vim_item)
			-- fancy icons and a name of kind
			vim_item.kind = require("lspkind").presets.default[vim_item.kind] .. " " .. vim_item.kind

			-- set a name for each source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				nvim_lua = "[Lua]",
				latex_symbols = "[Latex]",
				vsnip = "[Snippet]",
				path = "[Path]",
				look = "[Look]",
				cmp_tabnine = "[T9]",
				ultisnips = "[Snippet]",
				treesitter = "[Treesitter]",
				calc = "[Clac]",
				emoji = "[Emoji]",
				spell = "[Spell]",
				tags = "[Tags]"
			})[entry.source.name]
			return vim_item
		end,
	},
	sources = {
		{name = "nvim_lsp"},
		{name = "buffer"},
		{name = "vsnip"},
		{name = "path"},
		{name = "look"},
		{name = "nvim_lua"},
		{name = "cmp_tabnine"},
		{name = "ultisnips"},
		{name = "treesitter"},
		{name = "calc"},
		{name = "latex_symbols"},
		{name = "emoji"},
		{name = "spell"},
		{name = "tags"},

		-- path = {kind = "﬜", priority = 10, true},
		-- buffer = {kind = "﬘", priority = 5, true},
		-- calc = {kind = "", priority = 10, true},
		-- vsnip = {kind = "", priority = 9},
		--replace to what sign you prefer
		--[[ nvim_lsp = {kind = "", priority = 9, true},
		spell = {kind = "", priority = 4, true},
		tags = {kind = "", priority = 10, true},
		snippets_nvim = {kind = "", priority = 7, true},
		treesitter = {kind = "", priority = 8, true},
		nvim_lua = {kind = "", priority = 9, true},
		tabnine = {priority = 9, true},
		emoji = {kind = "", priority = 9, true} ]]
	}
}

require('lspkind').init({
	-- enables text annotations
	--
	-- default: true
	with_text = true,

	-- default symbol map
	-- can be either 'default' (requires nerd-fonts font) or
	-- 'codicons' for codicon preset (requires vscode-codicons font)
	--
	-- default: 'default'
	preset = 'codicons',

	-- override preset symbols
	--
	-- default: {}
	symbol_map = {
		Text = "",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "ﰠ",
		Variable = "",
		Class = "ﴯ",
		Interface = "",
		Module = "",
		Property = "ﰠ",
		Unit = "塞",
		Value = "",
		Enum = "",
		Keyword = "",
		Snippet = "",
		Color = "",
		File = "",
		Reference = "",
		Folder = "",
		EnumMember = "",
		Constant = "",
		Struct = "פּ",
		Event = "",
		Operator = "",
		TypeParameter = ""
	},
})
