"Curtis Bridges <curtis@curtisbridges.com>
"init.vim

source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/autocmds.vim
source $HOME/.config/nvim/subs.vim
source $HOME/.config/nvim/functions.vim

" Only use plugins if not running within vscode.
if !exists('g:vscode')
    source $HOME/.config/nvim/plugins.vim
endif

source $HOME/.config/nvim/colors.vim

