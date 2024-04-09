-- neovim config - neovide specific config (config/neovide.lua)

vim.g.neovide_confirm_quit = true
vim.g.neovide_cursor_animate_command_line = false
vim.g.neovide_cursor_animate_in_insert_mode = false
vim.g.neovide_cursor_animation_length = 0.0
vim.g.neovide_cursor_antialiasing = true
vim.g.neovide_cursor_unfocused_outline_width = 0.05
vim.g.neovide_cursor_vfx_mode = ''
vim.g.neovide_fullscreen = false
vim.g.neovide_hide_mouse_when_typing = true
vim.g.neovide_input_use_logo = false
vim.g.neovide_padding_bottom = 0
vim.g.neovide_padding_left = 0
vim.g.neovide_padding_right = 0
vim.g.neovide_padding_top = 0
vim.g.neovide_profiler = false
vim.g.neovide_remember_window_position = true
vim.g.neovide_remember_window_size = true
vim.g.neovide_scale_factor = 1.0
vim.g.neovide_scroll_animation_length = 0.0
vim.g.neovide_transparency = 1.0
vim.g.neovide_underline_automatic_scaling = false
vim.opt.linespace = 0
vim.opt.mousehide = true

-- set font and functions to change font size
local guifont_default_size = 15
local guifont_resize_delta = 1.5
local guifont_font = 'Agave_Nerd_Font_Mono'
local guifont_options = '#e-antialias:#h-slight'
local guifont_size = guifont_size or guifont_default_size

local function guifont_update()
    vim.opt.guifont = string.format('%s:h%d:%s', guifont_font, guifont_size, guifont_options)
end

local function guifont_incsize()
    guifont_size = guifont_size + guifont_resize_delta
    guifont_update()
end

local function guifont_decsize()
    if guifont_resize_delta >= guifont_size then
        return
    end
    guifont_size = guifont_size - guifont_resize_delta
    guifont_update()
end

local function guifont_reset()
    guifont_size = guifont_default_size
    guifont_update()
end

guifont_update()

--- KEYMAPS:

-- make CTRL-SHIFT-V paste like it would in the terminal
vim.keymap.set({'', '!', 't'}, '<C-S-v>', function()
    vim.api.nvim_paste(vim.fn.getreg('+'), '', -1)
end)

-- make CTRL-= and CTRL-+ increase font size
vim.keymap.set({'', '!', 't'}, '<C-=>', function() guifont_incsize() end)
vim.keymap.set({'', '!', 't'}, '<C-+>', function() guifont_incsize() end)

-- make CTRL-- and CTRL-_ decrease font size
vim.keymap.set({'', '!', 't'}, '<C-->', function() guifont_decsize() end)
vim.keymap.set({'', '!', 't'}, '<C-_>', function() guifont_decsize() end)

-- make CTRL-0 reset font size
vim.keymap.set({'', '!', 't'}, '<C-0>', function() guifont_reset() end)

-- make F11 toggle fullscreen mode
vim.keymap.set({'', '!', 't'}, '<F11>', function()
    if vim.g.neovide_fullscreen == false then
        vim.g.neovide_fullscreen = true
    else
        vim.g.neovide_fullscreen = false
    end
end)

---
