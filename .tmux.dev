#!/bin/sh
# vim:ft=sh:

SESSION=$USER

tmux has-session -t $SESSION
if [ $? -eq 0 ]; then
  echo "Session $SESSION already exists, attaching"
  sleep 1
  tmux attach -t $SESSION
  exit 0;
fi

tmux new-session -d -s $SESSION

tmux set-option -t $SESSION status-position top

tmux new-window -t $SESSION:0 -k

tmux new-window -t $SESSION:1 -k

tmux new-window -t $SESSION:2 -k
tmux send-keys -t $SESSION:2 "cd /var/www/vhosts/metagenicsadmin.com" C-m

tmux new-window -t $SESSION:3 -k
tmux set-window-option -t $SESSION:3 automatic-rename off
tmux send-keys -t $SESSION:3 "sssh cor" C-m
#tmux rename-window -t $SESSION:3 cor

tmux new-window -t $SESSION:4 -k
tmux set-window-option -t $SESSION:4 automatic-rename off
tmux send-keys -t $SESSION:4 "sssh demo" C-m
#tmux rename-window -t $SESSION:4 demo

tmux select-window -t $SESSION:0

tmux attach-session -t $SESSION
