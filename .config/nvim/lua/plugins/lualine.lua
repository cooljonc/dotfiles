-- 'lualine' config (plugins/lualine.lua)

local load_theme = require('lualine.utils.loader').load_theme

-- load & customize/edit themes
local function theme(colorscheme)
    local ok, theme = pcall(load_theme, colorscheme:gsub('-', '_'))
    if not ok then
        ok, theme = pcall(load_theme, colorscheme)
        if not ok then
            theme = load_theme('auto')
        end
    end

    -- make 'a' & 'z' sections always bold
    for _, mode in pairs(theme) do
        mode.a.gui = 'bold'
    end

    -- iceberg
    if colorscheme == 'iceberg' then
        if vim.o.background ~= 'light' then
            theme.normal.a.bg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name('Normal'), 'fg#')
            theme.normal.b.fg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name('Normal'), 'fg#')
            theme.insert.b.fg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name('Function'), 'fg#')
            theme.replace.b.fg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name('Constant'), 'fg#')
            theme.visual.b.fg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name('Special'), 'fg#')
        end
        theme.normal.c.fg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name('Comment'), 'fg#')
        theme.replace.a.bg = vim.fn.synIDattr(vim.api.nvim_get_hl_id_by_name('Constant'), 'fg#')
    end

    return theme
end

local opts = {
    options = {
        always_divide_middle = true,
        component_separators = '',
        disabled_filetypes = {
            statusline = {},
            winbar = {}
        },
        globalstatus = false,
        icons_enabled = true,
        ignore_focus = {},
        padding = 2,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
        section_separators = '',
        theme = function()
            if vim.g.colors_name then
                return theme(vim.g.colors_name)
            end
            return theme('auto')
        end
    },
    sections = {
        lualine_a = {
            {
                'mode',
                padding = 1,
                separator = { left = '', right = '' }
            }
        },
        lualine_b = {
            {
                'branch',
                padding = { left = 2, right = 1 },
                separator = { left = '', right = '' }
            }
        },
        lualine_c = {
            { 'filename' }
        },
        lualine_x = {
            { 'filetype', colored = false }
        },
        lualine_y = {},
        lualine_z = {
            {
                '%l:%c',
                padding = 1,
                separator = { left = '', right = '' }
            }
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            { 'filename' }
        },
        lualine_x = {
            { 'filetype', colored = false }
        },
        lualine_y = {},
        lualine_z = {
            { '%l:%c' }
        }
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}

require('lualine').setup(opts)
