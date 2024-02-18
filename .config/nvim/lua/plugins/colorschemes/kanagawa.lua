-- 'kanagawa' config (plugins/colorschemes/kanagawa.lua)

local opts = {
    background = {
        dark = 'wave',
        light = 'wave'
    },
    colors = {
        palette = {},
        theme = {
            wave = {},
            lotus = {},
            dragon = {},
            all = {
                ui = {
                    bg_gutter = 'none'
                }
            }
        }
    },
    commentStyle = { italic = false },
    compile = false,
    dimInactive = false,
    functionStyle = {},
    keywordStyle = { italic = false },
    overrides = function(colors)
        local theme = colors.theme
        return {
            -- editor
            CursorLine = { bg = theme.ui.bg_p1 },
            CursorLineNr = { fg = theme.syn.keyword, bg = theme.ui.bg_gutter },
            MatchParen = { fg = theme.ui.fg, bg = theme.ui.whitespace, bold = false },
            ModeMsg = { fg = theme.syn.comment, bold = false },
            TabLineFill = { bg = theme.ui.bg_m3 },
            TabLineSel = { bg = theme.ui.bg },
            -- plugins
            IblIndent = { fg = theme.ui.bg_p2 },
            IblScope = { fg = theme.ui.whitespace },
            IblWhitespace = { fg = theme.ui.bg_p2 },
            VirtColumn = { fg = theme.ui.bg_p2 },
            -- syntax
            ["@keyword.operator"] = { fg = theme.syn.operator, bold = false },
            ["@keyword.return"] = { fg = theme.syn.keyword },
            ["@string.escape"] = { fg = theme.syn.special1, bold = false },
            Boolean = { fg = theme.syn.special1, bold = false },
            Special = { fg = theme.syn.keyword }
        }
    end,
    statementStyle = { bold = false },
    terminalColors = true,
    theme = 'wave',
    transparent = false,
    typeStyle = {},
    undercurl = true
}

require('kanagawa').setup(opts)
