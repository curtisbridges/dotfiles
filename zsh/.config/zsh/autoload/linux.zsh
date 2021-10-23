# setup linux specific config here

# TODO: convert to using $(brew --prefix)

if [[ `uname` == 'Linux' ]]; then
  # Make 'open' work in Linux (I love it on macOS)
  alias open="xdg-open"

  # trash aliases for linux
  alias trash=trash-put
  alias trpt=trash-put
  alias trem=trash-empty
  alias trls=trash-list
  alias trrs=trash-restore
  alias trrm=trash-rm

  # make homebrew (on linux!) function
  set -o extendedglob
  if [[ -f "~/.linuxbrew/bin/brew" ]]; then
    eval $(~/.linuxbrew/bin/brew shellenv)
    source ~/.linuxbrew/share/zsh-you-should-use/you-should-use.plugin.zsh
  elif [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    source /home/linuxbrew/.linuxbrew/share/zsh-you-should-use/you-should-use.plugin.zsh
  fi
  # source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  # alias bat=batcat
fi
