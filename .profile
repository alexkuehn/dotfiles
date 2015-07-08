
# MacPorts Path

if [ "$(uname -s)" == "Darwin" ]
then
    PATH="/opt/local/bin:/opt/local/sbin:$PATH"
fi

# Finished adapting your PATH environment variable for use with MacPorts.
if [ "$(uname -s)" == "Darwin" ]
then
    alias Emacs='open -a /Applications/Emacs.app/ $1'
else
    alias Emacs='emacs $1'
fi

if [ "$(uname -s)" == "Darwin" ]
then
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
fi


export PATH="$HOME/bin:$PATH"


