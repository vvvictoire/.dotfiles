FILES_TO_SOURCE=(~/trucy_config/enabled/*)

for file in $FILES_TO_SOURCE
do
    if [ -f $file ]
    then
        source $file
    else
        echo $file does not exist
    fi
done

