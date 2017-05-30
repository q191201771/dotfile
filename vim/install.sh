#!/usr/bin/env bash
# @file   install.sh
# @author
#   chef <191201771@qq.com>
#     -created 2017-05-30 09:57:12
#     -initial release xxxx-xx-xx
# @brief
#   xxx

echo 'cp vimrc...'
cp vimrc ~/.vimrc

if [ ! -d ~/.vim/bundle ]; then
    mkdir ~/.vim/bundle
fi

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    echo 'install vundle...'
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi

echo 'install vundle plugin...'
vim +PluginInstall +qall
