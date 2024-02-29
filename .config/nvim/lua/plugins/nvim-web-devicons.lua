-- 'nvim-web-devicons' config (plugins/nvim-web-devicons.lua)

local opts = {
    color_icons = false,
    default = false,
    override = {},
    override_by_extension = {},
    override_by_filename = {},
    strict = false
}

local function init()
    vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = '*',
        callback = function()
            local default_icon = require('nvim-web-devicons').get_default_icon().icon
            require('nvim-web-devicons').set_default_icon(default_icon, vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name('Normal'), 'fg#'))
        end
    })
end

local function config()
    require('nvim-web-devicons').setup(opts)
    require('nvim-web-devicons').set_default_icon('󰈙', vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name('Normal'), 'fg#'))
end

return {
    init = init,
    config = config
}
