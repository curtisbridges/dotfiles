# Since I use both Macs (Darwin) and Linux handle Linux platform specific setup here.

if [[ `uname` == 'Linux' ]]; then
  eval "$(brew shellenv)"

  # Make 'open' work in Linux (I love it on macOS)
  alias open="xdg-open"

  # trash aliases for linux
  alias trash=trash-put
  alias trpt=trash-put
  alias trem=trash-empty
  alias trls=trash-list
  alias trrs=trash-restore
  alias trrm=trash-rm

  # Requires `export NVM_DIR="$HOME/.nvm` prior to this line
  [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && \. "$(brew --prefix)/opt/nvm/nvm.sh"  # This loads nvm

  # source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  # alias bat=batcat

  # function because I stink at shell quotes
  function localip() {hostname -I | awk '{print $1}'}
fi
