-- 'virt-column' config (plugins/virt-column.lua)

local opts = {
    char = '▏',
    enabled = true,
    highlight = 'VirtColumn',
    virtcolumn = ''
}

return {
    {
        'lukas-reineke/virt-column.nvim',
        opts = opts
    }
}
