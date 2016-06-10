#!/usr/bin/env bash
#
# This script gets all dotfiles in actual directory and links them into $HOME
# additionaly special files/directories in a list are added, too

cd "$(dirname "$0")/"
INSTALL_ROOT=$(pwd -P)

set -e
echo ''

info() {
    printf "\r  [ \033[00;34m..\033[0m ] $1\n"
}

user() {
    printf "\r  [ \033[0;33m??\033[0m ] $1\n"
}

success() {
    printf "\r\033[2K  [ \033[00;32mOK\033[0m ] $1\n"
}

fail() {
    printf "\r\033[2K  [\033[0;31mFAIL\033[0m] $1\n"
    echo ''
    exit
 }
                                                                                                                              
install_dotfiles() {
    info "linking dotfiles..."
    
    # find the dotfiles and link them
    for srcfile in $(find -H "$INSTALL_ROOT" -maxdepth 1 -name '.*' -not -name "." -not -name '.git' -not -name '.gitignore')
    do
      local destfile="$HOME/$(basename "$srcfile")"
      info "$destfile  -> $srcfile"
      ln -s -f "$srcfile" "$destfile"
     
    done
    success "linked dotfiles"
}

# do it
install_dotfiles







