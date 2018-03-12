# vim: filetype=sh

if [ `uname` = Linux ]; then
  eval `ssh-agent -k`
fi
