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

# Set bash history settings
HISTCONTROL=""
HISTFILE="$HOME/.local/share/bash_history"
HISTFILESIZE=""
HISTSIZE=""

# Set prompt(s)
PS1='[\u@\h \W]\$ '
PS2='> '
if [ "$TERM" != 'linux' ]; then
	eval "$(starship init bash)"
fi

# Set tabsize
tabs -4

# Cool neofetch or something :)
#if [ "$TERM" != 'linux' ]; then
#	neofetch
#fi
