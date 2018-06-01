#!/bin/bash
# Aliases
alias more='less'
alias mc='mc --nocolor'
# Docker stuff
alias d='docker'
alias dc="docker-compose"
alias kube="kubectl"
# autojump
alias j='autojump'

if [[ "x$(which exa)" != "x" ]]; then
    alias ls='exa'
fi

# Source other .bashrc-s
for file in $(ls ~/.bashrc.d); do
    if [ ! -f "${BASH_SOURCE}.skip/${file}" ]; then
        . ~/.bashrc.d/$file
    fi
done
