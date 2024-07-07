# Since I use both Macs (Darwin) and Linux handle macOS platform specific setup here.
if [[ `uname` == 'Darwin' ]]; then
    # Enable Colors in Terminal.app
    export CLICOLOR=1
    export LSCOLORS=ExFxBxDxCxegedabagacad

    alias localip="ipconfig getifaddr en0"
    alias nq=networkQuality
fi
