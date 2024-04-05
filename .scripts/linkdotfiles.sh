#!/bin/sh
stow_opt='--restow'
force=0

while getopts 'dDfF' opt; do
    case "$opt" in
        \?) exit 1 ;;
        [dD]) stow_opt='--delete' ;;
        [fF]) force=1 ;;
    esac
done

dotfiles_dir="$(cd "$(dirname "$(readlink -f "$0")")" && git rev-parse --show-toplevel)"
link_path="$(readlink "$0")"
cd "$(dirname "$0")" || exit 1
while [ "$(git rev-parse --show-toplevel 2>/dev/null)" != "$dotfiles_dir" ]; do
    cd "$(dirname "$link_path")" || exit 1
    link_path="$(readlink "$(basename "$link_path")")"
done
stow_dir="$(echo "$dotfiles_dir/$(git rev-parse --show-prefix | sed -E 's/^(([A-Z][^\/]*\/)*).*$/\1/')" | sed 's/\/$//')"

if [ "$force" = 1 ]; then
    cd "$stow_dir" || exit 1
    force_ignore_regex=''
    if [ -f .stow-local-ignore ]; then
        force_ignore="$(sed -E 's/(.*)(^| )#.*$/\1/;s/((^|[^\\])(\\.)*)\\$/\1/;/^\s*$/d;s/^\s+|\s+$//' .stow-local-ignore)"
        force_ignore_regex="$(echo "$force_ignore" | sed -E 's/^\^|\$$//g;s/^\/?/\//;s/^/.*/;s/$/($|\/).*/' | sed ':a;N;s/\n/|/;ba')"
    fi
    force_delete="$(find . -depth -mindepth 1 -regextype posix-extended \! -regex "$force_ignore_regex" \! -type d -printf '%P\n')"
    cd ~ || exit 1
    IFS="$(printf '\n\t')"
    for f in $force_delete; do
        if [ -L "$f" ]; then
            [ ! "$(realpath --no-symlinks "$(dirname "$(realpath --no-symlinks "$f")")/$(readlink "$f")")" = "$stow_dir/$f" ] && rm -- "$f"
        else
            rm -rf -- "$f"
        fi
    done
fi

stow $stow_opt --no-folding --verbose=2 --dir="$stow_dir" --target="$HOME" .
