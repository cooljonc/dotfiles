-- 'virt-column' config (plugins/virt-column.lua)

local opts = {
    char = '▏',
    enabled = true,
    highlight = 'VirtColumn',
    virtcolumn = ''
}

require('virt-column').setup(opts)
