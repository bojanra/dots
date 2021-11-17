# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#TERM=xterm-256color

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# MY FANCY PROMPT
# PS1="[\[\e[1;32m\]\t\[\033[0m\]][\[\033[32m\]\w\[\033[0m\]]\n\[\033[1;36m\]\u\[\033[0m\]@\[\e[1;33m\]\h\\[\033[1;33m\]-> \[\033[0m\]"

SEP="║"
SEP2="•"

function parse_git_output {
    path=$(pwd)
    # Don't do git status over networked paths.
    # It kills performance, and the prompt takes forever to return.
    if [[ $path =~ "/net/" ]]; then
        return
    fi
    if [ -f ~/bin/git.awk ]; then
        output=$(git status -sb --porcelain 2> /dev/null | ~/bin/git.awk -v separator=$SEP separator2=$SEP2 2> /dev/null) || return
        echo -e "$output"
    fi
}

# store colors
RESET="\[\033[0m\]"
MAGENTA="\[\033[0;35m\]"
YELLOW="\[\033[01;33m\]"
BLUE="\[\033[00;34m\]"
LIGHT_GRAY="\[\033[0;37m\]"
LIGHT_CYAN="\[\033[1;36m\]"
CYAN="\[\033[0;36m\]"
LIGHT_GREEN="\[\033[1;32m\]"
GREEN="\[\033[00;32m\]"
RED="\[\033[0;31m\]"
VIOLET='\[\033[01;35m\]'
ENDC="\e[m"

PS1="$RESET[$LIGHT_GREEN\t$RESET][$GREEN\w$RESET]\$(parse_git_output)\n$LIGHT_CYAN\u$RESET@$YELLOW\h->$ENDC "

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias l='ls -l -h --color'
    alias lu='l -tur'        #  Sort by/show access time,most recent last.
    # The ubiquitous 'll': directories first, with alphanumeric sorting:
    alias ll="l -v --group-directories-first"
    alias la='ll -A'           #  Show hidden files.
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -lF'

# handy aliases
alias h='history'
alias df='df -h'
alias j='jobs -l'
# alias which='type -a'
# alias ..='cd ..'
alias less='less -i'
# alias duu='du -s * | sort -n'
alias duu='du -mcs * .[!.]* | sort -n'
#alias tree='tree -Csuh'    #  Nice alternative to 'recursive ls' ...
alias c='clear'
alias mgrep="ps aux | grep -v grep | grep"
alias grep="grep --ignore-case --color"

# git alias
alias gs="git status -bs"
alias gd="git difftool -d"
alias ga="git add"
alias gb="git branch -avv"
alias gc="git commit -v"
alias gca="git commit -am"
alias gstashed="git stash list --pretty=format:'%gd: %Cred%h%Creset %Cgreen[%ar]%Creset %s'"
alias gl="git log --graph --oneline --decorate --color --all"
alias gll="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gls="git ls-tree --full-tree -r --name-only HEAD"
alias gclean="git clean -nxd"

# vagrant alias
alias vup="vagrant up"
alias vsu="vagrant suspend"
alias vss="vagrant ssh"
alias vde="vagrant destroy"
alias vpr="vagrant provision"

alias diff='colordiff'
alias path='echo -e ${PATH//:/\\n}'
alias vi=vim
alias root="sudo su -"
alias bigdirs='du --max-depth=1 2> /dev/null | sort -n -r | head -n20'
alias locate='locate -i'

# autochange directory without cd
# - type the directory name to change into
shopt -s autocd

export EDITOR=/usr/bin/vim

# McFly - fly through your shell history
# https://github.com/cantino/mcfly
if [[ -r ~/bin/mcfly.bash ]]; then
  source  ~/bin/mcfly.bash
fi

# icon support for lf  based on nerd font
[ -f ~/.config/lf/icons ] && source ~/.config/lf/icons

