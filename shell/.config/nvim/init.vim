"Curtis Bridges <curtis@curtisbridges.com>
"init.vim

if exists('+termguicolors')
  let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/autocmds.vim
source $HOME/.config/nvim/substitutions.vim
source $HOME/.config/nvim/functions.vim

" Only use plugins if not running within vscode.
if !exists('g:vscode')
    source $HOME/.config/nvim/plugins.vim
endif

source $HOME/.config/nvim/colors.vim
