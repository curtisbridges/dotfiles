# Since I use both Macs (Darwin), Arch Linux (sometimes), and Debian based Linux (servers, etc.) handle
# platform specific setup here.

if [[ `uname` == 'Darwin' ]]; then
    # Enable Colors in Terminal.app
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad

    source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
    source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

    # Command not found handler -- tell me which brew package to install
    HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
    if [ -f "$HB_CNF_HANDLER" ]; then
        source "$HB_CNF_HANDLER";
    fi

    # Homebrew sbin
    export PATH="$(brew --prefix)/bin:$PATH"
    export PATH="$(brew --prefix)/sbin:$PATH"

    alias localip="ipconfig getifaddr en0"
fi
