#!/bin/sh
# vim:ft=sh:

SESSION="$(echo "${USER}" | sed -e 's/[\. ]/_/g')"

tmux has-session -t "${SESSION}"
if [ $? -eq 0 ]; then
  echo "Session ${SESSION} already exists, attaching"
else
  WP_DIR="/var/www/vhosts/ten/wordpress/wp-content/"
  . ~/dotfiles/helpers/project_pane.sh

  tmux new-session -d -s "${SESSION}"

  tmux set-option -t "${SESSION}" -g default-terminal "tmux-256color"
  tmux set-option -t "${SESSION}" status-position top

  tmux new-window -t "${SESSION}":0 -k

  tmux new-window -t "${SESSION}":1
  tmux send-keys -t "${SESSION}":1 "htop" C-m
  tmux rename-window -t "${SESSION}":1 "htop"

  ( project_pane -t "${SESSION}" -n "AMAG"         -d "${WP_DIR}themes/automobile-mag" -g )
  ( project_pane -t "${SESSION}" -n "Hot Rod"      -d "${WP_DIR}themes/hot-rod" -g )
  ( project_pane -t "${SESSION}" -n "Low Rider"    -d "${WP_DIR}themes/low-rider" -g )
  ( project_pane -t "${SESSION}" -n "Motortrend"   -d "${WP_DIR}themes/motor-trend" -g )
  ( project_pane -t "${SESSION}" -n "MT Intl"      -d "${WP_DIR}themes/motor-trend-international" -g )
  ( project_pane -t "${SESSION}" -n "MU Plugins"   -d "${WP_DIR}mu-plugins/ten-shared" -g )
  ( project_pane -t "${SESSION}" -n "Vehicle Data" -d "${WP_DIR}plugins/vehicle-data" -g watch )

  tmux select-window -t "${SESSION}":0
fi

tmux -2u attach-session -t "${SESSION}"