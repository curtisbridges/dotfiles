# editor commands
alias e="$EDITOR"
alias v="$VISUAL"

# -> Prevents accidentally clobbering files.
alias mkdir='mkdir -p'

# Default to human readable figures
alias df='df -h'
alias du='du -h'

# alias less='less -r'                        # raw control characters
alias whence='type -a'                        # where, of a sort
alias grep='grep --color'                     # show differences in color

# Some shortcuts for different directory listings
alias ls='ls -FHG'
alias la='ls -al'
alias ll='ls -l'

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Get week number
alias week='date +%V'
# Stopwatch
alias timer='echo "Timer started. Stop with Ctrl-D." && date && time cat && date'

# Recursively delete `.DS_Store` files
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"

# Apps
alias cat=bat
alias code='code -n'
alias top=htop
alias nf=neofetch
alias ping='prettyping --nolegend'
alias vim=nvim
alias yt=youtube-dl
alias yt4=youtube-dl --format mp4

# Update and Upgrade Homebrew
if [[ `uname` == 'Darwin' ]]; then
    alias bup='brew update && brew upgrade && brew upgrade --cask --greedy && brew doctor'
else
    alias aup='sudo apt update && sudo apt upgrade' # debian based linux
    alias yup='yay -Syu' # Arch based linux

    # Make 'open' work in Linux (I love it on macOS)
    alias open="xdg-open"
fi
alias nup='npm i -g npm; npm update -g'

