# zsh config install script

install_file()
{
    echo "Installing $1"
    TARGET=$HOME
    if [ $# -ge 2 ]
    then
        TARGET=$HOME/$2
    fi
    if [ -e $TARGET/$1 ]
    then
        echo "$TARGET/$1 exists, skipping"
    else
        ln --symbolic $PWD/$1 $TARGET/$1
    fi
}

install_file .vimrc
install_file nvim .config
install_file .zshrc
install_file hatsune_miku .icons
install_file .face
