#!/usr/bin/env bash

window=$(hyprctl activewindow -j 2>/dev/null)

class=$(echo "$window" | jq -r '.class // empty')


if [ -z "$class" ]; then
    echo "Desktop"
    exit
fi


case "${class,,}" in
    *kitty*)
        echo "  kitty"
        ;;
    *firefox*)
        echo "󰈹  firefox"
        ;;
    *code*|*vscode*)
        echo "󰨞  code"
        ;;
    *spotify*)
        echo "󰓇  spotify"
        ;;
    *discord*|*vesktop*)
        echo "󰙯  discord"
        ;;
    *)
        echo "  $class"
        ;;
esac
