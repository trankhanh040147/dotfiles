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

    # Aliases (keep as alias: same command name with default flags or raw escapes)
    alias clear "printf '\033[2J\033[3J\033[1;1H'" # fix: kitty doesn't clear properly
    alias celar "printf '\033[2J\033[3J\033[1;1H'"
    alias claer "printf '\033[2J\033[3J\033[1;1H'"
    alias egrep 'egrep --color=auto'
    alias fgrep 'fgrep --color=auto'
    alias grep 'grep --color=auto'
    alias du 'du -h'
    alias df 'df -h'

    # Abbreviations
    abbr -a ls 'eza --icons'
    abbr -a pamcan pacman
    abbr -a q 'qs -c ii'

    ### Open configs
    abbr -a nna 'nvim ~/.config/fish/config.fish'
    abbr -a nnb 'nvim ~/.bashrc'
    abbr -a nnf 'nvim ~/.config/fish/config.fish'
    abbr -a nnh 'cd ~/.config/hypr && nvim'
    abbr -a nns 'nvim ~/.secrets'
    abbr -a rlb 'source ~/.config/fish/config.fish'
    abbr -a rlh 'hyprctl reload'

    ### Grep
    abbr -a h history

    ### Pacman / yay (Arch equivalents of apt)
    abbr -a ai 'sudo pacman -S'
    abbr -a ar 'sudo pacman -Rns'
    abbr -a au 'sudo pacman -Sy'
    abbr -a aug 'sudo pacman -Syu'

    ### Files
    abbr -a xa 'xdg-open .'
    abbr -a l 'ls -la'
    abbr -a cl 'clear && ls'

    ### Go
    abbr -a gr 'go run'
    abbr -a grm 'go run main.go'
    abbr -a golint 'golangci-lint run'

    ### Docker
    abbr -a dstart 'docker start'
    abbr -a dstop 'docker stop'
    abbr -a drestart 'docker restart'
    abbr -a dboot 'docker start mongo1 redis1'
    abbr -a dbuild 'docker compose build --no-cache'

    ### Warp-cli
    abbr -a warp-enable 'sudo systemctl enable --now warp-svc'

    ### Tools
    abbr -a rv revcli
    abbr -a lg langtut
    abbr -a lzg lazygit
    abbr -a ya yazi
    abbr -a cld claude

    ### Git
    abbr -a g git

end

zoxide init fish | source
fish_add_path $HOME/.local/bin
