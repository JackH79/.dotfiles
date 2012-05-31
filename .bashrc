# ~/.bashrc
#
# JackH79
# May 2012

### PROPMPT
PS1='\[\e[1;32m\]\D{%I:%M%P}\[\e[1;34m\]>>\w\[\e[m\] '
PS2='\[\e[1;33m\]contd.\[\e[1;34m\]>\[\e[m\] '

### SET USER BIN PATH
PATH="${PATH}:$HOME/.bin"

### SET DIRCOLORS
eval $( dircolors -b $HOME/.bin/LS_COLORS )

### SET TERMNAME
if [[ "$TERM" == 'rxvt-256color' ]] || [[ "$TERM" == 'xterm' ]]; then
	export TERM=xterm
else
	export TERM=linux
fi

### BASH/SUDO COMPLETION
if [[ -f /etc/bash_completion ]]; then
	. /etc/bash_completion
	which sudo &>/dev/null && complete -cf sudo
fi

### ALIASES
alias ls='ls -ohF --group-directories-first --color=always'
alias grep='grep --color=auto'
alias sleep='sudo pm-suspend'
alias dvd='mplayer -channels 6 -af hrtf /dev/sr0'
alias copy='rsync -aP'
#alias todo='remind /home/jack/.reminders'
alias rem='remind /home/jack/.reminders'
alias remc='remind -m -cuc+2 /home/jack/.reminders'
alias awiki='wiki-search'
alias :q='exit'
alias m='udisks --mount'
alias m1='udisks --mount /dev/sdb1'
alias m2='udisks --mount /dev/sdc1'
alias m3='udisks --mount /dev/sdd1'
alias um='udisks --unmount'
alias um1='udisks --unmount /dev/sdb1'
alias um2='udisks --unmount /dev/sdc1'
alias um3='udisks --unmount /dev/sdd1'

### COLOURS IN MAN
export LESS_TERMCAP_mb=$'\E[00;34m'
export LESS_TERMCAP_md=$'\E[01;34m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;36m'

### BROWSERS
if [ -n "$DISPLAY" ]; then
   BROWSER=firefox
else
   BROWSER=links
fi
