# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Apps
alias cat=bat
alias top=htop
alias nf=neofetch
alias ping='prettyping --nolegend'
alias up=uptime
alias vim=nvim
alias yt=youtube-dl
alias yt4=youtube-dl --format mp4

# post-pended aliases
alias -g F='| fzf'

# general use
alias ls='exa -F'                                                    # ls
alias l='exa -lbF --git  --group-directories-first'                  # list, size, type, git
alias ll='exa -lbGF --git  --group-directories-first'                # long list
alias llm='exa -lbGd --git --sort=modified'                          # long list, modified date sort
alias la='exa -lbhHgUmua --git --color-scale'                        # all list
alias lx='exa -lbhHgUmua@ --time-style=long-iso --git --color-scale' # all + extended list

# specialty views
alias lS='exa -1'                                                    # one column, just names
alias lt='exa --tree --level=2'                                      # tree

# might as well go all in
alias cd='z'
alias zz='z -'

# Debug PATH
# NOTE: This double quote gets evaluated greedily and needs to be replaced with something else.
alias pp="echo $PATH | sed 's/:/\n/g'"
alias ppu="echo $PATH | sed 's/:/\n/g' | sort | uniq -c"

# Git aliases (in addition to plugin)
alias gdn='git diff --name-status'
alias gdsc='git diff --stat --color'
alias gupd='git stash && git fetch && git rebase $(git_develop_branch) && git stash pop'
alias gupm='git stash && git fetch && git rebase $(git_main_branch) && git stash pop'

alias todo='git grep -l TODO | xargs -n1 git blame -f -n -w | grep "$(git config user.name)" | grep TODO | sed "s/.\{9\}//" | sed "s/(.*)[[:space:]]*//"'

## Vim (Neovim)
alias v='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'

## Visual Studio Code
alias vsc='code .'
alias vscn='code --new-window'
alias vscw='code --wait'

alias displayfix='displayplacer "id:C0578CB1-69BC-4BF2-8AC9-9CB77A53922F res:2560x1440 hz:60 color_depth:8 scaling:on origin:(0,0) degree:0" "id:EE1EACBC-71DD-4752-82F2-653E163EDA1E res:1080x1920 hz:60 color_depth:8 scaling:on origin:(2560,-142) degree:90" "id:BACB7C4B-0DD2-44CB-A8B8-4C30E5DF7240 res:1080x1920 hz:60 color_depth:8 scaling:on origin:(-1080,-93) degree:270"'
