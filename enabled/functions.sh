# ZSH functions
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

function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS2
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select
