# .bashrc

# If not running interactively, don't do anything!
case "$-" in
	*i*) ;;
	*) (return 2>/dev/null) && return || exit 0 ;;
esac

# Everything else below here! :|

# Source .profile
[ -f ~/.profile ] && . ~/.profile

# Source .aliasrc
[ -f ~/.aliasrc ] && . ~/.aliasrc

# Set bash HISTFILE location
HISTFILE="$HOME/.local/share/bash_history"

# Set prompt(s)
PS1='[\u@\h \W]\$ '
PS2='> '
if [ "$TERM" != 'linux' ]; then
	PS1='\[\e[0m\]█\[\e[0;1;7m\]\w\[\e[0m\]█\[\e[0m\]\[\e[0m\] \[\e[0m\]'
	PS2='\[\e[0m\]█\[\e[0m\]\[\e[0m\] \[\e[0m\]'
fi

# Set tabsize
tabs -4

# Cool neofetch or something :)
if [ "$TERM" != 'linux' ]; then
	neofetch
fi
