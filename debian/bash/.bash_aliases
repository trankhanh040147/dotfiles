alias nna='nvim $HOME/.bash_aliases'
alias nnb='nvim $HOME/.bashrc'
alias rlb='. ~/.bashrc'

alias lgout='gnome-session-quit'
alias ai='sudo apt-get install'
alias ar='sudo apt-get remove'
alias au='sudo apt-get update'
alias aug='sudo apt-get upgrade'
alias du='du -h'
alias df='df -h'
alias ls='ls -F --color=auto'
alias reown='sudo chown -R $USER .'
#vera
alias vr-m1='sudo veracrypt $HOME/disks/vera2 /media/veracrypt1 --slot 1'
alias vr-m3='sudo veracrypt $HOME/disks/vera /media/veracrypt3 --slot 3'
alias vr-um='veracrypt -d'
#cd
alias cd-v1='cd /media/veracrypt1'
alias cd-v3='cd /media/veracrypt3'
#idea

#tmux
alias tmx='sudo vi  ~/.tmux.conf'
alias tmx-r='tmux source ~/.tmux.conf'
alias tmx-i='. ~/.tmux/plugins/tpm/bin/install_plugins'

alias xa='xdg-open .'
alias unproxy='unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY'

#vpn
alias vpn='sudo openvpn /media/veracrypt1/data/yubikey/kenny/ION-CAMPUS-VPN-LINUX.ovpn'

alias python3='/usr/local/bin/python3.11'

#docker
alias daws=d-aws-cli-fn
alias dc=dc-fn
alias dcu="docker compose up -d"
alias dcd="docker compose down"
alias dcr=dcr-fn
alias dex=dex-fn
alias di=di-fn
alias dim="docker images"
alias dip=dip-fn
alias dl=dl-fn
alias dnames=dnames-fn
alias dps="docker ps | /home/vessel/opt/docker-color-output -s"
alias dpsa="docker ps -a | /home/vessel/opt/docker-color-output -s"
alias drmc=drmc-fn
alias drmid=drmid-fn
alias drun=drun-fn
alias dsp="docker system prune --all"
alias dsr=dsr-fn
alias dstart="docker start"
alias dstop="docker stop"
alias dlog="docker logs -f -n 0"
alias dboot="dstart minio mongo01 broker redis"
alias dbuild="docker rmi app -f && docker build --build-arg http_proxy=http://10.1.102.3:3128 --build-arg https_proxy=http://10.1.102.3:3128 ."

# Base git alias
alias g='git'

# git clone
alias gcl='git clone'

# git pull / git push
alias gpl='git pull'
alias gplr='git pull --rebase'
alias gplum='git pull upstream master'

alias gpu='git push'
alias gput='git push --tags'
alias gpuf='git push --force'
alias gpuu='git push --set-upstream'
alias gpuo='git push origin'
alias gpuom='git push origin master'
alias gpuar='git remote | xargs -L1 git push'

alias gpp='git pull && git push'

# git fetch
alias gf='git fetch --all --prune'
alias gft='git fetch --all --prune --tags'
alias gfv='git fetch --all --prune --verbose'
alias gftv='git fetch --all --prune --tags --verbose'
alias gfr='git fetch && git rebase'

# git add / git rm / git mv
alias ga='git add'
alias gap='git add --patch'
alias gall='git add --all'
alias gai='git add --interactive'
alias gau='git add --update'

# alias grm='git rm';
# alias gmv='git mv';

# git status / git diff
alias gs='git status'
alias gss='git status --short'
alias gd='git diff'
alias gdw='git diff --word-diff'
alias gds='git diff --staged'
alias gdws='git diff --word-diff --staged'
# alias gdv='git diff -w "$@" | vim -R -'

# git commit
alias gc='git commit --verbose'
alias gcam='git commit --verbose --amend'
alias gca='git commit --verbose --all'
alias gcm='git commit --verbose -m'
alias gci='git commit --interactive'

# git stash
alias gst='git stash'
alias gstpu='git stash push'
alias gstpo='git stash pop'
alias gstd="git stash drop"
alias gstl="git stash list"

# git reset / git clean
alias grst='git reset'
alias gnuke='git reset --hard && git clean -d --force -x'

alias gclean='git clean -d --force'

# git branch
alias gb='git branch'
alias gba='git branch --all'
alias gbt='git branch --track'
alias gbm='git branch --move'
alias gbdel='git branch --delete --force'

# git checkout
alias gco='git checkout'
alias gcob='git checkout -b'
alias gct='git checkout --track'

# git cherrypick
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

# git merge / git rebase
alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'

alias grb='git rebase'
alias grba='gir rebase --abort'
alias grbc='git rebase --continue'
alias grbi='git rebase --interactive'

# git log
alias gl='git log --graph --pretty=format:"%C(yellow)%h%Creset%C(green)%d%Creset %s %C(red)<%an> %C(cyan)(%cr)%Creset" --abbrev-commit'
alias gls='gl --stat'
alias gsl='git shortlog --email'
alias gsls='git shortlog --email --summary --numbered'

# git remote
alias gr='git remote'
alias grv='git remote -v'
alias gra='git remote add'

# Misc
alias gignore='git update-index --assume-unchanged'

# golang
alias lint='golangci-lint run'
alias go='http_proxy=http://10.1.102.3:3128/ https_proxy=http://10.1.102.3:3128/ no_proxy=localhost,127.0.0.0/8,::1 go'
alias got='go mod tidy'
alias gr='go run '
alias grm='go run main.go'

# Signet
alias signet='z /home/vessel/Signet && ./Signet'
alias signet-dev='z /home/vessel/opt/signet_dev && ./Signet'
alias signet-stg='z /home/vessel/opt/signet_stg && ./Signet'

# zoxdide
alias zob="z /home/vessel/Documents/'Obsidian Vault'/'6 - Full Notes'"

# Obsidian vaults
alias obsync=""

#minio
#mc alias set myminio http://localhost:9000 AKIAIOSFODNN7EXAMPLE wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY

# ---------------------------------------------------------------------------
# Fabric Peer Aliases for Org1
# ---------------------------------------------------------------------------

# Common variables for all peers in Org1
export ORG1_MSP_PATH="/home/vessel/src/fabric-demo/test-network/organizations/peerOrganizations/org1.example.com"
export ORG1_ADMIN_MSP_PATH="${ORG1_MSP_PATH}/users/Admin@org1.example.com/msp"

# Alias for peer0.org1.example.com
alias peer0='
  export CORE_PEER_LOCALMSPID="Org1MSP"
  export CORE_PEER_TLS_ENABLED=true
  export CORE_PEER_MSPCONFIGPATH="${ORG1_ADMIN_MSP_PATH}"
  export CORE_PEER_ADDRESS="localhost:7051"
  export CORE_PEER_TLS_ROOTCERT_FILE="${ORG1_MSP_PATH}/peers/peer0.org1.example.com/tls/ca.crt"
  echo "Switched CLI context to peer0.org1.example.com (localhost:7051)"
'

# Alias for peer1.org1.example.com
alias peer1='
  export CORE_PEER_LOCALMSPID="Org1MSP"
  export CORE_PEER_TLS_ENABLED=true
  export CORE_PEER_MSPCONFIGPATH="${ORG1_ADMIN_MSP_PATH}"
  export CORE_PEER_ADDRESS="localhost:9051"
  export CORE_PEER_TLS_ROOTCERT_FILE="${ORG1_MSP_PATH}/peers/peer1.org1.example.com/tls/ca.crt"
  echo "Switched CLI context to peer1.org1.example.com (localhost:9051)"
'

# Alias for peer2.org1.example.com
alias peer2='
  export CORE_PEER_LOCALMSPID="Org1MSP"
  export CORE_PEER_TLS_ENABLED=true
  export CORE_PEER_MSPCONFIGPATH="${ORG1_ADMIN_MSP_PATH}"
  export CORE_PEER_ADDRESS="localhost:9151"
  export CORE_PEER_TLS_ROOTCERT_FILE="${ORG1_MSP_PATH}/peers/peer2.org1.example.com/tls/ca.crt"
  echo "Switched CLI context to peer2.org1.example.com (localhost:9151)"
'
