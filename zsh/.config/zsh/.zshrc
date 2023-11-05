# Curtis Bridges (curtis@curtisbridges.com)
# ZSH config

if [ -n "$TMUX" ]; then
  PATH=""
  source /etc/zprofile
fi

function zsh_load() {
  local directory="$1"

  if [[ -d "$directory" ]]; then
    for file in "$directory"/*.zsh; do
      if [[ -f "$file" ]]; then
        source "$file"
      fi
    done
  else
    echo "Directory not found: $directory"
  fi
}

# important source files
zsh_load ${ZDOTDIR:-$HOME}/before

export STARSHIP_CONFIG=~/.config/starship/starship.toml
NVM_HOMEBREW=$(brew --prefix nvm)

# automatic loading code
zsh_load ${ZDOTDIR:-$HOME}/autoload

# completions
autoload -Uz compinit && compinit

# Use homebrew installed starship prompt
# eval "$(starship init zsh)"

# Prevent duplicate entries in PATH
typeset -U PATH
