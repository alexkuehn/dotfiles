
# MacPorts Path

if [ "$(uname -s)" == "Darwin" ]
then
    PATH="/opt/local/bin:/opt/local/sbin:$PATH"
fi

# Finished adapting your PATH environment variable for use with MacPorts.
if [ "$(uname -s)" == "Darwin" ]
then
    alias Emacs='open -a Emacs.app $1'
else
    alias Emacs='emacs $1'
fi

if [ "$(uname -s)" == "Darwin" ]
then
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
fi


export PATH="$HOME/bin:$PATH"
export CLICOLOR=1

if [[ -f /usr/bin/dircolors && -f $HOME/.dircolors ]]; then
    eval $(dircolors -b $HOME/.dircolors)
fi

ls --color=auto &> /dev/null && alias ls="ls --color=auto"

if [ "$(uname -s)" == "Cygwin" ]
then
    export http_proxy="http://localhost:3128"
    export https_proxy="http://localhost:3128"
fi



