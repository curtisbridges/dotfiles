" Curtis Bridges <curtis@curtisbridges.com>
" 2017-07-26
" .vimrc

" basic settings
set nocompatible

behave mswin

" turn on syntax highlighting
syntax on

set autochdir " always change working directory to the buffer's

if has("gui_running")
    set background=light " we plan to use a light background
    set columns=120 " perfect size for me
    set lines=40 " perfect size for me
    set mousehide " hide the mouse cursor when typing
    set guioptions-=tT "no tear offs
    set guifont=SF\ Mono\ Regular:h12
else
    set background=dark " use dark background with terminal
endif


" backups
"set backup
"set backupdir=~/backups
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
set listchars=tab:>-,trail:- " show tabs and trailing 
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

" filesystem and term settings
set ttyfast
set novisualbell
set noerrorbells " don't make noise
set wildchar=<TAB>      " Expansion in the command line..
set wildignore=*.o,*.obj,*.bak,*.exe,*.java~,*.class,*.jar
set suffixes=\.swp,\.exe,\.zip,\.gz,\.class,\.jar
"set makeprg=ant\ -emacs\ -find\ build.xml
"set makeef=ant.log
"set grepprg=find \/n
set tags=tags;src/**/tags
set hlsearch " highlight the search pattern while searching
set incsearch " BUT do highlight as you type you search phrase

" abbreviations!
" mispellings
iab THe The
iab teh the

