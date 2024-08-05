
unset -f command_not_found_handle

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]
then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

. "$HOME/.cargo/env"
export PATH="/home/matthew/.local/bin:$PATH"
export PATH="/home/matthew/.local/scripts:$PATH"

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
	for rc in ~/.bashrc.d/*; do
		if [ -f "$rc" ]; then
			. "$rc"
		fi
	done
fi


# BINDS
bind -x '"\C-x\C-r": pet-select'
bind "'\C-f':'tmux-sessionizer\n'"

# source /usr/share/fzf/shell/key-bindings.bash
eval "$(fzf --bash)"
# unset rc


# ALIASES
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias diff='diff --color=auto'
alias tree='tree -C'
alias ping='ping -c'
alias make='make --color'
alias ip='ip -color=auto'


function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    ## If env folder is found then activate the vitualenv
      if [[ -d ./.venv ]] ; then
        source ./.venv/bin/activate
      fi
  else
    ## check the current folder belong to earlier VIRTUAL_ENV folder
    # if yes then do nothing
    # else deactivate
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
      fi
  fi
}


# Define foreground color variables
black='\033[0;30m\]'
red='\033[0;31m\]'
green='\033[0;32m\]'
yellow='\033[0;33m\]'
blue='\033[0;34m\]'
magenta='\033[0;35m\]'
cyan='\033[0;36m\]'
white='\033[0;37m\]'

# Reset color
reset_color='\033[0m'

function cd() {
  builtin cd "$@"

  if [[ -z "$VIRTUAL_ENV" ]] ; then
    ## If env folder is found then activate the vitualenv
      if [[ -d ./.venv ]] ; then
        source ./.venv/bin/activate
      fi
  else
    ## check the current folder belong to earlier VIRTUAL_ENV folder
    # if yes then do nothing
    # else deactivate
      parentdir="$(dirname "$VIRTUAL_ENV")"
      if [[ "$PWD"/ != "$parentdir"/* ]] ; then
        deactivate
      fi
  fi
}



parse_git_branch() {
	echo "$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1 /')"
}

export VIRTUAL_ENV_DISABLE_PROMPT=1
parse_virtualenv() {
    if [ -n "$VIRTUAL_ENV" ]; then
        echo "$(basename "$VIRTUAL_ENV") "
    fi
}

get_username_host() {
    echo "\u@\h"
}

get_working_directory() {
    echo "\w"
}

get_prompt_symbol() {
    if [ $? -eq 0 ]; then
        echo "${white}\$ "  # default color if last command succeeded
    else
        echo "${red}\$ "  # red if last command failed
    fi
}



PS1="╭──(${blue}$(get_username_host)${reset_color} ${yellow}\$(parse_git_branch)${cyan}\$(parse_virtualenv)${magenta}$(get_working_directory)${reset_color})\n╰─$ "

# fixes resizing
shopt -s checkwinsize

# Tab complete in one tab instead of two
set show-all-if-ambiguous on

export MANPAGER="sh -c 'col -bx | bat -l man -p'"
export MANROFFOPT="-c"

function pet-select() {
  BUFFER=$(pet search --query "$READLINE_LINE")
  READLINE_LINE=$BUFFER
  READLINE_POINT=${#BUFFER}
}
if [ -z "$TMUX" ]; then
  neofetch
fi
