#!/usr/bin/env bash

set -e  # Exit on error

# Define the config folders in .config directory
CONFIG_FOLDERS=(
  "ghostty"
  "aerospace"
  "karabiner"
  "spotify-player"
  "kitty"
)

# Define dotfiles in home directory (with the leading dot)
HOME_DOTFILES=(
  ".zshrc"
)

DOTFILES_DIR="$HOME/dotfiles"
CONFIG_DIR="$HOME/.config"
DOTFILES_CONFIG_DIR="$DOTFILES_DIR/config"

echo "=== Processing .config folders ==="
# Process each folder in .config
for folder in "${CONFIG_FOLDERS[@]}"; do
  source_path="$CONFIG_DIR/$folder"
  target_path="$DOTFILES_CONFIG_DIR/$folder"
  
  # Check if the source folder exists
  if [ ! -d "$source_path" ]; then
    echo "Warning: $source_path does not exist. Skipping."
    continue
  fi
  
  # Check if folder already exists in dotfiles
  if [ -d "$target_path" ]; then
    echo "Warning: $target_path already exists. Skipping."
    continue
  fi
  
  # Check if the source is already a symlink
  if [ -L "$source_path" ]; then
    echo "Warning: $source_path is already a symlink. Skipping."
    continue
  fi
  
  echo "Moving $source_path to $target_path"
  mv "$source_path" "$target_path"
  
  echo "Creating symlink from $target_path to $source_path"
  ln -s "$target_path" "$source_path"
  
  echo "✓ Successfully processed $folder"
done

echo -e "\n=== Processing home directory dotfiles ==="
# Process each dotfile in home directory
for file in "${HOME_DOTFILES[@]}"; do
  source_path="$HOME/$file"
  target_path="$DOTFILES_DIR/$file"
  
  # Check if the source file exists
  if [ ! -f "$source_path" ]; then
    echo "Warning: $source_path does not exist. Skipping."
    continue
  fi
  
  # Check if file already exists in dotfiles
  if [ -f "$target_path" ]; then
    echo "Warning: $target_path already exists. Skipping."
    continue
  fi
  
  # Check if the source is already a symlink
  if [ -L "$source_path" ]; then
    echo "Warning: $source_path is already a symlink. Skipping."
    continue
  fi
  
  echo "Moving $source_path to $target_path"
  mv "$source_path" "$target_path"
  
  echo "Creating symlink from $target_path to $source_path"
  ln -s "$target_path" "$source_path"
  
  echo "✓ Successfully processed $file"
done

echo -e "\nDone! Your dotfiles have been moved to $DOTFILES_DIR with symlinks in place."
