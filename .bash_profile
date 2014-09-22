# automatically read ~/.bashrc
if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi

# editor setting
export BUNDLER_EDITOR=vim
export EDITOR=vim

# terminal color setting
export CLICOLOR=1
export LSCOLORS=DxGxcxdxCxegedabagacad
export TERM=xterm-256color

# GCC setting
export CC=gcc
export CXX=g++
export CPPFLAGS="-march=core2 -mtune=core2"

if [ `uname` = "Darwin" ]; then
  source ~/dotfiles/.bash_profile_mac
  echo " - reloaded .bash_profile for Mac"
elif [ `uname` = "Linux" ]; then
  echo " - reloaded .bash_profile for Linux"
fi
