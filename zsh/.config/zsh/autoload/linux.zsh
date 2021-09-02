# setup linux specific config here

# TODO: convert to using $(brew --prefix)

if [[ `uname` == 'Linux' ]]; then
  # Make 'open' work in Linux (I love it on macOS)
  alias open="xdg-open"

  # make homebrew (on linux!) function
  set -o extendedglob
  if [[ -f "~/.linuxbrew/bin/brew" ]]; then
    eval $(~/.linuxbrew/bin/brew shellenv)
    [ -s "~/.linuxbrew/opt/nvm/nvm.sh" ] && . "~/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
    source ~/.linuxbrew/share/zsh-you-should-use/you-should-use.plugin.zsh
  elif [[ -f "/home/linuxbrew/.linuxbrew/bin/brew" ]]; then
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    [ -s "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh" ] && . "/home/linuxbrew/.linuxbrew/opt/nvm/nvm.sh"  # This loads nvm
    source /home/linuxbrew/.linuxbrew/share/zsh-you-should-use/you-should-use.plugin.zsh
  fi

  # source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  # alias bat=batcat

  # nvm & node setup
  #export NVM_DIR="$HOME/.nvm"
  # source $NVM_DIR/nvm.sh
fi
