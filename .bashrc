# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

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

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -SAhrl'
alias la='ls -Al'
alias l='ls -CF'
alias x='exit'
alias s='git fetch && git status'

alias yy='xclip -i -selection clipboard'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

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
export PATH="/home/tossu/.local/bin:/home/tossu/.local/bin:/home/tossu/.local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"

# testing :3 :D yay
export COOL_TEST_VALUE=whatever
export PATH=$PATH:/usr/local/go/bin
. "$HOME/.cargo/env"

alias jonkler='cd /home/tossu && ./play_balatro.sh'

alias m='cd /media/tossu/ssd/Music'
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Welcome message

custom_colors=(
	'\e[38;2;255;44;109m'
	'\e[38;2;25;249;216m'
	'\e[38;2;69;169;249m'
	'\e[38;2;255;117;181m'
	'\e[38;2;176;132;235m'
)

custom_colors_dim=(
	'\e[38;2;128;22;55m'
	'\e[38;2;13;125;108m'
	'\e[38;2;35;85;125m'
	'\e[38;2;128;59;91m'
	'\e[38;2;88;66;118m'
)

color_reset='\e[0m'

alias setrandomcolor='size=${#custom_colors[@]};
index=$(($RANDOM % $size));
export BASH_COLOR=${custom_colors[$index]};
export BASH_COLOR_DIM=${custom_colors_dim[$index]};
export PS1="\[${BASH_COLOR}\][\u@\h \[${BASH_COLOR_DIM}\]\w\[${BASH_COLOR}\]]\[\e[0m\]   "'

alias welcome='setrandomcolor;
clear && echo -e "${BASH_COLOR}
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⠄⠀⠀⠀⣠⡶⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⣠⢤⠀⢤⠹⡌⠃⠀⠂⠀⠀⠀⠀⠀⠀⣠⠃⠘⣇⠀⠀⠁⠈⠚⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠳⠼⠃⠢⠦⠙⠙⠀⠀⠀⠀⠀⢀⣤⠖⡧⠐⠚⠙⠳⠤⢀⢀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⢠⣄⣄⡀⠀⠀⠀⠀⠀⠈⠁⠀⠀⠀⠀⢠⣾⠫⠇⠀⠀⠰⠒⠂⠀⠀⠈⠒⣭⣿⡧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⣼⡅⠐⠐⠻⠶⠶⠖⠋⣉⡿⠃⠀⠀⠀⠀⠹⢿⣇⣆⣀⣠⡀⠔⢾⣿⠋⠈⠙⢝⣾⠿⢹⣟⢶⡂⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠙⢧⡀⠀⠄⢠⣆⣌⢸⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⢆⠀⢱⠀⠀⠀⠀⠈⠀⠀⠉⢺⠿⣆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠙⣇⢀⠀⠉⠳⠷⣿⣦⣤⣴⣶⡄⠀⣀⠀⠀⡀⣠⣄⣀⣀⡙⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠉⠘⠓⣀⠤⣤⡀⠀⠀⢀⠀⣀
⠀⠀⠀⡏⠘⣻⣷⠶⠶⣲⣬⣬⣥⣤⠄⣀⣤⠼⠟⠋⠉⠁⠀⠉⠉⠟⠛⠻⢶⣤⡀⠀⠀⠀⡀⢤⣄⠀⠀⠉⠚⠛⠓⠒⠟⠋⠀
⠀⠀⠀⣿⣷⠋⠀⠀⠀⠀⠀⠙⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠛⠢⡀⠀⠙⠙⠊⠠⠲⣢⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠈⣁⡀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠑⠀⠀⠀⠀⠤⠳⠀⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠑⠛⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
\e[0m"'

welcome

