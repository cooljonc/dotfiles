#!/usr/bin/env bash
(return 2>/dev/null) && return
DOTFILES_DIR="$(dirname -- "$(dirname -- "$(readlink -f -- "$0")")")"
stow --no-folding --delete --verbose=2 --dir="$DOTFILES_DIR" --target="$HOME" .
