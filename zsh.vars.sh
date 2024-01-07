# Variables
if [[ $TERM = xterm ]];
then export TERM="xterm-256color";
else;
	export TERM="wsvt25";
fi;

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
