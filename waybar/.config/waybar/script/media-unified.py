#!/usr/bin/env python3
import subprocess
import json
import sys
import time
import os

STATUS_FILE = "/tmp/waybar-media-source"

def get_mpd_info():
    try:
        result = subprocess.run(
            ["mpc", "status", "--format", "%artist% - %title%"],
            capture_output=True, text=True, timeout=1
        )
        if result.returncode != 0:
            return "", "stop"

        lines = result.stdout.strip().split('\n')
        if len(lines) < 2:
            return "", "stop"

        track = lines[0] if lines[0] else ""
        status_line = lines[1] if len(lines) > 1 else ""

        if "[playing]" in status_line:
            return track, "play"
        elif "[paused]" in status_line:
            return track, "pause"
        return "", "stop"
    except:
        return "", "stop"


def get_playerctl_info():
    try:
        players = subprocess.run(
            ["playerctl", "-l"], capture_output=True, text=True, timeout=1
        )
        if players.returncode != 0 or not players.stdout.strip():
            return "", "stop"

        status = subprocess.run(
            ["playerctl", "status"], capture_output=True, text=True, timeout=1
        )
        if status.returncode != 0:
            return "", "stop"

        state = status.stdout.strip().lower()
        if state == "playing" or state == "paused":
            metadata = subprocess.run(
                ["playerctl", "metadata", "--format", "{{ artist }} - {{ title }}"],
                capture_output=True, text=True, timeout=1
            )
            if metadata.returncode == 0:
                return metadata.stdout.strip(), state
        return "", "stop"
    except:
        return "", "stop"


def format_track(track, state):
    if not track:
        return ""
    if state in ("play", "playing"):
        return f" {track}"
    elif state in ("pause", "paused"):
        return f" {track}"
    return ""


def main():
    last_change = {"mpd": 0.0, "playerctl": 0.0}
    prev_mpd_state = "stop"
    prev_pc_state = "stop"
    prev_mpd_track = ""
    prev_pc_track = ""

    mpd_track, mpd_state = get_mpd_info()
    pc_track, pc_state = get_playerctl_info()
    prev_mpd_state = mpd_state
    prev_pc_state = pc_state
    prev_mpd_track = mpd_track
    prev_pc_track = pc_track

    if mpd_state == "play":
        last_change["mpd"] = time.time()
    if pc_state == "playing":
        last_change["playerctl"] = time.time()

    while True:
        mpd_track, mpd_state = get_mpd_info()
        pc_track, pc_state = get_playerctl_info()
        now = time.time()

        if mpd_state == "play" and prev_mpd_state != "play":
            last_change["mpd"] = now
        elif mpd_state == "play" and mpd_track != prev_mpd_track:
            last_change["mpd"] = now

        if pc_state == "playing" and prev_pc_state != "playing":
            last_change["playerctl"] = now
        elif pc_state == "playing" and pc_track != prev_pc_track:
            last_change["playerctl"] = now

        prev_mpd_state = mpd_state
        prev_pc_state = pc_state
        prev_mpd_track = mpd_track
        prev_pc_track = pc_track

        mpd_text = format_track(mpd_track, mpd_state)
        pc_text = format_track(pc_track, pc_state)

        active_source = ""
        if mpd_text and pc_text:
            active_source = "mpd" if last_change["mpd"] >= last_change["playerctl"] else "playerctl"
            text = mpd_text if active_source == "mpd" else pc_text
        elif mpd_text:
            active_source = "mpd"
            text = mpd_text
        elif pc_text:
            active_source = "playerctl"
            text = pc_text
        else:
            text = ""

        with open(STATUS_FILE, "w") as f:
            f.write(active_source)

        output = {"text": text, "class": "media", "alt": active_source}
        sys.stdout.write(json.dumps(output) + "\n")
        sys.stdout.flush()

        time.sleep(1)


if __name__ == "__main__":
    main()
