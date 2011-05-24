#PS1='\[\033[00;32m\]\u\[\033[00m\]@\[\033[00;32m\]\w\[\033[00;34m\]\n\[\033[00;34m\]└─\[\033[01;34m\]\$\[\033[00m\] '
PS1='\[\e[0;32m\]\u\[\e[m\]@\[\e[0;32m\]\h \[\e[1;32m\]\w\[\e[m\] '
export PATH="$PATH:/home/jack/bin"

#ALIASES
alias ls='ls -ohF --group-directories-first --color=always'
alias remc='remind -cc+4 -m /home/jack/.reminders'
alias :q='exit'
alias grep='grep --color=auto'
alias ping='ping -c 3'
alias dvd='mplayer -channels 6 -af hrtf dvd://'
alias copy='rsync -aP'
#COLOURS IN MAN
export LESS_TERMCAP_mb=$'\E[00;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;31m'

if [ -n "$DISPLAY" ]; then
	BROWSER=luakit
else
	BROWSER=w3m
fi
