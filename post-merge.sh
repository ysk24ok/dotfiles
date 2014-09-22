#!/bin/sh

echo "Now executing post-merge hook ..."

# bash setting
cp ./.bash_profile_global ~/.bash_profile
cp ./.bashrc_global ~/.bashrc
source ~/.bashrc
source ~/.bash_profile
echo " - copied and reloaded .bashrc and .bash_profile"

# git setting
cp ./.gitconfig_global ~/.gitconfig
cp ./.gitignore_global ~/.gitignore_global
echo " - copied .gitconfig and .gitignore"

# vim setting
if [ ! -e ~/.vim ]; then
  mkdir -p ~/.vim/bundle
  git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
  echo " - cloned Shougo/neobundle.vim"

  git clone git://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
  cd ~/.vim/bundle/vimproc && make && cd ~/dotfiles
  echo " - cloned Shougo/vimproc and executed make"
fi

cp ./.vimrc_global ~/.vimrc
vim ~/.vimrc    # run :NeoBundleInstall here and reload
echo " - reloaded .vimrc"

echo "done!"
