#!/bin/sh

# Open a tmux window in a WordPress theme/plugin directory
# TODO:
#  - optional parameter for whether to run a command in a pane
#  - check if no parameters given, exit, or use some fallbacks
project_pane() {
  while getopts "d:g:l:n:t:" opt; do
    case "$opt" in
      d) DIRECTORY=${OPTARG}
        ;;

      g) GRUNT=${OPTARG}
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

  if [ -z "${GRUNT+x}" ]; then
    GRUNT=${GRUNT:='grunt local'}
  fi

  if [ -z "${DIRECTORY}" ]; then
    echo "Directory not specified" >&2
    exit
  fi

  tmux new-window -t "${SESSION}:${WIN_NUM}" -c "${DIRECTORY}" \; \
    split-window -h -l 112 -t "${SESSION}:${WIN_NUM}.0" -c "${DIRECTORY}" "tail -F ${LOG}" \; \
    split-window -v        -t "${SESSION}:${WIN_NUM}.1" -c "${DIRECTORY}" \; \
    split-window -v -l   6 -t "${SESSION}:${WIN_NUM}.0" -c "${DIRECTORY}"

  tmux select-pane -t "${SESSION}:${WIN_NUM}.0"

  if [ ! -z "${GRUNT}" ]; then
    tmux send-keys -t "${SESSION}:${WIN_NUM}.3" "${GRUNT}" C-m
  fi

  tmux rename-window -t "${SESSION}:${WIN_NUM}" "${NAME}"
}

