#!/bin/sh
# vim:ft=sh:

if tmux has-session -t "${TMUX_SESSION}" >/dev/null 2>&1; then
  echo "TMUX_SESSION ${TMUX_SESSION} already exists, attaching"
else
  WP_DIR="/var/www/vhosts/ten/wordpress/wp-content/"
  . ~/dotfiles/helpers/project_pane.sh

  tmux new-session -d -s "${TMUX_SESSION}" -x "$(tput cols)" -y "$(tput lines)"

  tmux set-option -t "${TMUX_SESSION}" -g default-terminal "tmux-256color"
  tmux set-option -t "${TMUX_SESSION}" status-position top

  tmux new-window -t "${TMUX_SESSION}":0 -k

  tmux new-window -t "${TMUX_SESSION}":1 "htop"

  ( project_pane -t "${TMUX_SESSION}" -n "AMAG"         -d "${WP_DIR}themes/automobile-mag" -g )
  ( project_pane -t "${TMUX_SESSION}" -n "Classifieds"  -d "${WP_DIR}plugins/classifieds" )
  ( project_pane -t "${TMUX_SESSION}" -n "Hot Rod"      -d "${WP_DIR}themes/hot-rod" -g )
  ( project_pane -t "${TMUX_SESSION}" -n "Low Rider"    -d "${WP_DIR}themes/low-rider" -g )
  ( project_pane -t "${TMUX_SESSION}" -n "Motortrend"   -d "${WP_DIR}themes/motor-trend" -g )
  ( project_pane -t "${TMUX_SESSION}" -n "MT Intl"      -d "${WP_DIR}themes/motor-trend-international" -g )
  ( project_pane -t "${TMUX_SESSION}" -n "MU Plugins"   -d "${WP_DIR}mu-plugins/ten-shared" -g )
  ( project_pane -t "${TMUX_SESSION}" -n "Vehicle Data" -d "${WP_DIR}plugins/vehicle-data" -g )

  tmux select-window -t "${TMUX_SESSION}":0
fi

tmux -2u attach-session -t "${TMUX_SESSION}"
