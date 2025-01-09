# ====================== ORIG =================================

# #
# # ~/.bashrc
# #

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

WHITE='\[\033[0m\]'
BLACK='\[\033[1;30m\]'
RED='\[\033[1;31m\]'
GREEN='\[\033[1;32m\]'
YELLOW='\[\033[0;33m\]'
PURPLE='\[\033[1;34m\]'
PINK='\[\033[0;35m\]'
BLUE='\[\033[0;36m\]'
GRAY='\[\033[0;37m\]'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1="\n ${GREEN}\u@\h${WHITE}:${BLUE}\w${WHITE} ${YELLOW}\$(parse_git_branch)\n ${WHITE}\$ "
# PS1="\n \[${GREEN}\]\u@\h\[${WHITE}\]:\\[${BLUE}\]\w\[${WHITE}\] \[${YELLOW}\]\$(parse_git_branch)\n \[${WHITE}\]\$ "
# PS1='[\u@\h \W]\$ '

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH
