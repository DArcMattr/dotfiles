#!/bin/sh
# vim:ft=sh:

WP_DIR="/var/www/vhosts/ten/wordpress/wp-content/"
. ~/dotfiles/helpers/project_pane.sh

tmux new-window -t "${SESSION}":1 "htop"

( project_pane -t "${SESSION}" -n "AMAG"         -d "${WP_DIR}themes/automobile-mag" -g )
( project_pane -t "${SESSION}" -n "Classifieds"  -d "${WP_DIR}plugins/classifieds" )
( project_pane -t "${SESSION}" -n "Hot Rod"      -d "${WP_DIR}themes/hot-rod" -g )
( project_pane -t "${SESSION}" -n "Low Rider"    -d "${WP_DIR}themes/low-rider" -g )
( project_pane -t "${SESSION}" -n "Motortrend"   -d "${WP_DIR}themes/motor-trend" -g )
( project_pane -t "${SESSION}" -n "MT Intl"      -d "${WP_DIR}themes/motor-trend-international" -g )
( project_pane -t "${SESSION}" -n "MU Plugins"   -d "${WP_DIR}mu-plugins/ten-shared" -g )
( project_pane -t "${SESSION}" -n "Vehicle Data" -d "${WP_DIR}plugins/vehicle-data" -g )
