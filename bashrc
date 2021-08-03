# vim: filetype=sh

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi
source $(dirname $0)/commonrc
