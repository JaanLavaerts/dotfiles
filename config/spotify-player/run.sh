#!/bin/bash

SESSION_NAME="spotify"
WINDOW_NAME="spotify"

tmux has-session -t "$SESSION_NAME" 2>/dev/null

if [ $? != 0 ]; then
  tmux new-session -s "$SESSION_NAME" -n "$WINDOW_NAME" -d 'spotify_player'

  tmux rename-window -t "${SESSION_NAME}:0" "$WINDOW_NAME"
fi

tmux attach-session -t "$SESSION_NAME"
