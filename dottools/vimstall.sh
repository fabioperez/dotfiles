#!/bin/bash

SCRIPT=$(readlink -f "$0")
SCRIPTPATH=$(dirname "$SCRIPT")
VUNDLE_PATH="https://github.com/gmarik/Vundle.vim.git"

# Terminal colours
bold=$(tput bold)
normal=$(tput sgr0)
red=$(tput setaf 1)

# Check if required programs are installed
function check_program {
    command -v $1 >/dev/null 2>&1 || { echo >&2 "${red}${bold}Error${normal}: $1 is not installed."; exit 1; }
}
check_program "vim"
check_program "git"
check_program "wget"

# Prompt for user confirmation
printf "NOTE: This will ${red}${bold}OVERWRITE${normal} ${bold}~/.vimrc${normal} and ${bold}~/.vim/${normal}\n"
while true; do
    read -p "Do you want to continue [Y/N]? " choice
    case "$choice" in 
        y|Y ) break ;;
        n|N ) exit 0 ; break ;;
          * ) ;;
    esac
done

# Remove .vim/ and .vimrc
rm -rf ~/.vim
rm -f ~/.vimrc

# Install Vundle
(git clone "${VUNDLE_PATH}" ~/.vim/bundle/Vundle.vim > /dev/null) || { echo "Could not clone Vundle"; exit 1; }

# Link .vimrc
ln -fs $SCRIPTPATH/../.vimrc ~/.vimrc

# Install Plugins with Vundle
vim +PluginInstall +qall now

