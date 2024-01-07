# zsh config install script

# aliases

echo "Installing alias file"

# What flavor are you running?
echo "Running linux or BSD?"
select lb in "Linux" "BSD";
do
    case $lb in
        Linux ) flavor=linux; break;;
        BSD ) flavor=bsd; break;;
    esac
done

echo "ln -s'ing files into enabled"
rm $PWD/enabled/alias.sh
ln -s $PWD/available/$flavor.alias.sh $PWD/enabled/alias.sh

# .vimrc

echo "Installing .vimrc file"

# Testing if file already exists

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

ln -s ~/trucy_config/.zshrc ~/.zshrc

echo "Installing .tmux.conf"
if [ -e ~/.tmux.conf ]
then
    rm ~/.tmux.conf
fi

ln -s ~/trucy_config/.tmux.conf ~/.tmux.conf
