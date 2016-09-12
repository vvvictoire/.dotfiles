SHRC='$HOME/.zshrc'

# Use emacs keybinding
bindkey -e

if [ -d ~/config ]
then
    autoload -U promptinit
    promptinit
    for conffile in `ls ~/config/*.conf`
    do
	source $conffile
    done
else
    echo "~/config does not exist."
fi
