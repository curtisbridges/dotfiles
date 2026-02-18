#!/usr/bin/env zsh
# .zshenv: Zsh environment file. Gets is loaded for every kind of shell session.
# ------------------------------------------------------------------------------

# Set up XDG base directories.
# Spec: https://specifications.freedesktop.org/basedir-spec/latest/index.html
# ------------------------------------------------------------------------------
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
export XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
export XDG_STATE_HOME=${XDG_STATE_HOME:-$HOME/.local/state}
export XDG_RUNTIME_DIR=${XDG_RUNTIME_DIR:-$HOME/.runtime}

## Make sure directories actually exist
xdg_dirs=("$XDG_CONFIG_HOME" "$XDG_CACHE_HOME" "$XDG_DATA_HOME" "$XDG_STATE_HOME" "$XDG_RUNTIME_DIR")
for dir in "${xdg_dirs[@]}"; do
  if [[ ! -d "$dir" ]]; then
    mkdir -p "$dir"
  fi
done

# Set $ZDOTDIR here. All other Zsh related configuration happens there.
# ------------------------------------------------------------------------------
export ZDOTDIR=${ZDOTDIR:-$XDG_CONFIG_HOME/zsh}

# Default Apps
export EDITOR="nvim"
export VISUAL="code"
export PAGER="less"

# Exported variables
export TERM=screen-256color
export MOZ_ENABLE_WAYLAND=1

export STARSHIP_CONFIG="${XDG_CONFIG_HOME}/starship/starship.toml"
export BROWSE_COMPONENTS=false

