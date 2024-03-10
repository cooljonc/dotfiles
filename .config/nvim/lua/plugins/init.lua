-- 'lazy' plugins specification and setup (plugins/init.lua)

-- ensure 'lazy' is installed, otherwise install/bootstrap 'lazy'
local lazy_path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazy_path) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazy_path,
    })
end

vim.opt.rtp:prepend(lazy_path)

-- plugins specification and setup
local plugins = {
    --- colorschemes:

    -- iceberg
    {
        'cocopon/iceberg.vim',
        init = function()
            require('plugins.colorschemes.iceberg')
        end
    },

    -- kanagawa
    {
        'rebelot/kanagawa.nvim',
        config = function()
            require('plugins.colorschemes.kanagawa')
        end
    },

    --- LSP:

    -- mason
    {
        'williamboman/mason.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason-lspconfig.nvim'
        },
        build = ':MasonUpdate',
        config = function()
            require('plugins.LSP.mason')
        end
    },

    ---

    -- colorizer
    {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require('plugins.colorizer')
        end
    },

    -- flatten
    {
        'willothy/flatten.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('flatten').setup()
        end
    },

    -- gitsigns
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    },

    -- indent-blankline
    {
        'lukas-reineke/indent-blankline.nvim',
        init = require('plugins.indent-blankline').init,
        config = require('plugins.indent-blankline').config
    },

    -- lualine
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('plugins.lualine')
        end
    },

    -- nvim-treesitter
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('plugins.nvim-treesitter')
        end
    },

    -- nvim-web-devicons
    {
        'nvim-tree/nvim-web-devicons',
        init = require('plugins.nvim-web-devicons').init,
        config = require('plugins.nvim-web-devicons').config
    },

    -- virt-column
    {
        'lukas-reineke/virt-column.nvim',
        config = function()
            require('plugins.virt-column')
        end
    }
}

require('lazy').setup(plugins)
