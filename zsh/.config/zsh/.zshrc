# Curtis Bridges (curtis@curtisbridges.com)
# ZSH config

export KEYTIMEOUT=1

# options
# -------
setopt hist_ignore_all_dups  # remove older duplicate entries from history
setopt hist_find_no_dups     # ignore duplicates when searching
setopt hist_reduce_blanks    # remove superfluous blanks from history items
setopt share_history         # share history between different instances of the shell
setopt prompt_subst          # allow command, param and arithmetic expansion in the prompt
setopt always_to_end         # move cursor to end if word had one match
setopt auto_cd               # auto cd when writing dir in the shell
setopt AUTO_PUSHD            # automatically add directories to a recent dir stack
setopt PUSHD_IGNORE_DUPS     # Do not store duplicates in the stack.
setopt PUSHD_SILENT          # Do not print the directory stack after pushd or popd.
setopt auto_list             # automatically list choices on ambiguous completion
setopt auto_menu             # automatically use menu completion
unsetopt correctall          # don't correct typo(ed) commands
unsetopt menu_complete       # insert first suggestion while autocompleting

# History
HISTFILE=${ZDOTDIR:-$HOME}/.zhistory
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=1000
SAVEHIST=1000

# Configure OMZ
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"
# DISABLE_AUTO_TITLE="true"
DISABLE_MAGIC_FUNCTIONS="true"
COMPLETION_WAITING_DOTS="true"

# important source files
source ${ZDOTDIR:-$HOME}/before/path.zsh
source ${ZDOTDIR:-$HOME}/before/exports.zsh

# required so tmux plugin will function with XDG_CONFIG_HOME
ZSH_TMUX_CONFIG=$XDG_CONFIG_HOME/tmux/tmux.conf
ZSH_TMUX_UNICODE=true
ZSH_TMUX_FIXTERM=true
export TMUX_PLUGIN_MANAGER_PATH="$XDG_DATA_HOME/tmux/plugins"

# oh-my-zsh plugins
plugins=(
  aliases
  autojump
  command-not-found
  common-aliases
  git git-extras git-flow
  macos
  nvm
  vi-mode tmux
  fzf
  web-search
  zoxide
)
# oh-my-zsh loading
source $ZSH/oh-my-zsh.sh
ZSH_THEME=""  # disable because I handle my own themes

# TODO Make this directory loader a function
# automatic loading code
for config_file (${ZDOTDIR:-$HOME}/autoload/*.zsh)
do
  source $config_file
done

# Recent directory stack
# TODO: Needs work, seems to be off-by-one
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# completions
autoload -Uz compinit && compinit

# Use homebrew installed starship prompt
eval "$(starship init zsh)"

# Prevent duplicate entries in PATH
typeset -U PATH
