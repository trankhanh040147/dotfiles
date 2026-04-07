# Navigation & System
abbr -a ls 'eza -la --icons --git --header --group-directories-first --time-style=relative'
abbr -a ll 'ls -alF'
abbr -a la 'ls -A'
abbr -a l 'ls -CF'
abbr -a cl 'clear && ls'
abbr -a h history
abbr -a du 'du -h'
abbr -a df 'df -h'
abbr -a xa 'xdg-open .'

# Config Shortcuts
abbr -a nnb 'nvim ~/.bashrc'
abbr -a nnf 'nvim ~/.config/fish'
abbr -a nna 'nvim ~/.config/fish/conf.d/abbrs.fish'
abbr -a nns 'nvim ~/.config/fish/conf.d/secrets.fish'
abbr -a rlb 'source ~/.config/fish/config.fish'

# Package Manager (Debian mapped to Arch muscle memory)
abbr -a ai 'sudo apt-get install'
abbr -a ar 'sudo apt-get remove'
abbr -a au 'sudo apt-get update'
abbr -a aug 'sudo apt-get upgrade'
abbr -a aul 'ls -1 /etc/apt/sources.list.d/'

# Docker
abbr -a dstart 'docker start'
abbr -a dstop 'docker stop'
abbr -a drestart 'docker restart'
abbr -a dboot 'docker start minio mongo01 broker redis'
abbr -a dbuild 'docker rmi app -f && docker build --build-arg http_proxy=$PROXY_URL --build-arg https_proxy=$PROXY_URL -t app .'
abbr -a dcu 'docker compose up -d'
abbr -a dcd 'docker compose down'
abbr -a dim 'docker images'
abbr -a dps 'docker ps | ~/opt/docker-color-output -s'
abbr -a dpsa 'docker ps -a | ~/opt/docker-color-output -s'
abbr -a dsp 'docker system prune --all'
abbr -a dlog 'docker logs -f -n 0'

# Git Core
abbr -a g git
abbr -a gcl 'git clone'
abbr -a gpl 'git pull'
abbr -a gplr 'git pull --rebase'
abbr -a gpu 'git push'
abbr -a gpuf 'git push --force'
abbr -a gpp 'git pull && git push'
abbr -a gf 'git fetch --all --prune'
abbr -a ga 'git add'
abbr -a gall 'git add --all'
abbr -a gs 'git status'
abbr -a gd 'git diff'
abbr -a gc 'git commit --verbose'
abbr -a gcam 'git commit --verbose --amend'
abbr -a gcm 'git commit --verbose -m'
abbr -a gst 'git stash'
abbr -a grst 'git reset'
abbr -a gnuke 'git reset --hard && git clean -d --force -x'
abbr -a gb 'git branch'
abbr -a gco 'git checkout'
abbr -a gcob 'git checkout -b'
abbr -a gm 'git merge'
abbr -a grb 'git rebase'
abbr -a gl 'git log --graph --pretty=format:"%C(yellow)%h%Creset%C(green)%d%Creset %s %C(red)<%an> %C(cyan)(%cr)%Creset" --abbrev-commit'

# Go & Dev Tools
abbr -a gr 'go run'
abbr -a grm 'go run main.go'
abbr -a got 'go mod tidy'
abbr -a gow 'go work init && go work use . && go work use ../e2e_tests'
abbr -a lint 'golangci-lint run'
abbr -a lzg lazygit
abbr -a lzd lazydocker
abbr -a ya yazi
abbr -a lg langtut
abbr -a rv revcli
abbr -a unproxy 'set -e http_proxy https_proxy HTTP_PROXY HTTPS_PROXY'

# Workspaces & Sync
abbr -a signet 'z ~/Signet && ./Signet'
abbr -a signet-dev '~/opt/signet_dev/Signet'
abbr -a signet-stg '~/opt/signet_stg/Signet'
abbr -a scdd 'cd ~/src/0_github/dotfiles && git pull'
abbr -a scu 'cd ~/src/0_github/obsidian-vault && git pull'
abbr -a scd 'cd ~/src/0_github/obsidian-vault && git add . && git commit -m "sync: arcadia" && git push'
abbr -a zob 'cd ~/src/0_github/obsidian-vault'

# VeraCrypt & VPN
abbr -a vr-m1 'sudo veracrypt ~/disks/vera2 /media/veracrypt1 --slot 1'
abbr -a vr-m3 'sudo veracrypt ~/disks/vera /media/veracrypt3 --slot 3'
abbr -a vr-um 'veracrypt -d'
abbr -a cd-v1 'cd /media/veracrypt1'
abbr -a cd-v3 'cd /media/veracrypt3'
abbr -a vpn 'sudo openvpn /media/veracrypt1/data/yubikey/kenny/ION-CAMPUS-VPN-LINUX.ovpn'

# Tmux
abbr -a tmx 'sudo nvim ~/.tmux.conf'
abbr -a tmx-r 'tmux source ~/.tmux.conf'
abbr -a tmx-i '~/.tmux/plugins/tpm/bin/install_plugins'

