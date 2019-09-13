initdd5()
{
    if [ $DD5SESSIONINPROGRESS ]
    then
        echo "A session is already in progress"
        return
    fi
    echo 'Initialising Dungeons & Dragons 5 session'

    # important constants right there
    export MAX_HP=62
    export MAX_SP=74
    export DD5HISTFILE=~/.dd5histfile
    export DD5SESSIONINPROGRESS=true

    export HP=$MAX_HP
    export SP=$MAX_SP
    echo "Hit Points are set to $HP"
    echo "Sorcery Points are set to $SP"
    echo "--- Start of session ---">>$DD5HISTFILE
    echo "Hit Points: $HP">>$DD5HISTFILE
    echo "Sorcery Points: $SP">>$DD5HISTFILE
    export OLDPROMPT=$PROMPT
    export PROMPT="(HP:$HP)(SP:$SP)$PROMPT"
    touch $DD5HISTFILE

    _refresh_prompt()
    {
        export PROMPT=$OLDPROMPT
        export PROMPT="(HP:$HP)(SP:$SP)$PROMPT"
    }

    cast()
    {
        # First argument ($1) is the cost
        # Second argument ($2) is the name of the spell
        if [ -z $1 -a -z $2 ]
        then
            echo "tf you casting?"
            return
        fi
        echo "(-$1 SP)Cast $2">>$DD5HISTFILE
        SP=$(($SP - $1))
        _refresh_prompt
    }

    ouch()
    {
        if [ -z $1 ]
        then
            echo "how much did it hurt?"
            return
        fi
        echo "-$1 HP ($2)">>$DD5HISTFILE
        HP=$(($HP - $1))
        _refresh_prompt
    }

    long_rest()
    {
        SP=$MAX_SP
        HP=$MAX_HP
        echo "- Long rest -">>$DD5HISTFILE
        _refresh_prompt
    }

    zalgo()
    {
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

    exitdd5()
    {
        export PROMPT=$OLDPROMPT
        echo "Hit Points: $HP">>$DD5HISTFILE
        echo "Sorcery Points: $SP">>$DD5HISTFILE
        echo "--- End of session ---">>$DD5HISTFILE
        unset DD5HISTFILE
        unset DD5SESSIONINPROGRESS
        unset -f _refresh_prompt
        unset MAX_HP
        unset MAX_SP
        unset HP
        unset SP
        unset -f zalgo
        unset -f ouch
        unset -f cast
        unset -f long_rest
        unset OLDPROMPT
        echo 'Ending Dungeons & Dragons 5 session'
    }
}
