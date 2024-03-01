-- neovim config (config/init.lua)

vim.opt.autoindent = true
vim.opt.background = 'dark'
vim.opt.backspace = 'indent,eol,nostop'
vim.opt.breakat = ' 	'
vim.opt.breakindent = false
vim.opt.clipboard = ''
vim.opt.cmdheight = 1
vim.opt.cmdwinheight = 6
vim.opt.colorcolumn = '80'
vim.opt.confirm = true
vim.opt.copyindent = true
vim.opt.cursorcolumn= false
vim.opt.cursorline = true
vim.opt.cursorlineopt = 'both'
vim.opt.emoji = true
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.fixeol = true
vim.opt.foldlevelstart = 99
vim.opt.foldmethod = 'manual'
vim.opt.foldminlines = 0
vim.opt.foldnestmax = 20
vim.opt.guicursor = 'a:block-blinkoff0-blinkon0-blinkwait0,c-ci-cr:block-blinkoff550-blinkon550-blinkwait0'
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.incsearch = true
vim.opt.joinspaces = false
vim.opt.linebreak = true
vim.opt.list = false
vim.opt.listchars = 'eol:↵,nbsp:,space:⋅,tab:→ '
vim.opt.mouse = 'a'
vim.opt.mousemodel = 'popup_setpos'
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.preserveindent = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 2
vim.opt.shiftround = false
vim.opt.shiftwidth = 4
vim.opt.showmatch = true
vim.opt.showtabline = 1
vim.opt.signcolumn = 'auto:1-9'
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.smarttab = true
vim.opt.softtabstop = 0
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.syntax = 'ON'
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.tildeop = true
vim.opt.timeout = false
vim.opt.timeoutlen = 1000
vim.opt.title = true
vim.opt.updatetime = 200
vim.opt.visualbell = false
vim.opt.wildmenu = true
vim.opt.wildmode = 'longest:full,full'
vim.opt.wrap = false
vim.opt.wrapscan = true

-- disable mouse right-click popup-menu
vim.cmd.aunmenu('PopUp')

--- AUTOCOMMANDS:

-- restore blinking terminal cursor
vim.api.nvim_create_autocmd('VimLeave', {
    callback = function()
        vim.opt.guicursor = 'a:block-blinkoff550-blinkon550-blinkwait0'
    end
})

---

--- KEYMAPS:

-- map the leader key
vim.g.mapleader = ' '

-- disable SPACE and BACKSPACE as movement keys
vim.keymap.set({'n', 'o', 'x'}, ' ', '<Nop>')
vim.keymap.set({'n', 'o', 'x'}, '<S-Space>', '<Nop>')
vim.keymap.set({'n', 'o', 'x'}, '<BS>', '<Nop>')
vim.keymap.set({'n', 'o', 'x'}, '<S-BS>', '<Nop>')

-- make J and K move selection up or down
vim.keymap.set('x', 'J', ':m \'>+1<CR>gv=gv')
vim.keymap.set('x', 'K', ':m \'<-2<CR>gv=gv')

-- make n and N open folds to view the searched term
vim.keymap.set({'n', 'o', 'x'}, 'n', 'nzv')
vim.keymap.set({'n', 'o', 'x'}, 'N', 'Nzv')

-- make CTRL-L function as SPACE (mirrors CTRL-H functionality)
vim.keymap.set({'', '!'}, '<C-l>', ' ')
vim.keymap.set({'', '!'}, '<C-S-l>', '<S-Space>')

-- make CTRL-SHIFT-C copy the selection without changing cursor position and also copy to system clipboard
vim.keymap.set('v', '<C-S-c>', '"+ygv<Esc>')

-- make LEADER c and LEADER C also cut to system clipboard
vim.keymap.set('', '<Leader>c', '"+c')
vim.keymap.set('', '<Leader>C', '"+C')

-- make LEADER d and LEADER D also cut to system clipboard
vim.keymap.set('', '<Leader>d', '"+d')
vim.keymap.set('', '<Leader>D', '"+D')

-- make all LEADER `put` commands paste from system clipboard
vim.keymap.set('', '<Leader>p', '"+p')
vim.keymap.set('', '<Leader>P', '"+P')
vim.keymap.set('', '<Leader>gp', '"+gp')
vim.keymap.set('', '<Leader>gP', '"+gP')
vim.keymap.set('', '<Leader>zp', '"+zp')
vim.keymap.set('', '<Leader>zP', '"+zP')
vim.keymap.set('', '<Leader>]p', '"+]p')
vim.keymap.set('', '<Leader>]P', '"+]P')
vim.keymap.set('', '<Leader>[p', '"+[p')
vim.keymap.set('', '<Leader>[P', '"+[P')

-- make LEADER s and LEADER S also cut to system clipboard
vim.keymap.set('', '<Leader>s', '"+s')
vim.keymap.set('', '<Leader>S', '"+S')

-- make LEADER x and LEADER X also cut to system clipboard
vim.keymap.set('', '<Leader>x', '"+x')
vim.keymap.set('', '<Leader>X', '"+X')

-- make all LEADER `yank` commands also copy to system clipboard
vim.keymap.set('', '<Leader>y', '"+y')
vim.keymap.set('', '<Leader>Y', '"+Y')
vim.keymap.set('', '<Leader>zy', '"+zy')

-- make LEADER K X toggle whitespace characters
vim.keymap.set('', '<Leader>kx', function()
    if vim.o.list == false then
        vim.opt.list = true
    else
        vim.opt.list = false
    end
end)

---

-- neovide specific config
if vim.g.neovide then
    require('config.neovide')
end

-- Windows specific config
if vim.loop.os_uname().sysname == 'Windows_NT' then
    if pcall(vim.cmd, 'silent !pwsh.exe -Version') then
        vim.opt.shell = 'pwsh.exe'
    else
        vim.opt.shell = 'powershell.exe'
    end
end

-- WSL specific config
if vim.loop.os_uname().sysname == 'Linux' and string.find(vim.loop.os_uname().release, '[mM]icrosoft') then
    vim.g.clipboard = {
        name = 'WslClipboard',
        copy = {
            ['*'] = '/mnt/c/Windows/System32/clip.exe',
            ['+'] = '/mnt/c/Windows/System32/clip.exe'
        },
        paste = {
            ['*'] = '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
            ['+'] = '/mnt/c/Windows/System32/WindowsPowerShell/v1.0/powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))'
        },
        cache_enabled = 0
    }
end
