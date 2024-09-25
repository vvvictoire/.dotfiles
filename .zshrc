FILES_TO_SOURCE=(~/.dotfiles/enabled/*)

for file in $FILES_TO_SOURCE
do
    if [ -f $file ]
    then
        source $file
    else
        echo $file does not exist
    fi
done

