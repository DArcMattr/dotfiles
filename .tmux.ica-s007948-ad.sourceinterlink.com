#!/bin/sh
# vim:ft=sh:

SESSION="$(echo "${USER}" | sed -e 's/[\. ]/_/g')"

tmux has-session -t "${SESSION}"
if [ $? -eq 0 ]; then
  echo "Session ${SESSION} already exists, attaching"
  sleep 1
  tmux -2u attach -t "${SESSION}"
  exit 0;
fi

tmux new-session -d -s "${SESSION}"

tmux set-option -t "${SESSION}" -g default-terminal "tmux-256color"
tmux set-option -t "${SESSION}" status-position top

tmux new-window -t "${SESSION}":0 -k

tmux new-window -t "${SESSION}":1
tmux send-keys -t "${SESSION}":1 "htop" C-m
tmux rename-window -t "${SESSION}":1 "htop"

tmux select-window -t "${SESSION}":0

tmux -2u attach-session -t "${SESSION}"
