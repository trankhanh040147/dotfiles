function fish_prompt -d "Write out the prompt"
    # This shows up as USER@HOST /home/user/ >, with the directory colored
    # $USER and $hostname are set by fish, so you can just use them
    # instead of using `whoami` and `hostname`
    printf '%s@%s %s%s%s > ' $USER $hostname \
        (set_color $fish_color_cwd) (prompt_pwd) (set_color normal)
end

if status is-interactive # Commands to run in interactive sessions can go here

    # No greeting
    set fish_greeting

    # Use starship
    starship init fish | source
    if test -f ~/.local/state/quickshell/user/generated/terminal/sequences.txt
        cat ~/.local/state/quickshell/user/generated/terminal/sequences.txt
    end

    # Aliases
    alias clear "printf '\033[2J\033[3J\033[1;1H'" # fix: kitty doesn't clear properly
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"
    alias ls 'eza --icons'
    alias pamcan pacman
    alias q 'qs -c ii'

    ### Open configs
    alias nna 'nvim ~/.config/fish/config.fish'
    alias nnb 'nvim ~/.bashrc'
    alias nnf 'nvim ~/.config/fish/config.fish'
    alias nns 'nvim ~/.secrets'
    alias rlb 'source ~/.config/fish/config.fish'

    ### Grep
    alias egrep 'egrep --color=auto'
    alias fgrep 'fgrep --color=auto'
    alias grep 'grep --color=auto'
    alias h history

    ### Pacman / yay (Arch equivalents of apt)
    alias ai 'sudo pacman -S'
    alias ar 'sudo pacman -Rns'
    alias au 'sudo pacman -Sy'
    alias aug 'sudo pacman -Syu'

    ### Files
    alias xa 'xdg-open .'
    alias du 'du -h'
    alias df 'df -h'
    alias l 'ls -la'
    alias cl 'clear && ls'

    ### Go
    alias gr 'go run'
    alias grm 'go run main.go'
    alias golint 'golangci-lint run'

    ### Docker
    alias dstart 'docker start'
    alias dstop 'docker stop'
    alias drestart 'docker restart'
    alias dboot 'docker start mongo1 redis1'
    alias dbuild 'docker compose build --no-cache'

    ### Warp-cli
    alias warp-enable 'sudo systemctl enable --now warp-svc'

    ### Tools
    alias rv revcli
    alias lg langtut
    alias lzg lazygit
    alias ya yazi
    alias cld claude

    ### Git
    alias g git

end

zoxide init fish | source
fish_add_path $HOME/.local/bin
