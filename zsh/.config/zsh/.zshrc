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
# HISTFILE=${ZDOTDIR:-$HOME}/.zhistory
# HIST_STAMPS="yyyy-mm-dd"
# HISTSIZE=1000
# SAVEHIST=1000
# Now that Atuin handles history, get rid of zsh's history clutter
HISTFILE=
HISTSIZE=0
SAVEHIST=0

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

DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
COMPLETION_WAITING_DOTS="true"

# ---------- Completion System ----------
source $ZDOTDIR/completions.zsh

# ---------- Plugin Manager: Antidote ----------
source "$(brew --prefix)"/share/antidote/antidote.zsh
antidote load
compinit -C

# Custom config settings split out into separate files.
source $ZDOTDIR/path.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/alias-expand.zsh
source $ZDOTDIR/functions.zsh

source $ZDOTDIR/linux.zsh
source $ZDOTDIR/mac.zsh
source $ZDOTDIR/skillsoft.zsh

# intelligent cd
eval "$(zoxide init --cmd cd zsh)"

# Use starship prompt
eval "$(starship init zsh)"

# Atuin intelligent history
eval "$(atuin init zsh)"

# Prevent duplicate entries in PATH
typeset -U PATH

# Enable aliases to work with sudo
alias sudo='sudo '

[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"

# To display profiling info
# zprof
