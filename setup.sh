#!/bin/bash

DOTFILES_DIR=$(dirname $(realpath $0))

function check_command() {
  if ! type $1 > /dev/null 2>&1; then
    echo "'$1' command is not installed"
    exit 1
  fi
}

function setup_file() {
  file=$1
  dest=~/.$1
  if [ ! -e $dest ]; then
    cp $DOTFILES_DIR/$file $dest
    echo $dest is copied.
  else
    echo $dest already exists.
  fi
}

function setup_shell_file() {
  file=$1
  dest=~/.$1
  if [ ! -e $dest ]; then
    echo source $DOTFILES_DIR/$file > $dest
    source $dest
    echo $dest is created.
  else
    echo $dest already exists.
  fi
}

function setup_vim() {
  # vim-plug
  if [ ! -e ~/.vim/autoload/plug.vim ]; then
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    echo ' - vim-plug is installed'
  fi
  setup_file vimrc
  vim ~/.vimrc    # run :PlugInstall here and reload
}

function setup_bash() {
  setup_shell_file bashrc
  setup_shell_file bash_profile
  setup_shell_file bash_logout
}

function setup_zsh() {
  setup_shell_file zshrc
  setup_shell_file zprofile
}

function main() {
  echo 'Now executing setup script ...'

  setup_file gitconfig
  setup_file gitignore_global
  setup_file screenrc
  setup_file tmux.conf

  setup_vim

  setup_bash
  setup_zsh

  echo 'done!'
}

check_command curl
main
