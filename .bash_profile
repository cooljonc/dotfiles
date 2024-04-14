# .bash_profile

# Source .bashrc
[ -f ~/.bashrc ] && . ~/.bashrc

# Run x11_login function (linux)
if declare -F 'x11_login' >/dev/null; then
    x11_login
fi
