# Aliases

# Common aliases (I guess)
alias ls='ls --color=auto'
alias ll='ls --group-directories-first --human-readable --time-style=long-iso -l'
alias lla='ll -A'

# Colors
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias tree='tree -C'

# Idiot proofing
alias rm='rm --interactive --preserve-root --verbose'
alias mv='mv --interactive'
alias cp='cp --interactive'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias chgrp='chgrp --preserve-root'

alias -g _back='>/dev/null 2>&1 &'

alias calc='noglob _calc'
