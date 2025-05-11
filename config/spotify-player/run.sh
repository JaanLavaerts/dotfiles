#!/bin/bash

WINDOW_TITLE="spotify"
CMD="spotify_player"

open -na kitty --args --title "$WINDOW_TITLE" sh -c "$CMD"
