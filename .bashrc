#!/bin/bash
#export LC_CTYPE="hu_HU.utf8"

export PATH=/usr/local/bin:$PATH

# Clean up prompt command
export PROMPT_COMMAND=


# Aliases
alias more='less'
alias mc='mc --nocolor'
# Docker stuff
alias d='docker'
alias dc="docker-compose"
alias kube="kubectl"

# Ansible
export ANSIBLE_NOCOWS=1

alias gcloud='gcloud-sdk gcloud'
alias gsutil='gcloud-sdk gsutil'
alias bq='gcloud-sdk bq'
 
alias gcloud-set-project='gcloud config set project'
alias gcloud-docker-auth='docker login -e not@val.id -u _token -p "$(gcloud auth print-access-token)"'
alias gcr-login='gcloud-docker-auth gcr.io'
alias gcr-eu-login='gcloud-docker-auth eu.gcr.io'

