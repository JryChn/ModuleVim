local gl = require("galaxyline")
local gls = gl.section
require 'nvim-navic'.setup()

gl.short_line_list = {
	"NvimTree",
	"vista_kind",
	"toggleterm",
	"vista_markdown",
	"vista"
}

local colors = {
	bg = "#1e222a",
	line_bg = "#1e222a",
	fg = "#D8DEE9",
	green = "#BBE67E",
	orange = "#FF8800",
	red = "#DF8890",
	lightbg = "#282c34",
	nord = "#81A1C1",
	greenYel = "#EBCB8B"
}

gls.left[1] = {
	leftRounded = {
		provider = function()
			return ""
		end,
		highlight = {colors.nord, colors.bg}
	}
}

gls.left[2] = {
	statusIcon = {
		provider = function()
			return "   "
		end,
		highlight = {colors.bg, colors.nord},
		separator = " ",
		separator_highlight = {colors.lightbg, colors.lightbg}
	}
}

gls.left[3] = {
	FileIcon = {
		provider = "FileIcon",
		condition = buffer_not_empty,
		highlight = {
			require("galaxyline.providers.fileinfo").get_file_icon_color,
			colors.lightbg
		}
	}
}

gls.left[4] = {
	FileName = {
		provider = {"FileName", "FileSize"},
		condition = buffer_not_empty,
		highlight = {colors.fg, colors.lightbg}
	}
}

gls.left[5] = {
	nvimNavic = {
		provider = function()
			return require('nvim-navic').get_location()
		end,
		condition = function()
			return require('nvim-navic').is_available()
		end
	}
}

gls.left[6] = {
	teech = {
		provider = function()
			return ""
		end,
		separator = " ",
		highlight = {colors.lightbg, colors.bg}
	}
}

local checkwidth = function()
	local squeeze_width = vim.fn.winwidth(0) / 2
	if squeeze_width > 40 then
		return true
	end
	return false
end

gls.left[7] = {
	DiffAdd = {
		provider = "DiffAdd",
		condition = checkwidth,
		icon = "   ",
		highlight = {colors.greenYel, colors.line_bg}
	}
}

gls.left[8] = {
	DiffModified = {
		provider = "DiffModified",
		condition = checkwidth,
		icon = " ",
		highlight = {colors.orange, colors.line_bg}
	}
}

gls.left[9] = {
	DiffRemove = {
		provider = "DiffRemove",
		condition = checkwidth,
		icon = " ",
		highlight = {colors.red, colors.line_bg}
	}
}

gls.left[10] = {
	LeftEnd = {
		provider = function()
			return " "
		end,
		separator = " ",
		separator_highlight = {colors.line_bg, colors.line_bg},
		highlight = {colors.line_bg, colors.line_bg}
	}
}

gls.left[11] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = "  ",
		highlight = {colors.red, colors.bg}
	}
}

gls.left[12] = {
	Space = {
		provider = function()
			return " "
		end,
		highlight = {colors.line_bg, colors.line_bg}
	}
}

gls.left[13] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = "  ",
		highlight = {colors.red, colors.bg}
	}
}
gls.right[1] = {
	encode = {
		provider = 'FileEncode',
		icon = "   ",
		highlight = {colors.fg, colors.line_bg}
	}
}
gls.right[2] = {
	lineColumnNumber = {
		provider = 'LineColumn',
		icon = "  ",
		highlight = {colors.fg, colors.line_bg}
	}
}
gls.right[3] = {
	ShowLspClient = {
		provider = function()
			if require('galaxyline.providers.lsp').get_lsp_client() == 'No Active Lsp' then
				return "  "
			end
			return "  "
		end,
		condition = function()
			local tbl = {["dashboard"] = true, [""] = true}
			if tbl[vim.bo.filetype] then
				return false
			end
			return true
		end,
		highlight = {
			function()
				if require('galaxyline.providers.lsp').get_lsp_client() == 'No Active Lsp' then
					return colors.red
				else
					return colors.green
				end
			end,
			colors.line_bg
		}
	}
}
gls.right[4] = {
	Space = {
		provider = function()
			return " "
		end,
		highlight = {colors.line_bg, colors.line_bg}
	}
}

gls.right[5] = {
	GitBranch = {
		provider = "GitBranch",
		condition = require("galaxyline.providers.vcs").check_git_workspace,
		icon = "  ",
		highlight = {colors.green, colors.line_bg}
	}
}

gls.right[6] = {
	right_LeftRounded = {
		provider = function()
			return ""
		end,
		separator = " ",
		separator_highlight = {colors.bg, colors.bg},
		highlight = {colors.red, colors.bg}
	}
}

gls.right[7] = {
	ViMode = {
		provider = function()
			local alias = {
				n = "NORMAL",
				i = "INSERT",
				c = "COMMAND",
				V = "VISUAL",
				[""] = "VISUAL",
				v = "VISUAL",
				R = "REPLACE"
			}
			return alias[vim.fn.mode()]
		end,
		highlight = {colors.bg, colors.red}
	}
}

gls.right[8] = {
	PerCent = {
		provider = "LinePercent",
		separator = " ",
		separator_highlight = {colors.red, colors.red},
		highlight = {colors.bg, colors.fg}
	}
}

gls.right[9] = {
	rightRounded = {
		provider = function()
			return ""
		end,
		highlight = {colors.fg, colors.bg}
	}
}
