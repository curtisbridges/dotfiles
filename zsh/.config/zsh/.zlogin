##
## .zlogin -- executed after .zshrc
##

# NVM
export NVM_DIR=~/.nvm

# FZF
export FZF_BASE="${HOMEBREW_PREFIX:-/opt/homebrew}/bin/fzf"

# Make fzf smarter
# export FZF_DEFAULT_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,.DS_STORE}"'
export FZF_DEFAULT_COMMAND='rg --files --follow --hidden -g "!{node_modules/*,.git/*,.DS_STORE}"'
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --ansi'

# export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
# export FZF_CTRL_T_COMMAND="fd --type f --hidden --follow --exclude '{....}'"
# export FZF_CTRL_T_COMMAND='rg --files --follow --no-ignore-vcs --hidden -g "!{node_modules/*,.git/*,.DS_STORE}"'
export FZF_CTRL_T_COMMAND='rg --files --follow --hidden -g "!{node_modules/*,.git/*,.DS_STORE}"'

# bind control-e to new directory keybind
zle     -N            fzf-cd-widget
bindkey -M emacs '\C-e' fzf-cd-widget
bindkey -M vicmd '\C-e' fzf-cd-widget
bindkey -M viins '\C-e' fzf-cd-widget

# unbind alt-c just to be clean
bindkey -rM emacs '\ec'
bindkey -rM vicmd '\ec'
bindkey -rM viins '\ec'

# Only do this once per login shell, not every new prompt shell.
if [[ -n "$SSH_AUTH_SOCK" && -f "${HOME}/.ssh/id_rsa" ]]; then
  ssh-add -l &> /dev/null || ssh-add "${HOME}/.ssh/id_rsa" &> /dev/null
fi
