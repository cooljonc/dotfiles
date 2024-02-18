# .profile
# Sets and/or modifies shell environment

# Source os specific shell functions
[ -f ~/.linuxrc ] && . ~/.linuxrc
[ -f ~/.androidrc ] && . ~/.androidrc
[ -f ~/.windowsrc ] && . ~/.windowsrc
[ -f ~/.wslrc ] && . ~/.wslrc

# Source .envvars
[ -f ~/.envvars ] && . ~/.envvars

# If not running interactively, don't continue!
case "$-" in
    *i*) ;;
    *) return ;;
esac

# Source .aliases
[ -f ~/.aliases ] && . ~/.aliases

# Set tabsize
tabs -4

# Set prompt(s)
PS1='[\u@\h \W]\$ '
PS2='> '

:
