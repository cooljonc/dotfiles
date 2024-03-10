# .bashrc

# Source .profile
[ -f ~/.profile ] && . ~/.profile

# If not running interactively, don't continue!
[[ "$-" != *i* ]] && return

# Set bash history settings
HISTCONTROL='ignoreboth'
HISTFILE="$HOME/.bash_history"
HISTFILESIZE=''
HISTSIZE=''

# Set prompt(s)
if [ "$TERM" != 'linux' ]; then
    # Append history to history file after command (with starship)
    starship_precmd_user_func_func() {
        history -a
    }
    starship_precmd_user_func='starship_precmd_user_func_func'
    # Starship prompt
    eval "$(starship init bash)"
else
    # Append history to history file after command (without starship)
    PROMPT_COMMAND='history -a'
fi

:
