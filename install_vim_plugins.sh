#!/bin/bash
# Install_vim_plugins.sh
# Christian Tabedzki

if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then 
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi 

DIRECTORY=`dirname $0`
cp $DIRECTORY/config-files/.vimrc ~/.vimrc 

vim +PluginInstall +qall


