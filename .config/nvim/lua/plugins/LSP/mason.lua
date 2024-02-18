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

require('mason').setup(opts)
