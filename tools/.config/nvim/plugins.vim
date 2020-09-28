" Plugins

" Only use plugins if not running within vscode.
if !exists('g:vscode')

    " Load vim-plugged plugin manager
    call plug#begin('~/.vim/plugged')

    "
    " My Plugins!
    "
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'           " Set up fzf and fzf.vim

    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Themes
    "Plug 'flazz/vim-colorschemes'
    Plug 'morhetz/gruvbox'
    colorscheme gruvbox

    Plug 'leafgarland/typescript-vim'

    " finish plugin loading
    call plug#end()

    "
    " Plugin configuration
    "
    let g:airline_theme='gruvbox'
    let g:airline_powerline_fonts = 1

     let g:coc_global_extensions = [
    'coc-emmet', 'coc-css', 'coc-html', 
    'coc-json', 'coc-prettier', 'coc-tsserver'
    ]

   " make fzf use ag so it leverages .gitignores
    let $FZF_DEFAULT_COMMAND = 'ag -g ""'

    " Apply AutoFix to problem on the current line.
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Show autocomplete when Tab is pressed
    inoremap <silent><expr> <Tab> coc#refresh()

    " GoTo code navigation.
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

endif

filetype plugin on
filetype plugin indent on
filetype indent on

