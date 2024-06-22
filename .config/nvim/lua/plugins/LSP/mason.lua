-- 'mason' config (plugins/LSP/mason.lua)

local opts = {
    max_concurrent_installers = 4,
    ui = {
        check_outdated_packages_on_open = true,
        icons = {
            package_installed = '●',
            package_pending = '●',
            package_uninstalled = '●'
        }
    }
}

return {
    {
        'williamboman/mason.nvim',
        dependencies = {
            'neovim/nvim-lspconfig',
            'williamboman/mason-lspconfig.nvim'
        },
        build = ':MasonUpdate',
        config = function()
            require('mason').setup(opts)
        end
    }
}
