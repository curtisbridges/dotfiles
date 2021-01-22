# setup linux specific config here
if [[ `uname` == 'Linux' ]]; then
  # Make 'open' work in Linux (I love it on macOS)
  alias open="xdg-open"

  if [[ `lsb_release -i -s` == 'Arch' ]]; then
    # source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    alias yup='yay -Syu' # Arch based linux
  else
    # source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
    alias bat=batcat
    alias aup='sudo apt update && sudo apt upgrade' # debian based linux
  fi
fi
