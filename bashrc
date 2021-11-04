source $HOME/.bash/default.sh
source $HOME/.bash/alias.sh
source $HOME/.jump_alias.sh # created by editjump.py

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
