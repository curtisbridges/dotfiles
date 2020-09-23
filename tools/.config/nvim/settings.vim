"basic settings
set nocompatible

"Set utf8 as standard encoding and en_US as the standard language
set encoding=utf-8

"turn on syntax highlighting
syntax on

"Let's make it pretty
set termguicolors
set background=dark "use dark background with terminal

"directory handling
set autochdir "always change working directory to the buffer's

"backups
set noswapfile
set nobackup

"indentation settings
set expandtab "no tab characters
set smarttab
set expandtab
set shiftwidth=4 "auto-indent amount when using cindent, >>, << and stuff like that
set tabstop=4
set softtabstop=4 "when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set shiftround "when at 3 spaces, and I hit > ... go to 4, not 7
set nowrap "do not wrap line

set showmatch "show matching brackets
set matchtime=5 "how many tenths of a second to blink matching brackets
set list "we want to show tabs, to ensure we get them out of my files
"set listchars=tab:>-,trail:· "show tabs and trailing
set listchars=tab:\›\ ,trail:·,extends:>,precedes:<,eol:¬

"indentation settings
set autoindent
set smartindent

"set ignorecase "case insensitive by default
set smartcase "if there are caps, go case-sensitive
set infercase "case inferred by default

"line and column numbering
set number "turn on line numbers
set numberwidth=4 "We are good up to 9999 lines
set cursorline
set ruler "Always show current positions along the bottom
set linespace=0 "don't insert any extra pixel lines betweens rows
set scrolloff=10 "Keep 10 lines (top/bottom) for scope
set sidescrolloff=10 "Keep 5 lines at the size

"filesystem and term settings
set novisualbell
set noerrorbells "don't make noise
set hlsearch "highlight the search pattern while searching
set incsearch "BUT do highlight as you type you search phrase

set spell

set clipboard=unnamedplus

set splitbelow "Horizontal splits will automatically be below
set splitright "Vertical splits will automatically be to the right

