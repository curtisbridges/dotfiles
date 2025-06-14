# Load the builtin alias expander
autoload -U expand-aliases

# Create a widget that expands then inserts space
expand-alias-space() {
  zle _expand_alias
  zle self-insert
}
zle -N expand-alias-space

# Create a widget that expands then accepts the line (Enter)
expand-alias-enter() {
  zle _expand_alias
  zle accept-line
}
zle -N expand-alias-enter

# Bind Space and Enter
bindkey ' ' expand-alias-space
bindkey '^M' expand-alias-enter  # ^M is Enter in Zsh key notation
