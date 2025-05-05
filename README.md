# Dotfiles

This repository contains my personal configuration files (dotfiles) for various command-line tools and applications. The repository structure mirrors my home directory layout for easy installation on new systems.

## Directory Structure

```
dotfiles/
├── config/
│   ├── ghostty/
│   ├── aerospace/
│   └── ...
├── .zshrc
└── ...
```

## About the Script

The included `dotfiles-manager.sh` script helps manage the dotfiles by:

- Moving configuration files from their original locations to this repository
- Creating symbolic links from this repository back to the original locations
- To customize which files the script manages, edit these arrays in the script:
  - `CONFIG_FOLDERS`: Folders from `$HOME/.config`
  - `HOME_DOTFILES`: Files from your home directory

Note: `.config` becomes `config` in the repository, and the rest of the files are stored in the root of the repository.
