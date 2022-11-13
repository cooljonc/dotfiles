-- neovim config (init.lua)

-- general settings
vim.opt.autoindent = true
vim.opt.background = "dark"
vim.opt.clipboard = "unnamedplus"
vim.opt.confirm = true
vim.opt.cursorline = true
vim.opt.emoji = true
vim.opt.errorbells = false
vim.opt.expandtab = false
vim.opt.guicursor = "a:block"
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.linebreak = true
vim.opt.mouse = "a"
vim.opt.mousehide = true
vim.opt.mouseshape = "n:arrow,v:beam,i:beam,r:beam"
vim.opt.number = true
vim.opt.preserveindent = true
vim.opt.relativenumber = false
vim.opt.scrolloff = 1
vim.opt.shiftround = false
vim.opt.shiftwidth = 4
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.softtabstop = 4
vim.opt.syntax = "ON"
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.title = true
vim.opt.visualbell = false
vim.opt.wrap = true

-- packer.nvim plugins specification
require('plugins')

-- automatically run :PackerSync when packer.nvim plugins specification is updated
vim.cmd([[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]])

-- colorscheme (iceberg.vim)
vim.cmd[[colorscheme iceberg]]

-- lualine.nvim
require('lualine').setup {
	options = {
		always_divide_middle = true,
		component_separators = '│',
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
		theme = 'iceberg'
	},
	sections = {
		lualine_a = {
			{ 'mode', separator = { left = '', right = '' }, padding = 0 }
		},
		lualine_b = {
			{ 'branch', separator = { right = '' }, padding = { left = 1, right = 0 } }
		},
		lualine_c = { 'filename' },
		lualine_x = { 'encoding', 'fileformat', 'filetype' },
		lualine_y = {
			{ 'progress', separator = { left = '' }, padding = { left = 0, right = 1 } }
		},
		lualine_z = {
			{ 'location', separator = { left = '', right = '' }, padding = 0 }
		}
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { 'filename' },
		lualine_x = { 'location' },
		lualine_y = {},
		lualine_z = {}
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {}
}
