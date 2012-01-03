PS1='\[\e[0;34m\]\D{%I:%M%P}>>\[\e[1;34m\]\w\[\e[m\] '

### ADD USER'S BIN PATH TO ENVIRONMENT
PATH="${PATH}:$HOME/.bin"

### USE DIRCOLOURS IN LS
eval $( dircolors -b $HOME/.bin/LS_COLORS )

### ALIASES
alias ls='ls -ohF --group-directories-first --color=always'
alias grep='grep --color=auto'
alias sleep='sudo pm-suspend'
alias dvd='mplayer -channels 6 -af hrtf /dev/sr0'
alias copy='rsync -aP'
alias rem='remind /home/jack/.reminders'
alias remc='remind -m -cuc+2 /home/jack/.reminders'
alias aw='wiki-search'
alias :q='exit'
alias m='udisks --mount'
alias um='udisks --unmount'

### COLOURS IN MAN
export LESS_TERMCAP_mb=$'\E[00;34m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'

### Browsers
if [ -n "$DISPLAY" ]; then
   BROWSER=opera
else
   BROWSER=links
fi
