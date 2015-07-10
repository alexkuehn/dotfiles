autoload -U colors && colors
autoload -U promptinit && promptinit
autoload -U compinit && compinit

setopt EMACS
setopt NO_BEEP
setopt MULTIOS
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD
setopt ALWAYS_TO_END

setopt PROMPT_CR
setopt PROMPT_SUBST

setopt APPEND_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_FIND_NO_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY
setopt HIST_NO_STORE

HISTFILE=~/.zsh_histfile
HISTSIZE=10000000
SAVEHIST=10000000

prompt adam1

setopt menu_complete
zmodload zsh/complist  # TODO: is this important?

# graphical menu for completion list (autoselect first completion on open)
zstyle ':completion:*' menu yes select

# colorize files completions
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# list of directories to get commands from for sudo
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin

# show menu but don't select first completion
zstyle ':completion:*' menu select=1
setopt auto_menu
unsetopt menu_complete
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegeadabagaced
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

