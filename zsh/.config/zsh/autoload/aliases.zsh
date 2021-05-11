# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en0"

# Apps
alias cat=bat
alias top=htop
alias nf=neofetch
alias ping='prettyping --nolegend'
alias vim=nvim
alias yt=youtube-dl
alias yt4=youtube-dl --format mp4

# general use
alias ls='exa'                                                       # ls
alias l='exa -lbF --git  --group-directories-first'                  # list, size, type, git
alias ll='exa -lbGF --git  --group-directories-first'                # long list
alias llm='exa -lbGd --git --sort=modified'                          # long list, modified date sort
alias la='exa -lbhHgUmua --git --color-scale'                        # all list
alias lx='exa -lbhHgUmua@ --time-style=long-iso --git --color-scale' # all + extended list

# specialty views
alias lS='exa -1'                                                       # one column, just names
alias lt='exa --tree --level=2'                                         # tree
