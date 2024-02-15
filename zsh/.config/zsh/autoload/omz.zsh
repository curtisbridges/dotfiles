# oh-my-zsh plugins
plugins=(
  aliases common-aliases
  aws
  docker docker-compose
  dotenv
  fd fzf
  git
  macos
  node nvm
  rust
  starship
  tmux
  vi-mode
  web-search frontend-search
)

# oh-my-zsh loading
source $ZSH/oh-my-zsh.sh
# ZSH_THEME=""  # disable because I handle my own themes
