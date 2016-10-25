# Use ssh with merged config. Allows for combining work / personal configs
alias ssh='cat ~/.ssh/conf.d/* > ~/.ssh/config; ssh'

alias sshconfig='cat ~/.ssh/conf.d/* > ~/.ssh/config'
