set -g fish_greeting

if status is-interactive
    if not set -q TMUX; and not set -q ZELLIJ
        fastfetch
    end
end

fish_add_path /home/alexn/.spicetify

function zj
    if set -q ZELLIJ
        echo "Already inside zellij"
    else
        zellij
    end
end
