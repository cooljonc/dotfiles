#!/bin/sh
(return 2>/dev/null) && return
DOTFILES_DIR="$(dirname -- "$(dirname -- "$(readlink -f -- "$0")")")"
stow --no-folding --delete --dir="$DOTFILES_DIR" --target="$HOME" . 2>/dev/null
