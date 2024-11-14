# Variables
if [[ $TERM = xterm ]];
then export TERM="xterm-256color";
fi

[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

# Useful envvars
if [ $(command -v nvim) ]
then
    export EDITOR=nvim
elif [ $(command -v vim) ]
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

export BC_ENV_ARGS="-l"

typeset -U fpath
my_functions=$HOME/.dotfiles/fpath
if [[ -z ${fpath[(r)$my_functions]} ]] ; then
    fpath=($my_functions $fpath)
    autoload -Uz ${my_functions}/*(:t)
fi
