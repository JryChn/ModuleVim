vim.api.nvim_set_keymap("n", "<space>aa", ":Dashboard<CR>", {silent = true})

-----------------------------------------------------------------------------

vim.g.dashboard_disable_at_vimenter = 0
vim.g.dashboard_footer_icon = ""
vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_preview_file_width = 80
vim.g.dashboard_custom_header = {
	'  ╭━━━╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱╭╮╱╱╭╮  ',
	'  ╰╮╭╮┣╮╱╱╱╱╱╱╱╱╱╱╱╱╱╱╱┃╰╮╭╯┃  ',
	'  ╱┃┃┃┣╋━━┳━┳━━┳╮╭┳╮╱╭╮╰╮┃┃╭╋╮╭╮  ',
	'  ╱┃┃┃┣┫┃━┫╭┫┃━┫╰╯┃┃╱┃┃╱┃╰╯┣┫╰╯┃  ',
	'  ╭╯╰╯┃┃┃━┫┃┃┃━┫┃┃┃╰━╯┃╱╰╮╭┫┃┃┃┃  ',
	'  ╰━━━┫┣━━┻╯╰━━┻┻┻┻━╮╭╯╱╱╰╯╰┻┻┻╯  ',
	'  ╱╱╱╭╯┃╱╱╱╱╱╱╱╱╱╱╭━╯┃  ',
	'  ╱╱╱╰━╯╱╱╱╱╱╱╱╱╱╱╰━━╯  '
}
vim.g.dashboard_custom_section = {
	new_file = {
		description = {"  New   File              "},
		command = "DashboardNewFile"
	},
	find_history = {
		description = {"  Recently opened files   "},
		command = "lua require('telescope.builtin').oldfiles()"
	},
	find_file = {
		description = {"  Find  File              "},
		command = "lua require('telescope.builtin').find_files()"
	}
}
