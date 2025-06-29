# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"

# Apps
alias cat=bat
alias top=htop
alias nf=neofetch
alias ping='prettyping --nolegend'
alias up=uptime
alias vim=nvim
alias yt=yt-dlp
alias yt4=yt-dlp --format mp4
alias hl='rg --passthru'

# post-pended aliases
alias -g F='| fzf'
alias -g H='| rg --passthru'

# general use
alias ls='eza -F'                                                    # ls
alias l='eza -lbF --git  --group-directories-first'                  # list, size, type, git
alias ll='eza -lbGF --git  --group-directories-first'                # long list
alias llm='eza -lbGd --git --sort=modified'                          # long list, modified date sort
alias la='eza -lbhHgUmua --git --color-scale'                        # all list
alias lx='eza -lbhHgUmua@ --time-style=long-iso --git --color-scale' # all + extended list

# specialty views
alias lS='eza -1'                                                    # one column, just names
alias lt='eza --tree --level=2'                                      # tree

# Debug PATH
# NOTE: This double quote gets evaluated greedily and needs to be replaced with something else.
alias pp="echo $PATH | sed 's/:/\n/g'"
alias ppu="echo $PATH | sed 's/:/\n/g' | sort | uniq -c"

alias todo='git grep -l TODO | xargs -n1 git blame -f -n -w | grep "$(git config user.name)" | grep TODO | sed "s/.\{9\}//" | sed "s/(.*)[[:space:]]*//"'

# developer specific aliases
alias yi='yarn install'

## Vim (Neovim)
# fzf + nvim
alias nf='fzf -m --preview="bat --color=always" --bind "enter:become(nvim {})"'
alias v='fd --type f --hidden --exclude .git | fzf-tmux -p --reverse | xargs nvim'

# Unalias the common-aliases for these commends (from omz plugin common-aliases)
# unalias rm
# unalias cp
# unalias mv

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# Git aliases (in addition to plugin)
alias gdn='git diff --name-status'
alias gdsc='git diff --stat --color'
alias gupd='git stash && git fetch && git rebase $(git_develop_branch) && git stash pop'
alias gupm='git stash && git fetch && git rebase $(git_main_branch) && git stash pop'
alias gcoa='git checkout -- .'
alias gdbd='git diff $(git merge-base develop HEAD)'
alias gdbm='git diff $(git merge-base main HEAD)'

unalias gup # deprecated git alias that conflicts with one of my functions

# Like oh-my-zsh git aliases for Git Flow branches
# Diff current branch vs develop
alias gdd='git diff develop...HEAD'

# Diff current branch vs main
alias gdm='git diff main...HEAD'

# Diff current branch vs a release branch: usage: gdr 1.2.0 → compares to release/1.2.0
gdr() {
  if [[ -z $1 ]]; then
    echo 'Usage: gdr <name> (e.g., gdr 1.2.0 → release/1.2.0)'
    return 1
  fi
  git diff release/$1...HEAD
}

# Diff current branch vs a feature branch: usage: gdf my-feature
gdf() {
  if [[ -z $1 ]]; then
    echo 'Usage: gdf <name> (e.g., gdf my-feature → feature/my-feature)'
    return 1
  fi
  git diff feature/$1...HEAD
}

# Diff current branch vs a hotfix branch: usage: gdh urgent-fix
gdh() {
  if [[ -z $1 ]]; then
    echo 'Usage: gdh <name> (e.g., gdh urgent-fix → hotfix/urgent-fix)'
    return 1
  fi
  git diff hotfix/$1...HEAD
}
