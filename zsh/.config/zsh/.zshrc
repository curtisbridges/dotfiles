# Curtis Bridges (curtis@curtisbridges.com)
# ZSH config

if [ -n "$TMUX" ]; then
  PATH=""
  source /etc/zprofile
fi

# important source files
source ${ZDOTDIR:-$HOME}/before/omz.zsh
source ${ZDOTDIR:-$HOME}/before/options.zsh
source ${ZDOTDIR:-$HOME}/before/path.zsh
source ${ZDOTDIR:-$HOME}/before/exports.zsh
source ${ZDOTDIR:-$HOME}/before/tmux.zsh
source ${ZDOTDIR:-$HOME}/before/bun.zsh

export STARSHIP_CONFIG=~/.config/starship/starship.toml
NVM_HOMEBREW=$(brew --prefix nvm)

# TODO Make this directory loader a function
# automatic loading code
for config_file (${ZDOTDIR:-$HOME}/autoload/*.zsh)
do
  source $config_file
done

# Recent directory stack
# TODO: Needs work, seems to be off-by-one
# alias d='dirs -v'
# for index ({1..9}) alias "$index"="cd +${index}"; unset index

# completions
autoload -Uz compinit && compinit

# Use homebrew installed starship prompt
# eval "$(starship init zsh)"

# Prevent duplicate entries in PATH
typeset -U PATH
