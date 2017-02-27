#!/bin/bash
#export LC_CTYPE="hu_HU.utf8"

#cowsay "Keep It Simple, Stupid"

export PATH=/usr/local/bin:$PATH

cowsay "Simplicity is the ultimate sophistication"

# Clean up prompt command
export PROMPT_COMMAND=

# Golang
if [[ -d $HOME/go ]]; then
  export GOPATH=$HOME/go
  export PATH=$PATH:$GOPATH/bin
  export PATH=$PATH:/usr/local/opt/go/libexec/bin
fi


# Aliases
alias ll='ls -laG'
alias gl='git log'
alias ga='git add'
alias gd='git diff -w'
alias gc='git commit'
alias gr='git reset'
alias gs='git status'
alias gsh='git show'
alias gp='git push'
alias gm='git merge'
alias gco='git checkout'
alias grep='grep --color'
alias ls='ls -G'
alias more='less'
alias fig='docker-compose'
alias mc='mc --nocolor'
alias ll='ls -la'
alias jazzpub='ssh jazz-pub.avatao.com'
# Docker stuff
alias d='docker'

# Ansible
export ANSIBLE_NOCOWS=1

# Groovy
[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && . "$HOME/.gvm/bin/gvm-init.sh"

# Git prompt (bash only)
if [[ -z $ZSH ]]; then
  echo "Setting up git prompt"
  if [ -f "$(brew --prefix bash-git-prompt)/share/gitprompt.sh" ]; then
    GIT_PROMPT_THEME=Default
    source "$(brew --prefix bash-git-prompt)/share/gitprompt.sh"
  fi
fi


if [[ -d $HOME/packer ]]; then
  export PATH="$PATH:~/bin:~/packer"
fi

export SSH_AUTH_SOCK=

# iTerm 2 shell integrations for bash
if [[ -z $ZSH ]]; then
  test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
fi

# Node
if [[ -d $HOME/.nvm ]]; then
  export NVM_DIR="$HOME/.nvm"
  source "$(bew --prefix nvm)/nvm.sh"
fi

# Bash completions
if [[ -z $ZSH ]]; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

# RabbitMQ
export PATH=$PATH:/usr/local/Cellar/rabbitmq/3.6.1/sbin

export PATH=$PATH:~/bin/
export PATH=$PATH:/usr/local/sbin

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_112.jdk/Contents/Home


alias gcloud-sdk='docker run --rm -itv ~/.config/gcloud-sdk:/.config:z google/cloud-sdk'
alias gcloud='gcloud-sdk gcloud'
alias gsutil='gcloud-sdk gsutil'
alias bq='gcloud-sdk bq'
 
alias gcloud-set-project='gcloud config set project'
alias gcloud-docker-auth='docker login -e not@val.id -u _token -p "$(gcloud auth print-access-token)"'
alias gcr-login='gcloud-docker-auth gcr.io'
alias gcr-eu-login='gcloud-docker-auth eu.gcr.io'

alias avatao-up='docker-compose -f docker-compose.yml -f docker-compose.external.yml up'

# Groovy
#THIS MUST BE AT THE END OF THE FILE FOR GVM TO WORK!!!
[[ -s "$HOME/.gvm/bin/gvm-init.sh" ]] && source "$HOME/.gvm/bin/gvm-init.sh"

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
