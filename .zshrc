FILES_TO_SOURCE=(
~/trucy_config/z.sh
~/trucy_config/z_dd5.sh
/usr/share/autojump/autojump.sh
)

for file in $FILES_TO_SOURCE
do
    if [ -f $file ]
    then
        source $file
    else
        echo $file does not exist
    fi
done

