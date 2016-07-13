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
  if [ ! -e ~/.bashrc ]; then
    cp ./bashrc_global ~/.bashrc
    echo " - copied bashrc_global"
  fi
  if [ ! -e ~/.bash_profile ]; then
    cp ./bash_profile_global ~/.bash_profile
    echo " - copied bash_profile_global"
  fi
  if [ ! -e ~/.bash_logout ]; then
    cp ./bash_logout_global ~/.bash_logout
    echo " - copied bash_logout_global"
  fi
  source ~/.bashrc
  source ~/.bash_profile
  source ~/.bash_logout
  echo " - reloaded .bashrc, .bash_profile and .bash_logout"

  # git setting
  if [ ! -e ~/.gitconfig ]; then
    cp ./gitconfig ~/.gitconfig
    echo " - copied gitconfig"
  fi
  if [ ! -e ~/.gitconfig ]; then
    cp ./gitignore_global ~/.gitignore_global
    echo " - copied gitignore_global"
  fi

  # screenrc setting
  if [ ! -e ~/.screenrc ]; then
    cp ./screenrc ~/.screenrc
    echo " - copied screenrc"
  fi

  # tmux setting
  if [ ! -e ~/.tmux.conf ]; then
    cp ./tmux.conf ~/.tmux.conf
    echo " - copied tmux.conf"
  fi

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

  if [ ! -e ~/.vimrc ]; then
    cp ./vimrc_global ~/.vimrc
    echo " - copied vimrc_global"
  fi
  vim ~/.vimrc    # run :NeoBundleInstall here and reload
  echo " - reloaded .vimrc"

  echo "done!"
}

main
