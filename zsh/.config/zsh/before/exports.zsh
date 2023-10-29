# Exported variables

# FZF
export FZF_BASE=$(brew --prefix)/bin/fzf

# Make fzf smarter
# export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,.DS_STORE}"'
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g "!{node_modules/*,.git/*,.DS_STORE}"'
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --ansi'

# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '{....}'"
# export FZF_CTRL_T_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,.DS_STORE}"'
export FZF_CTRL_T_COMMAND='rg --files --follow --hidden -g "!{node_modules/*,.git/*,.DS_STORE}"'

# Node related
export PYTHON_HOME="${HOME}/.pyenv/shims"
export PATH=$PATH:$PYTHON_HOME
export NVM_DIR="$HOME/.nvm"

