-- 'lazy' config and setup (lazy_init.lua)

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

-- 'lazy' options
local opts = {
    change_detection = {
        enabled = true,
        notify = false
    },
    ui = { backdrop = 100 }
}

-- set up 'lazy' and load plugins
require('lazy').setup('plugins', opts)
