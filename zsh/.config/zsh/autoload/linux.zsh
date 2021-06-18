# setup linux specific config here
if [[ `uname` == 'Linux' ]]; then
  # Make 'open' work in Linux (I love it on macOS)
  alias open="xdg-open"

  # make homebrew (on linux!) function
  set -o extendedglob
  if [[ "~/.linuxbrew/bin/brew" ]] then
      eval $(~/.linuxbrew/bin/brew shellenv)
  elif [[ "/home/linuxbrew/.linuxbrew/bin/brew" ]] then
      eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
  fi

  # source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  source ~/.linuxbrew/share/zsh-you-should-use/you-should-use.plugin.zsh
  # alias bat=batcat

  #export NVM_DIR="$HOME/.nvm"
  # [ -s "~/.linuxbrew/opt/nvm/nvm.sh" ] && . "~/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
  # [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
fi
