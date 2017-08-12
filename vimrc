" Curtis Bridges <curtis@curtisbridges.com>
" 2017-08-11
" .vimrc

" basic settings
set nocompatible
behave mswin

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" turn on syntax highlighting
syntax on

set autochdir " always change working directory to the buffer's

" Let's make it pretty
try
    if has('gui_running')
        "colorscheme onehalfdark
        colorscheme two-firewatch
        "colorscheme onedark

        set background=light
        set columns=120
        set lines=40
        set mousehide " hide the mouse cursor when typing
        set guioptions-=tT "no tear offs
        set guifont=SF\ Mono\ Regular:h12

        "let g:lightline = { 'colorscheme': 'PaperColor_light', }
        let g:lightline = { 'colorscheme': 'twofirewatch', }
        "let g:lightline = { 'colorscheme': 'onedark', }
    else
        "colorscheme two-firewatch
        colorscheme onedark
        set background=dark " use dark background with terminal

        let g:lightline = { 'colorscheme': 'onedark', }
        "let g:lightline = { 'colorscheme': 'twofirewatch', }
    endif
catch
endtry

set laststatus=2
set cursorline

let g:two_firewatch_italics=1

" Specify a directory for plugins
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'plasticboy/vim-markdown'

" Initialize plugin system
call plug#end()

" backups
set nowritebackup
"set autowrite
set noswapfile
set nobackup

" indentation settings
set expandtab " no tab characters
set smarttab
set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set tabstop=4 
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set list " we do what to show tabs, to ensure we get them out of my files
set listchars=tab:>-,trail:· " show tabs and trailing 
"set listchars=tab:>- " show hard tabs 

set autoindent
set smartindent

" auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

" code indent as a block
vnoremap < <gv
vnoremap > >gv

filetype plugin on
filetype plugin indent on
filetype indent on

"set ignorecase " case insensitive by default
set smartcase " if there are caps, go case-sensitive
set infercase " case inferred by default
set nowrap " do not wrap line
set showmatch " show matching brackets
set matchtime=5 " how many tenths of a second to blink matching brackets 
set directory=/tmp " directory to place swap files in
set clipboard+=unnamed " share windows clipboard
set mouse=a " use mouse everywhere
set mousehide " hide the mouse while typing

" line and column numbering
set number " turn on line numbers
set numberwidth=4 " We are good up to 99999 lines
set ruler " Always show current positions along the bottom
set linespace=0 " don't insert any extra pixel lines betweens rows
set scrolloff=10 " Keep 10 lines (top/bottom) for scope
set sidescrolloff=10 " Keep 5 lines at the size
set noshowmode " Let our lightline show the mode

" filesystem and term settings
set ttyfast
set novisualbell
set noerrorbells " don't make noise
set wildchar=<TAB>      " Expansion in the command line..
set wildignore+=*~,*.swp,*.o,*.obj,*.bak,*.exe,*.class,*.jar,*.pyc
set wildignore+=*node_modules/**,*vendor/**,.git
set wildmenu  " Enable command-line completion
set suffixes=.swp,.exe,.zip,.gz,.class,.jar
set tags=tags;src/**/tags
set hlsearch " highlight the search pattern while searching
set incsearch " BUT do highlight as you type you search phrase

" abbreviations!
" mispellings
iab THe The
iab teh the

" Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

