# Prompt
fpath=(~/trucy_config/fpath $fpath)
autoload -Uz promptinit
promptinit
prompt cyber

# Aliases

# Common aliases (I guess)
alias ls='ls -F'
alias ll='ls -h -l -T'
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

alias -g _back='>/dev/null 2>&1 &'

# Variables
if [[ $TERM = xterm ]];
then export TERM="xterm-256color";
else;
	export TERM="wsvt25";
fi;

# vim binding
bindkey -v

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
SAVEHIST=10000
HISTSIZE=10000

# Options

# Fuck beeps
setopt no_beep

# History
setopt append_history
setopt INC_APPEND_HISTORY

# Always prevent before removing * files
unsetopt rm_star_silent

# Exit on non-0
#set -e

# ZSH functions

_calc()
{
    print $* | bc -l
}

alias calc='noglob _calc'

roll()
{
    if [ -z $1 ]
    then
        echo "how many sides?"
    fi
    echo $((1 + RANDOM % $1))
}

cleanup()
{
    set +e # Disable exit on non-0
    rm -f *.aux *.fdb_latexmk *.fls *.nav *.snm *.log *.out *.toc
}

reset_audio()
{
    pulseaudio -k && sudo alsa force-reload
}

# Random fortune, random cow
#if [ -n SSH_CONNECTION -a $(command -v fortune) -a $(command -v cowsay) ]
#then
#    fortune | cowsay -f $(ls /usr/share/cowsay/cows/ | shuf -n1)
#fi

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
