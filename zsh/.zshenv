# this is the bare bones setup to move everything to XDG dir
ZDOTDIR=$HOME/.config/zsh

# Other XDG paths
export XDG_DATA_HOME=${XDG_DATA_HOME:="$HOME/.local/share"}
export XDG_CACHE_HOME=${XDG_CACHE_HOME:="$HOME/.cache"}
export XDG_CONFIG_HOME=${XDG_CONFIG_HOME:="$HOME/.config"}

# Default Apps
export EDITOR="nvim"
export VISUAL="code -n"
export TERMINAL="iterm"
export BROWSER="safari"
export PAGER="less"
