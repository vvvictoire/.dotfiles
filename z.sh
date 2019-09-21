# Aliases

# Common aliases (I guess)
alias ls='ls --color=auto'
alias ll='ls --group-directories-first --human-readable --time-style=long-iso -l'
alias lla='ll -A'

# Colors
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias tree='tree -C'

# Idiot proofing
alias rm='rm --interactive --preserve-root --verbose'
alias mv='mv --interactive'
alias cp='cp --interactive'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias chgrp='chgrp --preserve-root'

# Variables

# emacs binding
bindkey -e

# Useful envvars
if [ $(command -v vim) ]
then
    export EDITOR=vim
fi
if [ $(command -v most) ]
then
    export PAGER=most
fi

# History
HISTFILE=~/.zshist
SAVEHIST=1000
HISTSIZE=1000

# Options

# Fuck beeps
setopt no_beep

# History
setopt append_history
setopt INC_APPEND_HISTORY

# Always prevent before removing * files
unsetopt rm_star_silent

# ZSH functions

_calc()
{
    print $* | bc
}

alias calc='noglob _calc'

zalgo()
{
    if [ ! $(command -v python3) ]
    then
        echo "Install python3 first"
        return
    fi
    if [ -z $1 ]
    then
        echo "zalgo what?"
        return
    fi
    ZALGO=$(python3 ~/trucy_config/zalgo.py $1)
    echo $ZALGO
    echo -n $ZALGO| xclip
    unset ZALGO
}


# Random fortune, random cow
if [ $(command -v fortune) -a $(command -v cowsay) ]
then
    fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1)
fi

# ZSH Completion file

## Enable Completion
autoload -U compinit
compinit

## Sexy Completion - Navigable
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no result for : %d%b'
zstyle ':completion:*' menu select=2
zstyle ':Completion:*' select-prompt %SScrolling active: current selection at %p%s

## Smart Completion - Ignore lines
zstyle ':completion:*:rm:*'  ignore-line yes
zstyle ':completion:*:mv:*'  ignore-line yes
zstyle ':completion:*:cp:*'  ignore-line yes
