SHRC='$HOME/.zshrc'

# Use emacs keybinding
bindkey -e

if [ -d ~/trucy_config ]
then
    autoload -U promptinit
    promptinit
    for conffile in `ls ~/trucy_config/*.conf`
    do
	source $conffile
    done
else
    echo "~/trucy_config does not exist."
fi
