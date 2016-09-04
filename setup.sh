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
  echo 'Now executing setup script ...'

  # path of dotfiles directory
  if [ "`uname`" == 'Darwin' ]; then
    DOTFILES_DIR='~/Documents/Github/dotfiles'
  elif [ "`uname`" == 'Linux' ]; then
    DOTFILES_DIR='~/dotfiles'
  else
    echo 'This platform is not supported'
  fi

  # git
  if [ ! -e ~/.gitconfig ]; then
    cp ./gitconfig ~/.gitconfig
    echo ' - gitconfig is copied'
  else
    echo ' - gitconfig already exists'
  fi
  if [ ! -e ~/.gitignore_global ]; then
    cp ./gitignore_global ~/.gitignore_global
    echo ' - gitignore_global is copied'
  else
    echo ' - gitignore_global already exists'
  fi

  # screenrc
  if [ ! -e ~/.screenrc ]; then
    cp ./screenrc ~/.screenrc
    echo ' - screenrc is copied'
  else
    echo ' - screenrc already exists'
  fi

  # tmux
  if [ ! -e ~/.tmux.conf ]; then
    cp ./tmux.conf ~/.tmux.conf
    echo ' - tmux.conf is copied'
  else
    echo ' - tmux.conf already exists'
  fi

  # vim
  install_command 'vim'
  # vim-plug
  if [ ! -e ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo ' - vim-plug is installed'
  fi
  # .vimrc
  if [ ! -e ~/.vimrc ]; then
    echo "source $DOTFILES_DIR/vimrc" > ~/.vimrc
    echo ' - ~/.vimrc is set'
  else
    echo ' - ~/.vimrc already exists'
  fi
  vim ~/.vimrc    # run :PlugInstall here and reload
  echo ' - reloaded .vimrc'

  # anyenv
  if [ ! -e ~/.anyenv ]; then
    git clone https://github.com/riywo/anyenv ~/.anyenv > /dev/null 2>&1
    echo ' - anyenv is cloned'
  else
    echo ' - anyenv already exists'
  fi

  # bash
  if [ ! -e ~/.bashrc ]; then
    echo "source $DOTFILES_DIR/bashrc" > ~/.bashrc
    echo ' - ~/.bashrc is copied'
  else
    echo ' - ~/.bashrc already exists'
  fi
  if [ ! -e ~/.bash_profile ]; then
    echo "source $DOTFILES_DIR/bash_profile" > ~/.bash_profile
    echo ' - ~/.bash_profile is copied'
  else
    echo ' - ~/.bash_profile already exists'
  fi
  if [ ! -e ~/.bash_logout ]; then
    echo "source $DOTFILES_DIR/bash_logout" > ~/.bash_logout
    echo ' - ~/.bash_logout is copied'
  else
    echo ' - ~/.bash_logout already exists'
  fi
  source ~/.bashrc
  source ~/.bash_profile
  source ~/.bash_logout
  echo ' - reloaded .bashrc, .bash_profile and .bash_logout'

  echo 'done!'
}

main
