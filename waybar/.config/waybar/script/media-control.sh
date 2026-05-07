#!/bin/bash
STATUS_FILE="/tmp/waybar-media-source"
if [[ -f "$STATUS_FILE" ]]; then
    source=$(cat "$STATUS_FILE")
    case "${1:-toggle}" in
        toggle)
            if [[ "$source" == "mpd" ]]; then
                mpc toggle 2>/dev/null
            else
                playerctl play-pause 2>/dev/null
            fi
            ;;
        next)
            if [[ "$source" == "mpd" ]]; then
                mpc next 2>/dev/null
            else
                playerctl next 2>/dev/null
            fi
            ;;
        prev)
            if [[ "$source" == "mpd" ]]; then
                mpc prev 2>/dev/null
            else
                playerctl previous 2>/dev/null
            fi
            ;;
        stop)
            if [[ "$source" == "mpd" ]]; then
                mpc stop 2>/dev/null
            else
                playerctl stop 2>/dev/null
            fi
            ;;
    esac
fi
