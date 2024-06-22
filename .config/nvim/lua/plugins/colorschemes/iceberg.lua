-- 'iceberg' config (plugins/colorschemes/iceberg.lua)

local function init()
    --- AUTOCOMMANDS:

    -- apply iceberg colorscheme modifications
    vim.api.nvim_create_autocmd('ColorScheme', {
        pattern = 'iceberg',
        callback = function()
            if vim.o.background ~= 'light' then
                vim.cmd([[
                    " editor
                    highlight CurSearch guibg=#e4aa80 guifg=#392313 gui=bold
                    highlight CursorLineNr guibg=none guifg=#cdd1e6
                    highlight DiagnosticSignError guibg=none guifg=#e27878
                    highlight DiagnosticSignHint guibg=none guifg=#6b7089
                    highlight DiagnosticSignInfo guibg=none guifg=#89b8c2
                    highlight DiagnosticSignWarn guibg=none guifg=#e2a478
                    highlight FoldColumn guibg=none guifg=#444b71
                    highlight LineNr guibg=none guifg=#444b71
                    highlight MatchParen guibg=#3e445e guifg=#c6c8d1
                    highlight SignColumn guibg=none guifg=#444b71
                    highlight Whitespace guifg=#3e445e
                    " plugins
                    highlight GitSignsAdd guibg=none guifg=#b4be82
                    highlight GitSignsChange guibg=none guifg=#89b8c2
                    highlight GitSignsDelete guibg=none guifg=#e27878
                    highlight IblIndent guifg=#242940 gui=nocombine
                    highlight IblScope guifg=#3e445e gui=nocombine
                    highlight IblWhitespace guifg=#242940 gui=nocombine
                    highlight VirtColumn guifg=#242940 gui=nocombine
                ]])
            else
                vim.cmd([[
                    " editor
                    highlight CurSearch guibg=#eac6ad guifg=#85512c gui=bold
                    highlight CursorLineNr guibg=none guifg=#576a9e
                    highlight DiagnosticSignError guibg=none guifg=#cc517a
                    highlight DiagnosticSignHint guibg=none guifg=#8389a3
                    highlight DiagnosticSignInfo guibg=none guifg=#3f83a6
                    highlight DiagnosticSignWarn guibg=none guifg=#c57339
                    highlight FoldColumn guibg=none guifg=#9fa7bd
                    highlight LineNr guibg=none guifg=#9fa7bd
                    highlight MatchParen guibg=#bec0c9 guifg=#33374c
                    highlight SignColumn guibg=none guifg=#9fa7bd
                    highlight Whitespace guifg=#bec0c9
                    " plugins
                    highlight GitSignsAdd guibg=none guifg=#668e3d
                    highlight GitSignsChange guibg=none guifg=#3f83a6
                    highlight GitSignsDelete guibg=none guifg=#cc517a
                    highlight IblIndent guifg=#cbcfda gui=nocombine
                    highlight IblScope guifg=#bec0c9 gui=nocombine
                    highlight IblWhitespace guifg=#cbcfda gui=nocombine
                    highlight VirtColumn guifg=#cbcfda gui=nocombine
                ]])
            end
        end
    })

    ---
end

return {
    {
        'cocopon/iceberg.vim',
        init = init
    }
}
