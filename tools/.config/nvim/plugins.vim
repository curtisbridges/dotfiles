" Plugins
if !exists('g:vscode')

    " Load vim-plugged plugin manager
    call plug#begin('~/.vim/plugged')

    "
    " My Plugins!
    "
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Themes
    Plug 'gruvbox-community/gruvbox'
    "Plug 'flazz/vim-colorschemes'

    " finish plugin loading
    call plug#end()

    colorscheme gruvbox
    let g:airline_theme='gruvbox'
    let g:airline_powerline_fonts = 1

endif

