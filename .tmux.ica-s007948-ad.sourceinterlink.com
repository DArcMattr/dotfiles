#!/bin/sh
# vim:ft=sh:

SESSION="$(echo "${USER}" | sed -e 's/[\. ]/_/g')"

tmux has-session -t "${SESSION}"
if [ $? -eq 0 ]; then
  echo "Session ${SESSION} already exists, attaching"
else
  tmux set-option -g default-terminal "tmux-256color"

  . ~/dotfiles/helpers/project_pane.sh

  tmux new-session -d -s "${SESSION}"

  tmux set-option -t "${SESSION}" status-position top

  tmux new-window -t "${SESSION}":0 -k

  tmux new-window -t "${SESSION}":1
  tmux send-keys -t "${SESSION}":1 "htop" C-m
  tmux rename-window -t "${SESSION}":1 "htop"

  ( project_pane -t "${SESSION}" -n "AMAG"         -d "/var/www/vhosts/ten/wordpress/wp-content/themes/automobile-mag" )
  ( project_pane -t "${SESSION}" -n "Hot Rod"      -d "/var/www/vhosts/ten/wordpress/wp-content/themes/hot-rod" )
  ( project_pane -t "${SESSION}" -n "Low Rider"    -d "/var/www/vhosts/ten/wordpress/wp-content/themes/low-rider" )
  ( project_pane -t "${SESSION}" -n "Motortrend"   -d "/var/www/vhosts/ten/wordpress/wp-content/themes/motor-trend" )
  ( project_pane -t "${SESSION}" -n "MT Intl"      -d "/var/www/vhosts/ten/wordpress/wp-content/themes/motor-trend-international" )
  ( project_pane -t "${SESSION}" -n "MU Plugins"   -d "/var/www/vhosts/ten/wordpress/wp-content/mu-plugins/ten-shared" -l "../debug.log" )
  ( project_pane -t "${SESSION}" -n "Vehicle Data" -d "/var/www/vhosts/ten/wordpress/wp-content/plugins/vehicle-data" )

  tmux select-window -t "${SESSION}":0
fi

tmux -2u attach-session -t "${SESSION}"
