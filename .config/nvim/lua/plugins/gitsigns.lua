-- 'gitsigns' config (plugins/gitsigns.lua)

return {
    {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
}
