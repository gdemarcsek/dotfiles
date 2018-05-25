#!/bin/bash
#export LC_CTYPE="hu_HU.utf8"

export PATH=/usr/local/bin:$PATH
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

# Clean up prompt command
export PROMPT_COMMAND=

# Aliases
alias more='less'
alias mc='mc --nocolor'
# Docker stuff
alias d='docker'
alias dc="docker-compose"
alias kube="kubectl"

if [[ "x$(which exa)" != "x" ]]; then
    alias ls='exa'
fi

# Ansible
export ANSIBLE_NOCOWS=1

alias gcloud='gcloud-sdk gcloud'
alias gsutil='gcloud-sdk gsutil'
alias bq='gcloud-sdk bq'
 
alias gcloud-set-project='gcloud config set project'
alias gcloud-docker-auth='docker login -e not@val.id -u _token -p "$(gcloud auth print-access-token)"'
alias gcr-login='gcloud-docker-auth gcr.io'
alias gcr-eu-login='gcloud-docker-auth eu.gcr.io'


# Source other .bashrc-s
for file in $(ls ~/.bashrc.d); do
    if [ ! -f "${BASH_SOURCE}.skip/${file}" ]; then
        . ~/.bashrc.d/$file
    fi
done
