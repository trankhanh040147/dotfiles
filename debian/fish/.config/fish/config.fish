# Disable Fish greeting
set -g fish_greeting

if status is-interactive
    # Backspace fix for Tmux/Autopair
    function __ctrl_backspace_fix --on-event fish_prompt
        bind ctrl-h backward-kill-word
        functions -e __ctrl_backspace_fix
    end

    # Tool Initialization
    mise activate fish | source
    zoxide init fish | source
    starship init fish | source
    # Only run fzf integration if it is a modern version
    # If this was breaking Tab, you will need to update fzf.
    if type -q fzf; and fzf --version | string match -q -r "^0\.[4-9]|^[1-9]"
        fzf --fish | source
    end
end
