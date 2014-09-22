if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# clang alias
if [ -x "`which clang`" ]; then
  alias clang++='clang++ -std=c++11 -stdlib=libc++'
fi

# Java alias
if [ -x "`which java`" ]; then
  alias javac='javac -J-Dfile.encoding=UTF-8'
  alias java='java -Djava.library.path=/usr/local/lib'
fi

# Application Shortcuts
alias safari='open -g -a safari'
alias chrome='open -g -a chrome'
alias firefox='open -g -a firefox'

# command shortcuts
alias up='cd ..'
alias upp='cd ../..'
alias uppp='cd ../../..'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'
alias lh='ls -h'
alias llah='ls -lah'

if [ -x "`which rmtrash`" ]; then
  alias rm='rmtrash'
else
  alias rm='rm -i'
  alias delete='rm -rf'
fi

# Homebrew shortcuts
alias bin='brew install'
alias buin='brew uninstall'
alias bdoc='brew doctor'
alias bupd='brew update'
alias bupg='brew upgrade'
alias bsch='brew search'
alias bls='brew list'
alias bvs='brew versions'
alias bpr='brew prune'

# svn shortcuts
alias sst='svn status'
alias sstu='svn st -u'
alias sdi='svn di'
alias sad='svn add'
alias sadf='svn add --force'
alias sup='svn up'
alias sci='svn ci'
alias scim='svn ci -m'
alias scmm='svn commit -m'

# git shortcuts
alias gst='git status'
alias gad='git add'
alias gadp='git add -p'
alias gcm='git commit'
alias gcmm='git commit -m'
alias gps='git push'
alias grm='git rm'
alias gft='git fetch'
alias gfta='git fetch --all'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias glg='git log --graph --stat'
alias glgp='git log -p --graph --stat'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias grsts='git reset --soft'
alias grsth='git reset --hard'
alias gbr='git branch'
alias gbra='git branch -a'
alias gbram='git branch -a --merged'
alias gbrd='git branch -d'
alias gbrD='git branch -D'
alias gbrdm='git branch --merged | grep -v '*' | xargs -I % git branch -d %'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gsta='git stash'
alias gstal='git stash list'
alias gstad='git stash drop'
alias gstaa='git stash apply'
alias gstap='git stash pop'
alias grmt='git remote'
alias grmtpr='git remote prune'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias grbs='git rebase --skip'
alias gsbmi='git submodule init'
alias gsbmu='git submodule update'

# vagrant shortcuts
alias vbl='vagrant box list'
alias vbad='vagrant box add'
alias vbrm='vagrant box remove'
alias vinit='vagrant init'
alias vssh='vagrant ssh'
alias vsshc='vagrant ssh-config'
alias vst='vagrant status'
alias vup='vagrant up'
alias vhlt='vagrant halt'
alias vrld='vagrant reload'
alias vrldp='vagrant reload --provision'
alias vprv='vagrant provision'
alias vdst='vagrant destroy'
alias vvbg='vagrant vbguest'
alias vvbgst='vagrant vbguest --status'

# compass shortcuts
alias cmpcn='compass compile --output-style nested'
alias cmpw='compass watch'
