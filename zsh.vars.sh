# Variables
if [[ $TERM = xterm ]];
then export TERM="xterm-256color";
fi

[ -n "$XTERM_VERSION" ] && transset-df --id "$WINDOWID" >/dev/null

# Useful envvars
if [ $(command -v nvim) ]
then
    export EDITOR=nvim
fi
if [ $(command -v most) ]
then
    export PAGER=most
fi

# History
HISTFILE=~/.zshist
SAVEHIST=10000
HISTSIZE=10000
