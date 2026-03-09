set -gx EDITOR nvim

# Go Configuration
set -gx GO111MODULE on
set -gx GOPATH ~/go
set -gx GOROOT /usr/local/go
set -gx GOBIN ~/go/bin
set -gx GOCACHE ~/go-cache
set -gx GOTMPDIR ~/go-tmp
set -gx TMPDIR ~/go-build-tmp

# Paths (Mise replaces nvm/gvm/pyenv shims)
fish_add_path ~/.local/bin ~/opt/nvim/bin ~/.local/share/mise/shims ~/.bun/bin $GOBIN $GOROOT/bin

# Proxy Settings
set -gx PROXY_URL "http://10.1.102.3:3128"
set -gx http_proxy $PROXY_URL
set -gx https_proxy $PROXY_URL
set -gx HTTP_PROXY $PROXY_URL
set -gx HTTPS_PROXY $PROXY_URL
# set -gx no_proxy "localhost, 127.0.0.0/8, ::1, *.local, 169.254/16, 42.115.64.43, 10.1.0.0/8, *.signetcenter.systems, *.signetcenter.dev, *.signetsystem.com, *.uccsystem.com, *.systemprojects.net, 172.31.69.20, *.gti.local, mongo-key0-1, mongo-key0-1, mongo-key0-1, vcenter.signetcenter.dev, 10.1.128.100, 172.17.0.1, admin-hcns.uccsystem.com, hnth80-dev.uccsystem.com, sdrive-dev.uccsystem.com, sdrive-file-dev.uccsystem.com, lua.org, bun.sh, gitlab.signetcenter.systems, dev-nextjs.signetcenter.dev, idp-dev.uccsystem.com, mapp-developer-stg.uccsystem.com, qcb.cyguardservice.com, dvcchat-stg.uccsystem.com, idp-stg.uccsystem.com, stask-dev.uccsystem.com, official-cms-dev.uccsystem.com, dvcchat-dev.uccsystem.com, chrome.google.com, *.uccsystem.com, dichvucong.binhdinh.gov.vn, wks.cyguardservice.com, stackblitz.com, *.brave.com, google.com, open.spotify.com, perplexity.ai, bitly.com, releases.codeiumdata.com, google.com, api.githubcopilot.com, api.jetbrains.ai"
set -gx no_proxy "localhost, 127.0.0.0/8, ::1, *.local, 169.254/16, 42.115.64.43, 10.1.0.0/8, *.signetcenter.systems, *.signetcenter.dev, *.signetsystem.com, *.systemprojects.net, 172.31.69.20, *.gti.local, mongo-key0-1, mongo-key0-1, mongo-key0-1, vcenter.signetcenter.dev, 10.1.128.100, 172.17.0.1, admin-hcns.uccsystem.com, ds-s3.signetcenter.dev, hnth80-dev.uccsystem.com, storages-dev.uccsystem.com, storages-stg.uccsystem.com, sdrive-dev.uccsystem.com, sdrive-file-dev.uccsystem.com, lua.org, bun.sh, gitlab.signetcenter.systems, dev-nextjs.signetcenter.dev, idp-dev.uccsystem.com, mapp-developer-stg.uccsystem.com, *.ngrok-free.app, reddit.com, dvcchat-dev.uccsystem.com,api.githubcopilot.com"
set -gx NO_PROXY $no_proxy

# Tool Specific Env
# set -gx ELECTRON_GET_USE_PROXY true
# set -gx GLOBAL_AGENT_HTTPS_PROXY $PROXY_URL
set -gx PKG_CONFIG_PATH /usr/lib/x86_64-linux-gnu/pkgconfig
set -gx PREPF_NEW_UI true
set -gx AGENT_MODE github
set -gx BUN_INSTALL ~/.bun
set -gx FZF_CTRL_R_OPTS "--bind 'ctrl-y:execute-silent(echo -n {2..} | xclip -selection clipboard)+abort'"
