# ZSH functions

_calc()
{
    print $* | bc -l
}

alias calc='noglob _calc'

roll()
{
    if [ -z $1 ]
    then
        echo "how many sides?"
    fi
    echo $((1 + RANDOM % $1))
}

cleanup()
{
    set +e # Disable exit on non-0
    rm -f *.aux *.fdb_latexmk *.fls *.nav *.snm *.log *.out *.toc
}

reset_audio()
{
    pulseaudio -k && sudo alsa force-reload
}
