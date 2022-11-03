# .bash_profile

# Source .profile
[ -f ~/.profile ] && . ~/.profile

# If login on first virtual terminal (tty1), start X11 display server
#if [ "$(fgconsole 2>/dev/null || echo '-1')" = '1' ]; then
#	pgrep -x 'Xorg' >/dev/null || startx "$XINITRC" &>/dev/null
#fi

# Source .bashrc
[ -f ~/.bashrc ] && . ~/.bashrc
