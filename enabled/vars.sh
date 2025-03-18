# Variables
#if [[ $TERM = xterm ]];
#then export TERM="xterm-256color";
#fi

#[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

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

export BC_ENV_ARGS="-l -q $HOME/.dotfiles/bc.bc"
# History
HISTFILE=~/.zshist
SAVEHIST=10000
HISTSIZE=10000
