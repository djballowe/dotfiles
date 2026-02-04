# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for a minimal, keyboard-driven Linux desktop environment (Arch Linux). There are no build tools, test suites, or install scripts — configs are deployed manually via symlinks to `~/.config/` or `~/`.

## Theme

All applications share the **Everforest** color scheme. When editing any config, maintain consistency:
- Background: `#2D353B`
- Foreground: `#D3C6AA`
- Accent (green): `#A7C080`
- Font: JetBrainsMono Nerd Font

## Architecture

The repo is organized by application, one directory per tool:

- **i3/** — Window manager config and keybindings (Super as mod key, vim-style navigation with hjkl). Startup block launches polybar, picom, dunst, mullvad, and opens default applications on assigned workspaces.
- **polybar/** — Status bar with custom shell scripts for VPN status, remote server monitoring (Plex storage, disc status), and MX Master mouse battery. Scripts source shared variables from `script-vars`.
- **alacritty/** — Terminal emulator. Auto-attaches to tmux on launch via `[shell]` config.
- **tmux/** — Terminal multiplexer. Vi-mode copy, mouse scrolling, base-index 1.
- **zsh/** — Shell config using Oh-My-Zsh + PowerLevel10k. Aliases map `vim` to `nvim`. SSH aliases use Mullvad VPN exclusion (`mullvad-exclude`).
- **rofi/** — Application launcher. `common.rasi` defines the shared theme; `drun.rasi` defines the search layout.
- **picom/** — Compositor with dual-kawase blur (strength 4) and per-app opacity rules (94% for Alacritty and Brave).
- **dunst/** — Notification daemon.
- **X/** — `.Xresources` for DPI and cursor settings.

## Key Relationships

- `script-vars` is sourced by polybar scripts for shared server connection details (IP, SSH port, key path) and color formatting variables.
- The zsh config (`zsh/.zshenv`) duplicates some of the same server variables — keep both in sync when changing server details.
- i3 config references polybar launch script (`polybar/launch.sh`), picom config, and wallpaper path (`~/pictures/papes/black-sand.jpg`).
