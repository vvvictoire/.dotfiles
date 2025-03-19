# zsh config install script

# .vimrc
echo "Installing .vimrc file"
ln -s $PWD/.vimrc ~/.vimrc

echo "Installing nvim config"
ln -s $PWD/nvim ~/.config/nvim

echo "Installing .zshrc"
if [ -e ~/.zshrc ]
then
    rm ~/.zshrc
fi

ln -s ~/.dotfiles/.zshrc ~/.zshrc

echo "Installing .tmux.conf"
if [ -e ~/.tmux.conf ]
then
    rm ~/.tmux.conf
fi

ln -s ~/.dotfiles/.tmux.conf ~/.tmux.conf
