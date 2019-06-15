#!/bin/bash

DOTFILES_DIR="$(pwd)/$(dirname $0)"

function check_command() {
  if ! type $1 > /dev/null 2>&1; then
    echo "'$1' command is not installed"
    exit 1
  fi
}

function main() {
  echo 'Now executing setup script ...'

  # git
  if [ ! -e ~/.gitconfig ]; then
    cp $DOTFILES_DIR/gitconfig ~/.gitconfig
    echo ' - gitconfig is copied'
  else
    echo ' - gitconfig already exists'
  fi
  if [ ! -e ~/.gitignore_global ]; then
    cp $DOTFILES_DIR/gitignore_global ~/.gitignore_global
    echo ' - gitignore_global is copied'
  else
    echo ' - gitignore_global already exists'
  fi

  # screenrc
  if [ ! -e ~/.screenrc ]; then
    cp $DOTFILES_DIR/screenrc ~/.screenrc
    echo ' - screenrc is copied'
  else
    echo ' - screenrc already exists'
  fi

  # tmux
  if [ ! -e ~/.tmux.conf ]; then
    cp $DOTFILES_DIR/tmux.conf ~/.tmux.conf
    echo ' - tmux.conf is copied'
  else
    echo ' - tmux.conf already exists'
  fi

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

check_command curl
main
