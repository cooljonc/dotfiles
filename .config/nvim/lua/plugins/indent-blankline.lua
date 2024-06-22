-- 'indent-blankline' config (plugins/indent-blankline.lua)

local function init()
    --- KEYMAPS:

    -- make LEADER K X toggle whitespace characters and indent-blankline
    vim.keymap.set('', '<Leader>kx', function()
        if vim.o.list == false then
            vim.cmd.IBLDisable();
            vim.opt.list = true
        else
            vim.cmd.IBLEnable();
            vim.opt.list = false
        end
    end)

    ---
end

local opts = {
    debounce = 150,
    enabled = true,
    indent = {
        char = '▏',
        highlight = 'IblIndent',
        priority = 1,
        smart_indent_cap = true
    },
    scope = {
        enabled = true,
        highlight = 'IblScope',
        priority = 1024,
        show_end = false,
        show_start = false
    },
    viewport_buffer = { min = 30, max = 500 },
    whitespace = {
        highlight = 'IblWhitespace',
        remove_blankline_trail = true
    }
}

return {
    {
        'lukas-reineke/indent-blankline.nvim',
        init = init,
        config = function()
            require('ibl').setup(opts)
        end
    }
}
