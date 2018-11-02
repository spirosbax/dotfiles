# if terminal emulator running then start tmux
if [[ $DISPLAY ]]; then
    # If not running interactively, do not do anything
    [[ $- != *i* ]] && return
    [[ -z "$TMUX" ]] && exec tmux
fi

PS1='[\u@\h \W]\$ '

export TERM="gnome-256color"
POWERLINE_BASH_CONTINUATION=1
powerline-daemon -q
POWERLINE_BASH_SELECT=1
# POWERLEVEL9K_MODE='awesome-fontconfig'
POWERLEVEL9K_MODE='awesome-patched'
. /usr/share/powerline/bindings/bash/powerline.sh

export GOPATH=$HOME/workspace/Go
export PATH="$PATH:$GOPATH/bin"
export PATH="$(yarn global bin):$PATH"
export PATH="$PATH:$(gem env gempath)"
export PATH="$PATH:/home/spiros/.gem/ruby/2.5.0/bin"


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases
alias nv='nvim'
alias ls='ls --color=auto'
