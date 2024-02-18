# .bash_profile

# Source .bashrc
[ -f ~/.bashrc ] && . ~/.bashrc

# Run x11_login function (linux)
declare -F 'x11_login' >/dev/null && x11_login

:
