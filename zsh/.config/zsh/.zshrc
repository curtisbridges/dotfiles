
# ZSH config
if [ -n "$TMUX" ]; then
  PATH=""
  source /etc/zprofile
fi

# Enable Vi mode
bindkey -v
export KEYTIMEOUT=1

# History configuration
HISTFILE=~/.zsh_history
HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=10000
SAVEHIST=10000
ZSH_THEME=""  # disable because I handle my own themes

# options
# setopt hist_ignore_all_dups  # remove older duplicate entries from history
# setopt hist_find_no_dups     # ignore duplicates when searching
# setopt hist_reduce_blanks    # remove superfluous blanks from history items
# setopt share_history         # share history between different instances of the shell
# setopt prompt_subst          # allow command, param and arithmetic expansion in the prompt
# setopt always_to_end         # move cursor to end if word had one match
# setopt auto_cd               # auto cd when writing dir in the shell
# setopt AUTO_PUSHD            # automatically add directories to a recent dir stack
# setopt PUSHD_IGNORE_DUPS     # Do not store duplicates in the stack.
# setopt PUSHD_SILENT          # Do not print the directory stack after pushd or popd.
# setopt auto_list             # automatically list choices on ambiguous completion
# setopt auto_menu             # automatically use menu completion
# unsetopt correctall          # don't correct typo(ed) commands
# unsetopt menu_complete       # insert first suggestion while autocompleting

# Basic settings
setopt AUTO_CD                   # Auto changes to a directory without typing cd
setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format
setopt SHARE_HISTORY             # Share history between all sessions
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file

DISABLE_AUTO_TITLE="true"
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
COMPLETION_WAITING_DOTS="true"

# additional config
source $ZDOTDIR/linux.zsh
source $ZDOTDIR/mac.zsh

source $ZDOTDIR/path.zsh
source $ZDOTDIR/aliases.zsh
source $ZDOTDIR/functions.zsh

# Install zinit if not installed
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -f ${ZINIT_HOME}/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$(dirname $ZINIT_HOME)"
    command git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source zinit
source "${ZINIT_HOME}/zinit.zsh"

# Load core plugins with careful ordering
zinit wait lucid for \
    zsh-users/zsh-completions \
    zdharma-continuum/fast-syntax-highlighting \
    zsh-users/zsh-autosuggestions

# Explicitly load history substring search with vi mode compatibility
zinit light zsh-users/zsh-history-substring-search

# Load fzf with keybindings and completion
zinit ice from"gh-r" as"command" \
    atclone"./install --bin" \
    atpull"%atclone"
zinit light junegunn/fzf

# Load fzf zsh key bindings
zinit snippet OMZP::fzf/fzf.plugin.zsh

# Ensure fzf key bindings
if command -v fzf &> /dev/null; then
    # Ctrl-T: paste selected files and dirs into command line
    bindkey "^T" fzf-file-widget

    # Ctrl-R: search through command history
    bindkey "^R" fzf-history-widget

    # Alt-C: cd into selected directory
    bindkey "^[c" fzf-cd-widget
fi

# NVM configuration
export NVM_DIR="$HOME/.nvm"
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true

# Load NVM with performance optimizations
zinit ice wait"0" lucid
zinit light lukechilds/zsh-nvm

# Load fzf
zinit ice from"gh-r" as"command"
zinit light junegunn/fzf

# Load starship prompt
zinit ice as"command" from"gh-r" \
          cp"starship -> /usr/local/bin/starship" \
          atclone"./starship init zsh > init.zsh" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship

# Load zoxide
zinit ice wait"0" lucid from"gh-r" as"command" mv"zoxide* -> zoxide" \
    atclone"./zoxide init zsh > init.zsh" atpull"%atclone" src"init.zsh" \
    atload'alias cd=z'
zinit light ajeetdsouza/zoxide

# Git aliases and functionality
zinit snippet OMZP::git

# Tmux aliases and functionality
zinit snippet OMZP::tmux

# Completion settings
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'  # Case insensitive completion

# Homebrew plugin setups
# source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $(brew --prefix)/share/zsh-you-should-use/you-should-use.plugin.zsh

# History substring search configuration
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=bg=green,fg=white,bold
export HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=bg=red,fg=white,bold

# Vi mode customizations
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select

# Additional Vi mode key bindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey -M vicmd 'H' beginning-of-line
bindkey -M vicmd 'L' end-of-line

# Use less for man syntax highlighting:
export MANPAGER="less -R --use-color -Dd+r -Du+b"

# Set terminal title dynamically
precmd() {
  # Set the terminal title to current command or directory
  # if [[ "$TERM" == *"xterm"* ]] || [[ "$TERM" == *"screen"* ]] || [[ "$TERM_PROGRAM" == "WezTerm" ]]; then
  if [[ "$TERM" == *"xterm"* ]] || [[ "$TERM" == *"screen"* ]]; then
    # print -Pn "\e]2;%n@%m: %~\a"  # Shows user@host: current directory
    print -Pn "\e]2;%~\a"  # Shows current directory
  fi
}

autoload -Uz compinit
compinit

