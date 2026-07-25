#!/bin/bash

weather=$(omarchy-weather-status 2>/dev/null)

if [ -z "$weather" ]; then
    echo '{"text":" --"}'
    exit
fi

temp=$(echo "$weather" | grep -oE '[0-9]+°C')

echo "{\"text\":\" $temp\"}"
