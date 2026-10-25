#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias grep='grep --color=auto'
#PS1='[\u@\h \W]\$ '

# Custom bash prompt via kirsle.net/wizards/ps1.html
export PS1='\[\e[1;38;2;255;122;198m\]\u\[\e[38;2;172;171;242m\]@\h \[\e[38;2;199;146;234m\]\W \[\e[38;2;255;122;198m\]❯\[\e[0m\] '
export EDITOR=nano
[[ $- == *i* ]] && source /usr/share/blesh/ble.sh --noattach
[[ ! ${BLE_VERSION-} ]] || ble-attach

# the moon/dove art is 44 columns and the info text needs ~76, so drop the art in narrower windows
fastfetch() {
    local cols=$(tput cols)
    if (( cols < 80 )); then
        command fastfetch --logo none "$@"
    elif (( cols < 120 )); then
        command fastfetch -c ~/.config/fastfetch/compact.jsonc "$@"
    else
        command fastfetch "$@"
    fi
}

_fastfetch_done=0
_fastfetch_once() {
    if [[ $_fastfetch_done == 0 ]]; then
        _fastfetch_done=1
        if [[ -n $WEZTERM_PANE ]]; then
            clear
            fastfetch
        fi
    fi
}
PROMPT_COMMAND="_fastfetch_once"
