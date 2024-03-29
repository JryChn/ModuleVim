-- basic configuration like some original vim options
--
-- --------------key mapping------------------
vim.api.nvim_set_keymap("n", "<Tab>", ":wincmd w<CR>", {silent = true})
vim.api.nvim_set_keymap("i", "jk", "<ESC>", {silent = true})
vim.api.nvim_set_keymap("n", "<C-s>", ":w!<CR>", {noremap = true})
vim.api.nvim_set_keymap("i", "<C-s>", "<ESC>:w!<CR>", {noremap = true})
vim.cmd([[
  nnoremap <silent> <C-Up>    :resize -2<CR>
  nnoremap <silent> <C-Down>  :resize +2<CR>
  nnoremap <silent> <C-Right>  :vertical resize -2<CR>
  nnoremap <silent> <C-Left>  :vertical resize +2<CR>
]])

-- --------------configuration------------------
local sh = "bash"

-- HINT: this will lag the nvim-tree, uncomment it when upstream fix it
--[[ if vim.fn.executable('fish') == 1 then
	sh = "fish"
end ]]
global_local = {
	termguicolors = true,
	mouse = "nv",
	errorbells = true,
	visualbell = true,
	hidden = true,
	fileformats = "unix,mac,dos",
	magic = true,
	virtualedit = "block",
	encoding = "utf-8",
	viewoptions = "folds,cursor,curdir,slash,unix",
	sessionoptions = "curdir,help,tabpages,winsize",

	-- clipboard = "unnamedplus",
	-- HINT: neovim not support system clipboard
	wildignorecase = true,
	wildignore = ".git,.hg,.svn,*.pyc,*.o,*.out,*.jpg,*.jpeg,*.png,*.gif,*.zip,**/tmp/**,*.DS_Store,**/node_modules/**,**/bower_modules/**",
	backup = false,
	writebackup = false,
	guifont = "SauceCodePro Nerd Font",
	swapfile = false,
	history = 2000,
	shada = "!,'300,<50,@100,s10,h",
	backupskip = "/tmp/*,$TMPDIR/*,$TMP/*,$TEMP/*,*/shm/*,/private/var/*,.vault.vim",
	smarttab = true,
	shiftround = true,
	timeout = true,
	ttimeout = true,
	timeoutlen = 500,
	ttimeoutlen = 10,
	updatetime = 100,
	redrawtime = 1500,
	ignorecase = true,
	smartcase = true,
	infercase = true,
	incsearch = true,
	wrapscan = true,
	complete = ".,w,b,k",
	inccommand = "nosplit",
	grepformat = "%f:%l:%c:%m",
	grepprg = "rg --hidden --vimgrep --smart-case --",
	breakat = [[\ \	;:,!?]],
	startofline = false,
	whichwrap = "h,l,<,>,[,],~",
	splitbelow = true,
	splitright = true,
	switchbuf = "useopen",
	backspace = "indent,eol,start",
	diffopt = "filler,iwhite,internal,algorithm:patience",
	completeopt = "menu,menuone,noselect",
	jumpoptions = "stack",
	showmode = false,
	shortmess = "aoOTIcF",
	scrolloff = 5,
	sidescrolloff = 5,
	foldlevelstart = 99,
	ruler = false,
	list = true,
	showtabline = 2,
	winwidth = 30,
	winminwidth = 10,
	pumheight = 15,
	helpheight = 12,
	previewheight = 12,
	showcmd = false,
	cmdheight = 2,
	cmdwinheight = 5,
	equalalways = false,
	laststatus = 2,
	display = "lastline",
	showbreak = "↳  ",
	listchars = "tab:»·,nbsp:+,trail:·,extends:→,precedes:←",
	pumblend = 10,
	winblend = 10,
	spell = true,
	spelllang = "en_us,cjk",

	-- optimize startup time
	shell = sh,
	shadafile = "",
	lazyredraw = true
}
buffer = {
	autoread = true,
	undofile = true,
	synmaxcol = 2500,
	formatoptions = "1jcroql",
	textwidth = 80,
	expandtab = true,
	autoindent = true,
	tabstop = 4,
	shiftwidth = 4,
	softtabstop = -1,
	breakindentopt = "shift:2,min:20",
	wrap = false,
	linebreak = true,
	cursorcolumn = true,
	cursorline = true,
	number = true,
	relativenumber = true,
	foldenable = true,
	signcolumn = "yes",
	conceallevel = 2,
	concealcursor = "niv"
}
for name, value in pairs(global_local) do
	vim.o[name] = value
end

for name, value in pairs(buffer) do
	if value == true or value == false then
		vim.api.nvim_command("set " .. name)
	else
		vim.api.nvim_command("set " .. name .. "=" .. value)
	end
end

vim.cmd("hi SpellBad cterm=underline gui=undercurl guisp=None")
