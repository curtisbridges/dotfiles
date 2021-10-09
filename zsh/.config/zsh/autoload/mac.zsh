# Since I use both Macs (Darwin), Arch Linux (sometimes), and Debian based Linux (servers, etc.) handle
# platform specific setup here.

if [[ `uname` == 'Darwin' ]]; then
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

    # Node setup -- homebrew nvm lives in homebrew installed dirs
    # [ -s "$(brew --prefix)/opt/nvm/nvm.sh" ] && . "$(brew --prefix)/opt/nvm/nvm.sh" # This loads nvm
    # [ -s "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" ] && . "$(brew --prefix)/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion

    # iTerm2 integration
    # test -e /Users/cmb/.config/zsh/.iterm2_shell_integration.zsh && source /Users/cmb/.config/zsh/.iterm2_shell_integration.zsh || true
    # if [ $ITERM_SESSION_ID ]; then
    #     precmd() {
    #         echo -ne "\033]0;${PWD##*/}\007"
    #     }
    # fi
fi
