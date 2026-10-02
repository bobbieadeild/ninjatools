#!/usr/bin/env bash

# NINJA Bash Integration

ninja() {
    less "$HOME/.local/share/ninja-cheatsheet.txt"
}

ninjaedit() {
    nano "$HOME/.local/share/ninja-cheatsheet.txt"
}

ninjareadme() {
    local file="$HOME/.local/share/ninja-cheatsheet.txt"
    local line

    line="$(grep -n -m1 '^ *NINJA COMMAND README$' "$file" 2>/dev/null | cut -d: -f1)"

    if [[ -z "$line" ]]; then
        echo "Ninja Command README not found."
        return 1
    fi

    less +"$line" "$file"
}

ninjatheme() {
    "$HOME/termtheme"
}

bashrl() {
    source "$HOME/.bashrc"
}

alias superuser=ninja
alias poweruser=ninja
alias _ninja=ninja
