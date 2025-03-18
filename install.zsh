# zsh config install script

# .vimrc
echo "Installing .vimrc file"
# Testing if file already exists
if [ -e ~/.vimrc ]
then
    echo "~/.vimrc already exists, do you want to remove it?"
    select yn in "Yes" "No"
    do
        case $yn in
            Yes ) rm ~/.vimrc; break;;
            No ) break;;
        esac
    done
fi
echo "ln -s'ing .vimrc"
ln -s $PWD/.vimrc ~/.vimrc

echo "Will you use nvim on this system?"
select yn in "Yes" "No"
do
    case $yn in
        Yes ) mkdir -p ~/.config/nvim;ln -s ~/.config/nvim/init.vim ~/.vimrc;break;;
        No ) break;;
    esac
done

# Creating symlink from downloads to Downloads

if [ -d ~/Downloads ]
then
    echo "Create symlink to Downloads?"
    select yn in "Yes" "No";
    do
        case $yn in
            Yes ) ln -s ~/Downloads ~/downloads; break;;
            No ) break;;
        esac
    done
fi

# Installing .zshrc

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
