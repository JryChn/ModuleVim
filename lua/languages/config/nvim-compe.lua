vim.o.completeopt = "menuone,noselect"

require "compe".setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = "enable",
    throttle_time = 80,
    source_timeout = 200,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = true,
    source = {
        path = {kind="﬜",priority=10,true},
        buffer = {kind = "﬘",priority=5, true},
        calc = {kind="",priority=10,true},
        vsnip = {kind = "",priority=7}, --replace to what sign you prefer
        nvim_lsp = {kind="",priority=10,true},
        spell = {kind="",priority=4,true},
        tags = {kind="",priority=9,true},
        snippets_nvim = {kind="",priority=7,true},
        treesitter = {kind="",priority=8,true},
        nvim_lua = {kind="",priority=10,true},
        tabnine = {priority=6,true},
        emoji = {kind="",priority=9, true}
    }
}

local t = function(str)
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col(".") - 1
    if col == 0 or vim.fn.getline("."):sub(col, col):match("%s") then
        return true
    else
        return false
    end
end

-- tab completion

_G.tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-n>"
    elseif check_back_space() then
        return t "<Tab>"
    else
        return vim.fn["compe#complete"]()
    end
end
_G.s_tab_complete = function()
    if vim.fn.pumvisible() == 1 then
        return t "<C-p>"
    elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
        return t "<Plug>(vsnip-jump-prev)"
    else
        return t "<S-Tab>"
    end
end

--  mappings

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

function _G.completions()
    local npairs = require("nvim-autopairs")
    if vim.fn.pumvisible() == 1 then
        if vim.fn.complete_info()["selected"] ~= -1 then
            return vim.fn["compe#confirm"]("<CR>")
        end
    end
    return npairs.check_break_line_char()
end

vim.api.nvim_set_keymap("i", "<CR>", "v:lua.completions()", {expr = true})

local g = vim.g

-- speeden up compe
g.loaded_compe_calc = 0
g.loaded_compe_emoji = 0

g.loaded_compe_luasnip = 0
g.loaded_compe_nvim_lua = 0

g.loaded_compe_path = 0
g.loaded_compe_spell = 0
g.loaded_compe_tags = 0
g.loaded_compe_treesitter = 0

g.loaded_compe_snippets_nvim = 0

g.loaded_compe_ultisnips = 0
g.loaded_compe_vim_lsc = 0
g.loaded_compe_vim_lsp = 0
g.loaded_compe_omni = 0

