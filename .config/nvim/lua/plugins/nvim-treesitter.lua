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
        disable = {
            'markdown'
        },

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages.
        additional_vim_regex_highlighting = false
    },

    -- incremental selection
    incremental_selection = {
        enable = false,

        -- list of languages that incremental selection will be disabled for
        disable = {},

        -- keymaps for incremental selection
        keymaps = {
            -- init_selection: in normal mode, start incremental selection
            init_selection = "gnn",

            -- node_incremental: in visual mode, increment to the upper named parent
            node_incremental = "grn",

            -- scope_incremental: in visual mode, increment to the upper scope
            scope_incremental = "grc",

            -- node_decremental: in visual mode, decrement to the previous named node
            node_decremental = "grm"
        }
    },

    -- indentation
    indent = {
        enable = false,

        -- list of languages that indentation will be disabled for
        disable = {}
    },

    -- list of parser names to ignore installing
    ignore_install = {},

    -- install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false
}

require('nvim-treesitter.configs').setup(opts)
