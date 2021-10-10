# Curtis Bridges (curtis@curtisbridges.com)
# ZSH config

# Configure OMZ
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"
# DISABLE_AUTO_TITLE="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy-mm-dd"

export KEYTIMEOUT=1

# History
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
HISTSIZE=1000
SAVEHIST=1000

# required so tmux plugin will function with XDG_CONFIG_HOME
ZSH_TMUX_CONFIG=$XDG_CONFIG_HOME/tmux/tmux.conf
ZSH_TMUX_UNICODE=true
ZSH_TMUX_FIXTERM=true

export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME/tmux/plugins"

# Init
#export FZF_BASE=$(brew --prefix)/bin/fzf
#export FZF_DEFAULT_COMMAND=fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_DEFAULT_OPTS='--height 50% --layout=reverse --border --ansi'

# oh-my-zsh plugins
plugins=(
  alias-finder aliases
  autojump brew
  command-not-found
  common-aliases
  docker docker-compose
  frontend-search
  gh git git-auto-fetch git-extras git-flow
  node
  osx
  tmux
  web-search history-substring-search
)
# oh-my-zsh loading
source $ZSH/oh-my-zsh.sh

# automatic loading code
for config_file (${ZDOTDIR:-$HOME}/autoload/*.zsh)
do
  source $config_file
done

# Node related
export VOLTA_HOME="$HOME/.volta"
export PATH=$VOLTA_HOME/bin:$PATH

# options
# -------
setopt hist_ignore_all_dups  # remove older duplicate entries from history
setopt hist_find_no_dups     # ignore duplicates when searching
setopt hist_reduce_blanks    # remove superfluous blanks from history items
setopt share_history         # share history between different instances of the shell
setopt prompt_subst          # allow command, param and arithmetic expansion in the prompt
setopt always_to_end         # move cursor to end if word had one match
setopt auto_cd               # auto cd when writing dir in the shell
setopt auto_list             # automatically list choices on ambiguous completion
setopt auto_menu             # automatically use menu completion
unsetopt correctall          # don't correct typo(ed) commands
unsetopt menu_complete       # insert first suggestion while autocompleting

# vi keybinds
# NOTE: using vi bindings breaks fzf keybinds
#bindkey -v

# zmv
autoload -U zmv

# completions
autoload -Uz compinit && compinit

# Use homebrew installed starship prompt
eval "$(starship init zsh)"

# Prevent duplicate entries in PATH
typeset -U PATH
