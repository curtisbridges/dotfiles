# Since I use both Macs (Darwin) and Linux handle macOS platform specific setup here.
if [[ `uname` == 'Darwin' ]]; then
    # Enable Colors in Terminal.app
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad

    # Command not found handler -- tell me which brew package to install
    HB_CNF_HANDLER="$(brew --repository)/Library/Taps/homebrew/homebrew-command-not-found/handler.sh"
    if [ -f "$HB_CNF_HANDLER" ]; then
        source "$HB_CNF_HANDLER";
    fi

    alias localip="ipconfig getifaddr en0"
    alias nq=networkQuality
fi
