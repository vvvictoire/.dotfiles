#man zshmisc
#colours: https://upload.wikimedia.org/wikipedia/commons/1/15/Xterm_256color_chart.svg
autoload -U colors && colors
_set_ps1()
{
    # Foreground colours
    local light_pink="%F{171}"
    local pink="%F{165}"
    local dark_pink="%F{164}"
    local blue="%F{032}"
    local dark_red="%F{124}"
    local green="%F{118}"
    local white="%F{015}"
    local black="%F{000}"

    # Background colours
    local bdark_red="%K{124}"
    local bnice_blue="%K{021}"
    local bblack="%K{000}"

    local reset="%f%k"

    local username="%n"
    local hostname="%M"
    local last_return="%?"
    local pwd="%~"
    local time="%*"
    local hist="%!"

    local history="$bnice_blue$hist"
    local user="$bblack$light_pink$username"
    local at="$pink@"
    local host="$dark_pink$hostname"
    local current_time="$green$time"
    local current_dir="$blue$pwd"
    local exit="%(?.$reset.$bdark_red$white$last_return$reset)"
    local warning_message="Logged on a remote server"

    # Put an alert if on SSH
    if [[ -n $SSH_CONNECTION ]]; then
        local ssh="
$bdark_red$warning_message$reset"
    else
        local ssh=""
    fi

    export PROMPT="$history$user$at$host$current_dir$current_time$exit$ssh"$'\n'
}
_set_ps1

