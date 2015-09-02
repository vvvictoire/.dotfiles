SHRC='$HOME/.zshrc'

# Use emacs keybinding
bindkey -e

if [ -d ~/.zsh.d ]
then
    autoload -U promptinit
    promptinit
    for conffile in `ls ~/.zsh.d/*.conf`
    do
	source $conffile
    done
else
    echo "~/.zsh.d does not exist."
fi