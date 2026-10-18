#!/bin/sh
printf '\033c\033]0;%s\a' mp3_pomodoro
base_path="$(dirname "$(realpath "$0")")"
"$base_path/mp3_pomodoro.x86_64" "$@"
