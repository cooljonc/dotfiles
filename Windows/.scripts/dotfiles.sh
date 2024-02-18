#!/bin/sh
dotfiles_dir="$(cd "$(dirname "$(readlink -f "$0")")" && git rev-parse --show-toplevel)"
git --git-dir="$dotfiles_dir/.git" --work-tree="$dotfiles_dir" "$@"
