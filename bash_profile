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

# tmux setting
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Go setting
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# ssh-agent setting
eval `ssh-agent`

# anyenv setting
export PATH=$HOME/.anyenv/bin:$PATH
eval "$(anyenv init -)"
