-- 'colorizer' config (plugins/colorizer.lua)

local opts = {
    buftypes = {},
    filetypes = {
        '*',
        '!html'
    },
    user_default_options = {
        AARRGGBB = false,
        always_update = false,
        css = false,
        css_fn = false,
        hsl_fn = false,
        mode = 'background',
        names = false,
        RGB = true,
        rgb_fn = false,
        RRGGBB = true,
        RRGGBBAA = true,
        sass = {
            enable = false,
            parsers = {}
        },
        tailwind = false,
        virtualtext = '■'
    }
}

return {
    {
        'NvChad/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup(opts)
        end
    }
}
