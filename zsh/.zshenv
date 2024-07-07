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

# bun completions
# [ -s "/Users/cmb/.bun/_bun" ] && source "/Users/cmb/.bun/_bun"
