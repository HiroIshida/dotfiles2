source $HOME/.bash/default.sh
source $HOME/.bash/alias.sh
source $HOME/.jump_alias.sh # created by editjump.py

HISTTIMEFORMAT="%F %T " 

FILE=$HOME/.bash/user_specific.sh
if test -f "$FILE"; then
    source $FILE
fi

cdls()
{
    \cd "$@" && ls
}
alias cd="cdls"

export PATH=$HOME/.local/bin:$PATH
# if [ -d "$HOME/.pyenv" ]; then
#     export PATH="$HOME/.pyenv/bin:$PATH"
#     # NOTE: Almost all tutorials on pyenv is wrong about this setting
#     # see https://github.com/pyenv/pyenv#installation
#     # Specifically, you need to eval $(pyenv init --path)
#     eval "$(pyenv init --path)"
#     eval "$(pyenv init -)"
# fi

export SSH_USER=h-ishida
export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000

if [ -n "$SSH_TTY" ]; then
    export PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
fi

# percol setting
_replace_by_history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | percol --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}

if [[ $- == *i* ]]; then
    bind -x '"\C-r": _replace_by_history'
fi

# fzf setting
vimf() {
    local selected_file=$(fzf --preview 'echo {}' --query "$1" --select-1 --exit-0)
    if [ -n "$selected_file" ]; then
        vim $selected_file
    fi
}

lessf() {
    local selected_file=$(fzf --preview 'echo {}' --query "$1" --select-1 --exit-0)
    if [ -n "$selected_file" ]; then
        less $selected_file
    fi
}

cdf() {
    local selected_dir=$(find . -type d|fzf --preview 'echo {}' --query "$1" --select-1 --exit-0)
    cd $selected_dir
}
