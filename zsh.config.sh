# Prompt
fpath=(~/trucy_config/fpath $fpath)
autoload -Uz promptinit
promptinit
#prompt cyber
prompt pride
# vim binding
bindkey -v

# History
HISTFILE=~/.zshist
SAVEHIST=10000
HISTSIZE=10000

# Options

# Fuck beeps
setopt no_beep

# History
setopt append_history
setopt INC_APPEND_HISTORY

# Always prevent before removing * files
unsetopt rm_star_silent

# ZSH Completion file

## Enable Completion
autoload -U compinit
compinit

## Sexy Completion - Navigable
zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no result for : %d%b'
zstyle ':completion:*' menu select=2
zstyle ':Completion:*' select-prompt %SScrolling active: current selection at %p%s

## Smart Completion - Ignore lines
zstyle ':completion:*:rm:*'  ignore-line yes
zstyle ':completion:*:mv:*'  ignore-line yes
zstyle ':completion:*:cp:*'  ignore-line yes
