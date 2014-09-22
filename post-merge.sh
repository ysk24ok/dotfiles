#!/bin/sh

echo "Now executing post-merge hook ..."

# git setting
cp ./.gitconfig_global ~/.gitconfig
cp ./.gitignore_global ~/.gitignore_global

# vim seting
if [ ! -e ~/.vim ]; then
  mkdir -p ~/.vim/bundle
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi

vim ./vimrc
cp ./.vimrc_global ~/.vimrc
source ~/.vimrc

echo "done!"
