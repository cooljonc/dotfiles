-- lualine.nvim config (lualine_config.lua)

local colors = {
	black = '#161821',
	white = '#c6c8d1',
	green = '#b4be82',
	yellow = '#e2a478',
	blue = '#84a0c6',
	magenta = '#a093c7',
	fg1 = '#6b7089',
	bg1 = '#2e313f',
	fg2 = '#17171b',
	bg2 = '#818596',
	fg3 = '#3e445e',
	bg3 = '#0f1117'
}

local theme = {
	normal = {
		a = { fg = colors.black, bg = colors.white, gui = 'bold' },
		b = { fg = colors.fg1, bg = colors.bg1 },
		c = { fg = colors.fg3, bg = colors.bg3 },
	},
	insert = {
		a = { fg = colors.black, bg = colors.blue, gui = 'bold' },
		b = { fg = colors.fg1, bg = colors.bg1 },
	},
	visual = {
		a = { fg = colors.black, bg = colors.green, gui = 'bold' },
		b = { fg = colors.fg1, bg = colors.bg1 },
	},
	replace = {
		a = { fg = colors.black, bg = colors.yellow, gui = 'bold' },
		b = { fg = colors.fg1, bg = colors.bg1 },
	},
	command = {
		a = { fg = colors.black, bg = colors.white, gui = 'bold' },
		b = { fg = colors.fg1, bg = colors.bg1 },
	},
	inactive = {
		a = { fg = colors.fg3, bg = colors.bg3 },
		b = { fg = colors.fg3, bg = colors.bg3 },
		c = { fg = colors.fg3, bg = colors.bg3 },
	}
}

local config = {
	options = {
		always_divide_middle = true,
		component_separators = '',
		disabled_filetypes = {
			statusline = {},
			winbar = {}
		},
		globalstatus = false,
		icons_enabled = true,
		ignore_focus = {},
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
		section_separators = { left = '', right = '' },
		theme = theme
	},
	sections = {
		lualine_a = {
			{ 'mode', padding = { left = 1, right = 2 }, separator = { left = '', right = '' } }
		},
		lualine_b = {
			{ 'branch', color = { fg = colors.fg2, bg = colors.bg2 }, padding = 2 },
			{ 'filename', padding = { left = 2, right = 1 } }
		},
		lualine_c = {
			{ 'encoding' }
		},
		lualine_x = {
			{ 'filetype' }
		},
		lualine_y = {
			{ 'progress', padding = { left = 1, right = 2 } },
			{ 'searchcount', color = { fg = colors.fg2, bg = colors.bg2 }, padding = 2 }
		},
		lualine_z = {
			{ 'location', padding = { left = 2, right = 1 }, separator = { left = '', right = '' } }
		}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = {
			{ 'filename' }
		},
		lualine_x = {
			{ 'location' }
		},
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}

require('lualine').setup(config)
