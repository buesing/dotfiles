# Set up the prompt
autoload -Uz promptinit
promptinit
prompt adam1

setopt histignorealldups sharehistory

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# turn off dead keys
setxkbmap -variant "nodeadkeys"

# Use modern completion system
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# ALIASES

alias xdvi='xdvi -s 3 '
alias lsss='perl /home/moriz/dev/perl/lsss.pl'
alias gwhiz='perl /home/moriz/dev/perl/gwhiz.pl'
alias baud='perl /home/moriz/dev/perl/baud.pl'
alias cl='cd && ls && cd'
alias off='sudo shutdown -hP now'
alias ls='ls --color=always'
alias lsa='ls -al --color=always'

alias less="/usr/share/vim/vim73/macros/less.sh"
alias alp="cd /home/moriz/uni/SS12/ALP"

# script for cd then ls
cdl () {
	cd "$1" && ls
}

# script mkdir then cd then ls
mkd () {
	mkdir "$1" && cd "$1" && ls
}

#alias cd="cdl"
#alias mkdir="mkd"
alias python="python3"
alias data="cd /media/data"
alias bsdgames="cat ~/.bsdgames"
alias mud="telnet www.ateraan.com 4002"
alias showp="sudo dpkg --get-selections"
alias m="cd /home/moriz/dev/python/mbc/"
alias cortex="/home/moriz/dl/cortex/cortex"
alias r="xrdb ~/.Xresources"
alias startx='startx &> ~/.xlog'

xset r rate 200 30
bindkey -M viins 'jj' vi-cmd-mode

# add command not found thingy
source /etc/zsh_command_not_found
