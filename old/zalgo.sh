zalgo()
{
    if [ ! $(command -v python3) ]
    then
        echo "Install python3 first"
        return
    fi
    if [ -z $1 ]
    then
        echo "zalgo what?"
        return
    fi
    ZALGO=$(python3 ~/trucy_config/zalgo.py $1)
    echo $ZALGO
    echo -n $ZALGO| xclip
    unset ZALGO
}