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

-- plugins specification & configuration
return require('packer').startup(function()
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	-- colorscheme
	use 'cocopon/iceberg.vim'
	vim.cmd[[colorscheme iceberg]]

	-- lualine
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons' }
	}
	require('lualine').setup {
		options = {
			icons_enabled = true,
			theme = 'iceberg',
			component_separators = { left = '', right = ''},
			section_separators = { left = '', right = ''},
			disabled_filetypes = {
				statusline = {},
				winbar = {},
			},
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			}
		},
		sections = {
			lualine_a = {'mode'},
			lualine_b = {'branch', 'diff', 'diagnostics'},
			lualine_c = {'filename'},
			lualine_x = {'encoding', 'fileformat', 'filetype'},
			lualine_y = {'progress'},
			lualine_z = {'location'}
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = {'filename'},
			lualine_x = {'location'},
			lualine_y = {},
			lualine_z = {}
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {}
	}
end)
