#BASICS
HISTFILE=~/.histfile
HISTSIZE=100
SAVEHIST=100
#bindkey -v

zstyle :compinstall filename '/home/jack/.zshrc'

# Tab Completion
zle -C complete-file complete-word _generic
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle ':completion:*:*' original only
zstyle ':completion:complete-file::::' completer _files
zstyle ':completion:*' completer _complete _ignored _files

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

#export PS1="$(print '%{\e[0;32m%}┌─[%n]─%{\e[1;32m%}[%~]\n%{\e[0;32m%}└─%{\e[1;32m%}$%b')"
export PS1="$(print '%F\e[0;32m%/ %f%F\e[1;32m■ %f')" #%F\e[0;32m%/%f%F\e[1;32m∙∙∙%f')" #'%F\e[0;32m%/%f %F\e[1;32m►►►%f')"

export EDITOR='vim'
export BROWSER='firefox'
export GREP_COLOR="1;32"

#ALIASES
alias ls='ls -ohF --group-directories-first --color=always'
alias remc='remind -cc+4 -m /home/jack/.reminders'
alias :q='exit'
alias C^d='exit'
alias grep='grep --color=auto'
alias ping='ping -c 5'
alias dvd='mplayer -channels 6 -af hrtf dvd://'
alias mplayer='mplayer -vo gl2'
#alias pacman='clyde'
#auto open files
alias -s {mpg,mpeg,avi,ogm,wmv,m4v,mp4,mov}='mplayer'
alias -s {mp3,ogg,wav,flac}='mplayer'
alias -s {html,php,com,net,org,gov,be}='firefox'
alias -s txt='vim'
alias -s pdf='zathura'
alias paccorrupt='sudo find /var/cache/pacman/pkg -name '\''*.part.*'\'''
alias pactesting='/usr/bin/pacman -Q $(/usr/bin/pacman -Sql {community-,}testing) 2>/dev/null'

#KEYS
bindkey "\e[8~" end-of-line
bindkey "\e[7~" beginning-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\e\e[C" forward-word
bindkey "\e\e[D" backward-word
bindkey ^r  history-incremental-search-backward
bindkey ^e  history-incremental-search-forward

#COLOURS IN MAN
export LESS_TERMCAP_mb=$'\E[00;32m'
export LESS_TERMCAP_md=$'\E[01;32m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;31m'

#LS SETTINGS
export LS_COLORS='no=00:fi=00:di=01;34:ln=01;36:pi=01;33:so=01;35:do=01;35:bd=00;33;01:cd=00;33;01:or=05;31;01:ex=01;37:*.tar=00;32:*.tgz=00;32:*.arj=00;32:*.taz=00;32:*.lzh=00;32:*.zip=00;32:*.z=01;32:*.Z=01;32:*.gz=01;32:*.bz2=01;32:*.jar=01;32:*.rar=01;32:*.ace=01;32:*.7z=01;32:*.jpg=01;36:*.jpeg=01;36:*.gif=01;36:*.bmp=01;36:*.pbm=01;36:*.pgm=01;36:*.ppm=01;36:*.tga=01;36:*.xbm=01;36:*.xpm=01;36:*.tif=01;36:*.tiff=01;36:*.png=01;36:*.svg=01;36:*.svgz=01;36:*.mng=01;36:*.pcx=01;36:*.nuv=01;36:*.flc=01;36:*.fli=01;36:*.flv=01;36:*.gl=01;36:*.dl=01;36:*.xcf=01;36:*.xwd=01;36:*.yuv=01;36:*.aac=01;33:*.au=01;33:*.flac=01;33:*.mid=01;33:*.midi=01;33:*.mka=01;33:*.mp3=01;33:*.mpc=01;33:*.ogg=01;33:*.ra=01;33:*.wav=01;33:*.mov=01;36:*.mpg=01;36:*.mpeg=01;36:*.m2v=01;36:*.mkv=01;36:*.ogm=01;36:*.mp4=01;36:*.m4v=01;36:*.mp4v=01;36:*.vob=01;36:*.qt=01;36:*.wmv=01;36:*.asf=01;36:*.rm=01;36:*.rmvb=01;36:*.avi=01;36';

#OPTIONS
setopt auto_cd # directory navigation
setopt auto_pushd
setopt pushd_silent
setopt pushd_to_home
setopt chase_links

setopt menu_complete # completion
setopt hash_list_all

setopt extended_glob # globbing
setopt glob_dots
setopt mark_dirs
setopt multibyte
setopt null_glob

setopt hist_ignore_dups # history
setopt hist_no_functions
setopt hist_reduce_blanks
setopt hist_verify
setopt share_history

setopt interactive_comments # miscellanious
setopt correct
