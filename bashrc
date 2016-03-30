if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

# Application Shortcuts
alias safari='open -g -a safari'
alias chrome='open -g -a chrome'
alias firefox='open -g -a firefox'

# command shortcuts
alias up='cd ..'
alias upp='cd ../..'
alias uppp='cd ../../..'

case "${OSTYPE}" in
  darwin*) alias ls="ls -G"      ;;
  linux*)  alias ls="ls --color" ;;
esac

alias grep='grep --color'

# Homebrew shortcuts
alias bin='brew install'
alias buin='brew uninstall'
alias bdoc='brew doctor'
alias bupd='brew update'
alias bupg='brew upgrade'
alias bsch='brew search'
alias binf='brew info'
alias bls='brew list'
alias bvs='brew versions'
alias bpr='brew prune'
alias brm='brew remove'
alias brmf='brew remove --force'
alias btp='brew tap'
alias butp='brew untap'
alias bln='brew link'
alias buln='brew unlink'
alias bswt='brew switch'

# svn shortcuts
alias sst='svn status'
alias sstu='svn status -u'
alias sdi='svn diff'
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
alias gsh='git show'
alias grm='git rm'
alias grmc='git rm --cached'
alias gft='git fetch'
alias gfta='git fetch --all'
alias gpl='git pull'
alias gplr='git pull --rebase'
alias glg='git log --graph --stat'
alias glgp='git log -p --graph --stat'
alias gdf='git diff'
alias gdfc='git diff --cached'
alias grst='git reset'
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
alias gtg='git tag'
alias gtgsorted="git for-each-ref --sort=taggerdate --format='%(authordate:short) %(refname:short) %(subject)' refs/tags"

# vagrant shortcuts
alias vbl='vagrant box list'
alias vbad='vagrant box add'
alias vbrm='vagrant box remove'
alias vinit='vagrant init'
alias vssh='vagrant ssh'
alias vsshc='vagrant ssh-config'
alias vst='vagrant status'
alias vup='vagrant up'
alias vupp='vagrant up --provision'
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
