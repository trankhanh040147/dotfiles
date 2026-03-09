# Copy absolute path to clipboard
function copyf -d "Copy absolute path to clipboard"
    realpath $argv[1] | xclip -selection clipboard -t text/plain
end

# Paste from clipboard to destination
function pastef -d "Paste from clipboard to destination"
    set src (xclip -o -selection clipboard)
    set dest $argv[1]
    if test -z "$dest"
        set dest "."
    end
    cp -vr -- "$src" "$dest"
end

# Zoxide and eza combined
function zz -d "Zoxide and eza"
    z $argv && eza -la --icons --git --header --group-directories-first --time-style=relative
end