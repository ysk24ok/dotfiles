# vim: filetype=sh

if [ -f ~/.bashrc ] ; then
  . ~/.bashrc
fi
uname=`uname`

# terminal color setting
if [ $uname = Darwin ]; then
  export CLICOLOR=1
  export LSCOLORS=DxGxcxdxCxegedabagacad
fi

# tmux setting
PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Go setting
export GOPATH=$HOME/.go
export PATH=$PATH:$GOPATH/bin
