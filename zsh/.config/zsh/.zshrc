# Curtis Bridges (curtis@curtisbridges.com)
# ZSH config

# To display profiling info
# zmodload zsh/zprof

# if [ -n "$TMUX" ]; then
#   PATH=""
#   source /etc/zprofile
# fi

export KEYTIMEOUT=1

# History
HISTFILE=${ZDOTDIR:-$HOME}/.zhistory
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=1000
SAVEHIST=1000

# options
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

# config
source $ZDOTDIR/path.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh

# Configure OMZ
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.local/share/oh-my-zsh"

DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
COMPLETION_WAITING_DOTS="true"

# oh-my-zsh plugins
plugins=(
  aliases common-aliases
  # aws
  # docker docker-compose
  fzf
  git
  macos
  node
  starship
  tmux
  vi-mode
)

# oh-my-zsh loading
source $ZSH/oh-my-zsh.sh
# ZSH_THEME=""  # disable because I handle my own themes

source $ZDOTDIR/linux.zsh
source $ZDOTDIR/mac.zsh
source $ZDOTDIR/skillsoft.zsh

# Homebrew plugin setups
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $(brew --prefix)/share/zsh-you-should-use/you-should-use.plugin.zsh
source $(brew --prefix)/opt/zsh-fast-syntax-highlighting/share/zsh-fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

eval "$(zoxide init --cmd cd zsh)"

# completions
if [[ -o interactive ]]; then
  autoload -Uz compinit
  compinit
fi

# Use homebrew installed starship prompt
eval "$(starship init zsh)"

# Prevent duplicate entries in PATH
typeset -U PATH

# source $ZDOTDIR/nvm.zsh

# To display profiling info
# zprof
