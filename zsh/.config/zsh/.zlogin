##
## .zlogin -- executed after .zshrc
##
NVM_HOMEBREW=$(brew --prefix nvm)

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

# bind control-e to new directory keybind
zle     -N            fzf-cd-widget
bindkey -M emacs '\C-e' fzf-cd-widget
bindkey -M vicmd '\C-e' fzf-cd-widget
bindkey -M viins '\C-e' fzf-cd-widget

# unbind alt-c just to be clean
bindkey -rM emacs '\ec'
bindkey -rM vicmd '\ec'
bindkey -rM viins '\ec'

source $ZDOTDIR/skillsoft.zsh
