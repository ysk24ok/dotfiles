# vim: filetype=sh

if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi
source $(dirname ${BASH_SOURCE[0]})/commonrc
