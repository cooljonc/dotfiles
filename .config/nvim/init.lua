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
vim.opt.relativenumber = true
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
require('lualine_config')
