-- 'nvim-treesitter' config (plugins/nvim-treesitter.lua)

local opts = {
    -- automatically install missing parsers when entering buffer
    auto_install = false,

    -- list of parser names (or 'all') to ensure is installed
    ensure_installed = {
        'bash',
        'lua'
    },

    -- highlighting
    highlight = {
        enable = true,

        -- list of languages that highlighting will be disabled for
        disable = {},

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages.
        additional_vim_regex_highlighting = false
    },

    -- indentation
    indent = {
        enable = true
    },

    -- list of parser names to ignore installing
    ignore_install = {},

    -- install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false
}

require('nvim-treesitter.configs').setup(opts)
