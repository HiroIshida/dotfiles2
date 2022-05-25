source $HOME/.bash/default.sh
source $HOME/.bash/alias.sh
source $HOME/.jump_alias.sh # created by editjump.py

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
if [ -d "$HOME/.pyenv" ]; then
    export PATH="$HOME/.pyenv/bin:$PATH"
    # NOTE: Almost all tutorials on pyenv is wrong about this setting
    # see https://github.com/pyenv/pyenv#installation
    # Specifically, you need to eval $(pyenv init --path)
    eval "$(pyenv init --path)"
    eval "$(pyenv init -)"
fi

export SSH_USER=h-ishida

export HISTCONTROL=ignoreboth:erasedups
export HISTSIZE=10000

# percol setting
_replace_by_history() {
    declare l=$(HISTTIMEFORMAT= history | sort -k1,1nr | perl -ne 'BEGIN { my @lines = (); } s/^\s*\d+\s*//; $in=$_; if (!(grep {$in eq $_} @lines)) { push(@lines, $in); print $in; }' | percol --query "$READLINE_LINE")
    READLINE_LINE="$l"
    READLINE_POINT=${#l}
}
bind -x '"\C-r": _replace_by_history'
