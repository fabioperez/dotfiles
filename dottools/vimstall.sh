#!/bin/bash

SCRIPTPATH=$(cd "$(dirname "$0")" && pwd)
echo $SCRIPTPATH

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
check_program "npm"

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

# Install vim-plug
(curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
 https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim) \
 || { echo "Could not clone vim-plug"; exit 1; }

# Link .vimrc
echo $SCRIPTPATH/../.vimrc
ln -fs $SCRIPTPATH/../.vimrc ~/.vimrc

# Create undo path
mkdir -p ~/.vim/undo

# Install Plugins with vim-plug
vim +PlugInstall +qall now
