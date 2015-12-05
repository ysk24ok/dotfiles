#!/bin/sh

function install_command() {
  if [ ! -x "`which $1`" ]; then
    # RedHat
    if [ -x "`which yum`" ]; then
      sudo yum install $1
    # Debian
    elif [ -x "`which apt-get`" ]; then
      sudo apt-get install $1
    # Mac
    else
      brew install $1
    fi
    echo " - installed $1"
  else
    echo " - $1 is already installed"
  fi
}


function main() {
  echo "Now executing setup script ..."

  # bash setting
  cp ./bash_profile_global ~/.bash_profile
  cp ./bashrc_global ~/.bashrc
  source ~/.bashrc
  source ~/.bash_profile
  echo " - copied and reloaded .bashrc and .bash_profile"

  # git setting
  cp ./gitconfig ~/.gitconfig
  cp ./gitignore_global ~/.gitignore_global
  echo " - copied .gitconfig and .gitignore"

  # screenrc setting
  cp ./screenrc ~/.screenrc
  echo " - copied .screenrc"

  # tmux setting
  co ./tmux.conf ~/.tmux.conf
  echo " - copied .tmux.conf"

  # vim setting
  install_command "vim"
  install_command "lua"

  if [ ! -e ~/.vim ]; then
    mkdir -p ~/.vim/bundle
    git clone git://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
    echo " - cloned Shougo/neobundle.vim"

    git clone git://github.com/Shougo/vimproc ~/.vim/bundle/vimproc
    cd ~/.vim/bundle/vimproc && make && cd ~/dotfiles
    echo " - cloned Shougo/vimproc and executed make"
  fi

  cp ./vimrc_global ~/.vimrc
  vim ~/.vimrc    # run :NeoBundleInstall here and reload
  echo " - reloaded .vimrc"

  echo "done!"
}

main
