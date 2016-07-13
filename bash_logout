USER=`whoami`

# kill ssh-agent when there is only on logged-in user
if [ `who | grep $USER | grep -v console | wc -l ` = 1 ]; then
  eval `ssh-agent -k`
fi
