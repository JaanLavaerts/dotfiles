#!/bin/bash

TMUX_BIN="/opt/homebrew/bin/tmux"
SPOTIFY_PLAYER="/opt/homebrew/bin/spotify_player"
SESSION_NAME="default"
SPOTIFY_WINDOW_NAME="spotify"
DEFAULT_WINDOW_INDEX="zsh"

if ! $TMUX_BIN has-session -t $SESSION_NAME 2>/dev/null; then
    echo "Creating default session..."
    $TMUX_BIN new-session -d -s $SESSION_NAME
fi

if ! $TMUX_BIN list-windows -t $SESSION_NAME | grep -q "^$SPOTIFY_WINDOW_NAME"; then
    echo "Creating new window for spotify_player..."
    $TMUX_BIN new-window -t $SESSION_NAME -n $SPOTIFY_WINDOW_NAME "$SPOTIFY_PLAYER"
fi

$TMUX_BIN select-window -t $SESSION_NAME:$DEFAULT_WINDOW_INDEX
$TMUX_BIN attach-session -t $SESSION_NAME
