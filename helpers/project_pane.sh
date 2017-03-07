#!/bin/sh

# Open a tmux window in a WordPress theme/plugin directory
# TODO:
#  - optional parameter for whether to run a command in a pane
#  - check if no parameters given, exit, or use some fallbacks
project_pane() {
  while getopts ":d:gl:n:t:" opt; do
    case "$opt" in
      d) DIRECTORY=${OPTARG}
        ;;

      g) GRUNT=${OPTARG:-local}
        ;;

      l) LOG=${OPTARG}
        ;;

      n) NAME=${OPTARG}
        ;;

      t) SESSION=${OPTARG}
        ;;

      *) echo "Invalid Option: -${OPTARG}" >&2
        exit 1
        ;;

      :) echo "Option -${OPTARG} requires an argument." >&2
        exit 1
        ;;
    esac
  done

  WIN_NUM=$(tmux display-message -p '#{session_windows}')
  LOG=${LOG:-"../../debug.log"}

  if [ -z "${DIRECTORY}" ]; then
    echo "Directory not specified" >&2
    exit
  fi

  tmux new-window -t "${SESSION}:${WIN_NUM}" -c "${DIRECTORY}"
  tmux split-window -h -l 112 -t "${SESSION}:${WIN_NUM}.0" -c "${DIRECTORY}"
  tmux split-window -v -p 50 -t "${SESSION}:${WIN_NUM}.1" -c "${DIRECTORY}"
  tmux split-window -v -l 6 -t "${SESSION}:${WIN_NUM}.0" -c "${DIRECTORY}"
  if [ ! -n ${GRUNT} ]; then
    tmux send-keys -t "${SESSION}:${WIN_NUM}.3" "grunt ${GRUNT}"
  fi
  tmux select-pane -t "${SESSION}:${WIN_NUM}.0"
  tmux rename-window -t "${SESSION}:${WIN_NUM}" "${NAME}"

  tmux send-keys -t "${SESSION}:${WIN_NUM}.2" "tail -F ${LOG}" C-m
}

