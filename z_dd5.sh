initdd5()
{
    if [ $DD5SESSIONINPROGRESS ]
    then
        echo "A session is already in progress"
        _refresh_prompt
        return
    fi
    echo 'Initialising Dungeons & Dragons 5 session'

    # important constants right there
    export MAX_HP=68
    export MAX_SP=84
    export DD5HISTFILE=~/.dd5histfile
    export DD5SESSIONINPROGRESS=true
    export DD5MEMOFILE=~/.dd5memofile

    export HP=$MAX_HP
    export SP=$MAX_SP
    echo "--- Start of session ---">>$DD5HISTFILE
    echo "Hit Points: $HP">>$DD5HISTFILE
    echo "Sorcery Points: $SP">>$DD5HISTFILE
    export OLDPROMPT=$PROMPT
    source $DD5MEMOFILE
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
        echo "(-$1 SP) Cast $2">>$DD5HISTFILE
        SP=$(($SP - $1))
        _refresh_prompt
    }

    mana()
    {
        if [ -z $1 -a -z $2 ]
        then
            echo "how much mana?"
            return
        fi
        echo "(+$1 SP) Mana $2">>$DD5HISTFILE
        SP=$(($SP + $1))
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

    heal()
    {
        if [ -z $1 ]
        then
            echo "UwU ?"
            return
        fi
        echo "+$1 HP ($2)">>$DD5HISTFILE
        HP=$(($HP + $1))
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

    dying()
    {
        DYING=$(($DYING + 1))
    }

    exitdd5()
    {
        export PROMPT=$OLDPROMPT
        echo "Hit Points: $HP">>$DD5HISTFILE
        echo "Sorcery Points: $SP">>$DD5HISTFILE
        echo "--- End of session ---">>$DD5HISTFILE
        echo "HP=$HP">$DD5MEMOFILE
        echo "SP=$SP">>$DD5MEMOFILE
        unset DD5MEMOFILE
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
        unset -f mana
        unset -f long_rest
        unset OLDPROMPT
        echo 'Ending Dungeons & Dragons 5 session'
    }
}
