# Aliases

# Common aliases (I guess)
alias ls='ls --classify --color=auto'
alias ll='ls --human-readable -l'
alias lla='ll --all'

# Colors
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Idiot proofing
alias rm='rm --interactive --preserve-root --verbose'
alias mv='mv --interactive'
alias cp='cp --interactive'
alias chmod='chmod --preserve-root'
alias chown='chown --preserve-root'
alias chgrp='chgrp --preserve-root'

alias -g _back='>/dev/null 2>&1 &'
