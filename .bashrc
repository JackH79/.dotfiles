PS1='\[\033[00;34m\]┌─[\u]─\[\033[01;34m\][\W]\[\033[00;34m\]\n\[\033[00;34m\]└─\[\033[01;34m\]\$\[\033[00m\] '

#ALIASES
alias ls='ls -ohF --group-directories-first --color=always'
alias remc='remind -cc+4 -m /home/jack/.reminders'
alias :q='exit'

#COLOURS IN MAN
export LESS_TERMCAP_mb=$'\E[00;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;31m'
