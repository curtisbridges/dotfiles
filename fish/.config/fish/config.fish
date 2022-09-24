### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/bin $fish_user_paths

# Get all homebrew binaries
fish_add_path $(brew --prefix)/bin

# Allow injection of `asdf` binaries into $PATH.
# This should come after any of your own modifications to $PATH.
source $(brew --prefix)/opt/asdf/asdf.fish

### EXPORT ###
set fish_greeting                         # Supresses fish's intro message
set TERM "xterm-256color"                 # Sets the terminal type
set EDITOR "vim"                          # $EDITOR use vim in terminal
set VISUAL "code -nw"                     # $VISUAL use VS Code in GUI mode

### SET MANPAGER
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

### FZF integration ###
set fzf_preview_dir_cmd exa --all --color=always
set fzf_fd_opts --hidden --exclude=.git
### END FZF ###

function sudo!!
    eval sudo $history[1]
end

# Functions needed for !! and !$
function __history_previous_command
  switch (commandline -t)
  case "!"
    commandline -t $history[1]; commandline -f repaint
  case "*"
    commandline -i !
  end
end

function __history_previous_command_arguments
  switch (commandline -t)
  case "!"
    commandline -t ""
    commandline -f history-token-search-backward
  case "*"
    commandline -i '$'
  end
end

# The bindings for !! and !$
if [ "$fish_key_bindings" = "fish_vi_key_bindings" ];
  bind -Minsert ! __history_previous_command
  bind -Minsert '$' __history_previous_command_arguments
else
  bind ! __history_previous_command
  bind '$' __history_previous_command_arguments
end

if status is-interactive
  # Install Starship
  starship init fish | source
  source (jump shell fish | psub)
end
