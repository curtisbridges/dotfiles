# Exported variables

# FZF
export FZF_BASE=$(brew --prefix)/bin/fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --ansi'
export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '{....}'"

# Node related
export PYTHON_HOME="${HOME}/.pyenv/shims"
export PATH=$PATH:$PYTHON_HOME
export NVM_DIR="$HOME/.nvm"
