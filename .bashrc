# .bashrc

# Source .profile
[ -f ~/.profile ] && . ~/.profile

# If not running interactively, don't continue!
[[ "$-" != *i* ]] && return

# Set bash history settings
HISTCONTROL='erasedups:ignoreboth'
HISTSIZE=

# Set prompt(s)
if [ "$TERM" != 'linux' ]; then
    eval "$(oh-my-posh init bash --config "$XDG_CONFIG_HOME/oh-my-posh.json")"
fi

:
