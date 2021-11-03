source $HOME/.bash/default.sh
source $HOME/.bash/alias.sh
source $HOME/.jump_alias.sh # created by editjump.py

cdls()
{
    \cd "$@" && ls
}
alias cd="cdls"

export SSH_USER=h-ishida
