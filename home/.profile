# prompt
export PS1="[\w] "

# colors
alias ls='ls -G --color'
alias grep='grep --colour'

# history
export HISTCONTROL=ignoredups:erasedups
export HISTFILESIZE=2000
export HISTSIZE=2000

# set locale
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8

# golang setup
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# vi mode
set -o vi
