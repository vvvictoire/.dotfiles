#!/bin/zsh

# Testing if files already exists

if [ -e ~/.zshrc ]
then
    echo "~/.zshrc already exists, do you want to remove it?"
    select yn in "Yes" "No";
    do
        case $yn in
            Yes ) rm ~/.zshrc; break;;
            No ) break;;
        esac
    done
fi

if [ -e ~/.vimrc ]
then
    echo "~/.vimrc already exists, do you want to remove it?"
    select yn in "Yes" "No";
    do
        case $yn in
            Yes ) rm ~/.vimrc; break;;
            No ) break;;
        esac
    done
fi


ln -s ~/trucy_config/.zshrc ~/.zshrc
ln -s ~/trucy_config/.vimrc ~/.vimrc
ln -s ~/trucy_config/.tmux.conf ~/.tmux.conf
