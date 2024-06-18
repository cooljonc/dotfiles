-- neovim config - neovide specific config (config/neovide.lua)

vim.g.neovide_cursor_animation_length = 0.0
vim.g.neovide_cursor_unfocused_outline_width = 0.05
vim.g.neovide_fullscreen = false
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_left = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_top = 0
vim.g.neovide_remember_window_size = true
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_scroll_animation_length = 0.0
vim.g.neovide_text_gamma = 1.1
vim.g.neovide_text_contrast = 0.1
vim.g.neovide_transparency = 1.0
vim.opt.guifont = 'Agave_Nerd_Font_Mono:h15:#e-antialias:#h-slight'
vim.opt.linespace = 0
vim.opt.mousehide = true

-- set functions to change gui scaling
local scale_resize_delta = 0.1

local function gui_incscale()
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + scale_resize_delta
    vim.cmd.mode()
end

local function gui_decscale()
    if vim.g.neovide_scale_factor <= scale_resize_delta + 0.01 then
        return
    end
    vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - scale_resize_delta
    vim.cmd.mode()
end

local function gui_resetscale()
    vim.g.neovide_scale_factor = 1.0
    vim.cmd.mode()
end

--- KEYMAPS:

-- make CTRL-SHIFT-V paste like it would in the terminal
vim.keymap.set({'', '!', 't'}, '<C-S-v>', function()
    vim.api.nvim_paste(vim.fn.getreg('+'), '', -1)
end)

-- make CTRL-= and CTRL-+ increase font size
vim.keymap.set({'', '!', 't'}, '<C-=>', gui_incscale)
vim.keymap.set({'', '!', 't'}, '<C-+>', gui_incscale)

-- make CTRL-- and CTRL-_ decrease font size
vim.keymap.set({'', '!', 't'}, '<C-->', gui_decscale)
vim.keymap.set({'', '!', 't'}, '<C-_>', gui_decscale)

-- make CTRL-0 reset font size
vim.keymap.set({'', '!', 't'}, '<C-0>', gui_resetscale)

-- make F11 toggle fullscreen mode
vim.keymap.set({'', '!', 't'}, '<F11>', function()
    if vim.g.neovide_fullscreen == false then
        vim.g.neovide_fullscreen = true
    else
        vim.g.neovide_fullscreen = false
    end
end)

---
