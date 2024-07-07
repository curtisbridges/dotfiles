# this is the bare bones setup to move everything to XDG dir
ZDOTDIR=$HOME/.config/zsh
export TERM=screen-256color

export MOZ_ENABLE_WAYLAND=1

# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Default Apps
export EDITOR="nvim"
export VISUAL="code"
export TERMINAL="alacritty"
# export BROWSER="/Applications/Safari.app"
export PAGER="less"

# required so tmux plugin will function with XDG_CONFIG_HOME
ZSH_TMUX_CONFIG=$XDG_CONFIG_HOME/tmux/tmux.conf
ZSH_TMUX_UNICODE=true
ZSH_TMUX_FIXTERM=true
export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME:-$HOME/tmux/plugins"

# Exported variables
# Node related
export NVM_DIR="$HOME/.nvm"

# Python
export PYTHON_HOME="${HOME}/.pyenv/shims"
export PATH=$PATH:$PYTHON_HOME

export STARSHIP_CONFIG=~/.config/starship/starship.toml
