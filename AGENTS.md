# AGENTS.md

This file provides guidance to coding agents working in this repository.

## Overview

Personal dotfiles for a minimal, keyboard-driven Arch Linux desktop. The repo contains both a Wayland setup (Hyprland and Waybar) and an X11 setup (i3, Polybar, and Picom). There are no build tools, test suites, or install scripts — configs are deployed manually via symlinks to `~/.config/` or `~/`.

## Theme

All applications share the **Everforest** color scheme. When editing any config, maintain consistency:
- Background: `#2D353B`
- Foreground: `#D3C6AA`
- Accent (green): `#A7C080`
- Font: JetBrainsMono Nerd Font

## Architecture

The repo is organized by application, one directory per tool:

- **hypr/** — Hyprland, Hyprpaper, Hyprlock, and Hypridle configuration. `hyprland.lua` requires `colors.lua`; the legacy `hyprland.conf` is retained temporarily for migration rollback. Hyprlock continues to source `colors.conf`; keep the Lua and Hyprlang color files synchronized. `scripts/` contains helpers for a headless Sunshine streaming display.
- **waybar/** — Wayland status bar configured with JSONC and CSS, plus Mullvad VPN and drive-status scripts.
- **i3/** — Window manager config and keybindings (Super as mod key, vim-style navigation with hjkl). Startup block launches polybar, picom, dunst, mullvad, and opens default applications on assigned workspaces.
- **polybar/** — Status bar with custom shell scripts for VPN status, remote server monitoring (Plex storage, disc status), and MX Master mouse battery. Scripts source shared variables from `script-vars`.
- **alacritty/** — Terminal emulator. Auto-attaches to tmux on launch via `[shell]` config.
- **tmux/** — Terminal multiplexer. Vi-mode copy, mouse scrolling, base-index 1.
- **zsh/** — Shell config using Oh-My-Zsh + PowerLevel10k. Aliases map `vim` to `nvim`. SSH aliases use Mullvad VPN exclusion (`mullvad-exclude`).
- **rofi/** — Application launcher. `common.rasi` defines the shared theme; `drun.rasi` defines the search layout.
- **picom/** — Compositor with dual-kawase blur (strength 4) and per-app opacity rules (94% for Alacritty and Brave).
- **dunst/** — Notification daemon.
- **gtk-3.0/** — GTK 3 theme, icon, font, cursor, and dark-mode preferences.
- **X/** — `.Xresources` for DPI and cursor settings.

## Key Relationships

- `script-vars` is sourced by Polybar and Waybar scripts for shared server connection details (IP, SSH port, key path) and color formatting variables.
- The zsh config (`zsh/.zshenv`) duplicates some of the same server variables — keep both in sync when changing server details.
- i3 config references polybar launch script (`polybar/launch.sh`), picom config, and wallpaper path (`~/pictures/papes/black-sand.jpg`).
- Hyprland's Lua config requires other Lua files in `hypr/`, references Waybar, and invokes scripts under `hypr/scripts/`.
- Polybar and Waybar contain parallel VPN and drive-status scripts. Check both when changing shared behavior, while preserving bar-specific formatting.

## Editing and Validation

- Keep changes scoped and preserve each application's syntax, comments, and indentation. `waybar/config.jsonc` contains comments and must not be processed as strict JSON.
- Keep scripts executable. Run `bash -n` on changed shell scripts and ShellCheck when installed.
- Do not replace machine-specific usernames, paths, monitors, devices, or server values unless requested and all references have been checked.
- Do not commit credentials, tokens, private keys, or newly discovered secrets.
- There is no repository-wide test command. Use application-native checks when available, then run `git diff --check`.
- Do not automatically restart the user's live desktop, bars, or shell. Report the relevant reload command instead.
- Hardware- and service-dependent checks may require SSH hosts, Mullvad, Solaar, mounted drives, displays, or optical media.
- Preserve unrelated worktree changes.
