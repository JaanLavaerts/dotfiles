#!/bin/bash

if ! tmux has-session -t default 2>/dev/null; then
    echo "Creating default session..."
    /opt/homebrew/bin/tmux new-session -d -s default
fi

if ! tmux has-session -t spotify 2>/dev/null; then
    echo "Creating spotify session..."
    /opt/homebrew/bin/tmux new-session -d -s spotify /opt/homebrew/bin/spotify_player
fi

/opt/homebrew/bin/tmux attach-session -t default
