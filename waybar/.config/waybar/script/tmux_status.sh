#! /bin/bash

# check if tmux is running in background or not
# tmux info &> /dev/null && echo "run" || echo "not run"

# check if session exists or not
# if tmux has-session -t "my_session" 2>/dev/null; then
#     echo "Session exists"
# fi

session=$(tmux list-clients -F "#{session_name}" 2>/dev/null | head -1)
if [ -z "$session" ]; then
  tmux has-session 2>/dev/null && echo "OUTSIDE TMUX" || echo "NO SESSION"
else
  echo "$session"
fi
