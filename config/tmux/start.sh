#!/bin/bash

if ! tmux has-session -t default 2>/dev/null; then
    echo "Creating default session..."
    tmux new-session -d -s default
fi

if ! tmux has-session -t spotify 2>/dev/null; then
    echo "Creating spotify session..."
    tmux new-session -d -s spotify spotify_player
fi

tmux attach -t default
