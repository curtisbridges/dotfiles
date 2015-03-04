" Curtis Bridges <curtis.bridges@gmail.com>
" September 9, 2010
" _vimrc

" basic settings
set nocompatible

behave mswin
syntax on

set autochdir " always change working directory to the buffer's

if has("gui_running")
    set background=dark " we plan to use a dark background
    "colorscheme wombat " my color scheme (only works in GUI)
    set columns=140 " perfect size for me
    set lines=80 " perfect size for me, maximizes veritcally on a win/1600x1200 screen
    set mousehide " hide the mouse cursor when typing
    set guioptions-=tT "no tear offs
    set guifont=courier_new:h8:w5 " font
    "set guifont=sans_serif " font
    "set guifont=arial " font
endif

" indentation settings
"set isfname+=\  " Adds support for windows paths.
set expandtab " no tab characters
set smarttab
set shiftwidth=4 " auto-indent amount when using cindent, >>, << and stuff like that
set softtabstop=4 " when hitting tab or backspace, how many spaces should a tab be (see expandtab)
set tabstop=8 " real tabs should be 8, and they will show with
set shiftround " when at 3 spaces, and I hit > ... go to 4, not 5
set list " we do what to show tabs, to ensure we get them out of my files
"set listchars=tab:>-,trail:- " show tabs and trailing 
set listchars=tab:>- " show hard tabs 

set autoindent
set smartindent

"set ignorecase " case insensitive by default
set smartcase " if there are caps, go case-sensitive
set infercase " case inferred by default
set nowrap " do not wrap line
set showmatch " show matching brackets
set matchtime=5 " how many tenths of a second to blink matching brackets 
set directory=/tmp " directory to place swap files in
set clipboard+=unnamed " share windows clipboard
set mouse=a " use mouse everywhere

" show the matching paren or brace even if it is off screen
"inoremap ) )<left><c-o>%<c-o>:sleep 500m<CR><c-o>%<c-o>a

" code indent as a block
vnoremap < <gv
vnoremap > >gv

" line and column numbering
set number " turn on line numbers
set numberwidth=5 " We are good up to 99999 lines
set ruler " Always show current positions along the bottom

set linespace=0 " don't insert any extra pixel lines betweens rows
set scrolloff=10 " Keep 10 lines (top/bottom) for scope
set sidescrolloff=10 " Keep 5 lines at the size

" backups
set backup
set backupdir=~/backups
"set nowritebackup
set autowrite

" filesystem and term settings
set ttyfast
set novisualbell
set noerrorbells " don't make noise
set wildchar=<TAB>      " Expansion in the command line..
set wildignore=*.o,*.obj,*.bak,*.exe,*.java~,*.class,*.jar
set suffixes=\.swp,\.exe,\.zip,\.gz,\.class,\.jar
set makeprg=ant\ -emacs\ -find\ build.xml
set makeef=ant.log
"set grepprg=find \/n
set tags=tags;src/**/tags,sources/**/tags
set hlsearch " highlight the search pattern while searching
set incsearch " BUT do highlight as you type you search phrase

set mousehide " hide the mouse while typing

" Folding {
    set foldenable " Turn on folding
"    set foldmarker={,} " Fold C style code (only use this as default if you use a high foldlevel) 
    set foldmethod=syntax " Fold on the marker
    set foldlevel=100 " Don't autofold anything (but I can still fold manually)
    set foldminlines=8 " Only fold if the fold will save me lots of screen realestate
"    set foldopen=block,hor,mark,percent,quickfix,tag " what movements open folds 
    set foldopen=all " what movements open folds 
"    function SimpleFoldText() " {
"        return getline(v:foldstart).' '
"    endfunction " }
"    set foldtext=SimpleFoldText() " Custom fold text function (cleaner than default)
" }

" help settings
" For Win32 version, have "K" lookup the keyword in a help file
"if has("win32")
"  let winhelpfile='windows.hlp'
"  map K :execute "!start winhlp32 -k <cword> " . winhelpfile <CR>
"endif

" abbreviations!
" mispellings
iab THe The
iab teh the

" convenience
iab EMAIL curtis.bridges@gmail.com
nnoremap <F5> "=strftime("%m/%d/%Y")<CR>P
inoremap <F5> <C-R>=strftime("%m/%d/%Y")<CR>

" code shortcuts
iab SOUT System.out.println("");
iab SERR System.err.println("");
iab SIN System.in.readln();
iab SEX System.exit(-1);
iab TIME System.currentTimeMillis();
iab TRY try {<CR>}<CR>catch(Exception exc) {<CR>exc.printStackTrace();<CR>}
iab SWITCH switch() {<CR>case:<CR>break;<CR>default:<CR>System.err.println("Error.");<CR>}
iab RUN public void run() {<CR>}
iab ACT public void actionPerformed(ActionEvent event) {<CR>}
iab FOR for(int index=0; index<NUMBER; index++) {<CR>}
iab WHILE while(true) {<CR>}
iab DO do {<CR>} while(true);
iab ITER Iterator iter = something.iterator();<CR>while(iter.hasNext()) {<CR>Object object = iter.next();<CR>}
iab INT interface
iab PSF public static final 
iab PUB public
iab PRI private
iab PRO protected
iab SYNC synchronized
iab MAIN public static void main(String[] args) {<CR>}
iab 2str public String toString()<CR>{<CR>return "";<CR>}
iab EQUAL public boolean equal(Object object) {<CR>return super.equal(object);<CR>}<CR>
iab STACK exc.printStackTrace();
iab OBJ Object object
iab CLASS /**<CR>DOCUMENT<CR><CR>@author <a href="mailto:curtis.bridges@gmail.com">Curtis Bridges</a><CR>*/<CR>
iab METH /**<CR>Description<CR><CR>@param paramName Description<CR>@return ReturnDescription<CR>@throws Exception ExceptionCaseDescription<CR>/
iab HI System.out.println("Hello, World!");<CR>
iab CODE <CODE></CODE>

noremap <C-S-I> :call JavaInsertImport()<CR>
function! JavaInsertImport()
  exe "normal mz"
  let cur_class = expand("<cword>")
  try
    if search('^\s*import\s.*\.' . cur_class . '\s*;') > 0
      throw getline('.') . ": import already exist!"
    endif
    wincmd }
    wincmd P
    1
    if search('^\s*public.*\s\%(class\|interface\)\s\+' . cur_class) > 0
      1
      if search('^\s*package\s') > 0
        yank y
      else
        throw "Package definition not found!"
      endif
    else
      throw cur_class . ": class not found!"
    endif
    wincmd p
    normal! G
    " insert after last import or in first line
    if search('^\s*import\s', 'b') > 0
      put y
    else
      1
      put! y
    endif
    substitute/^\s*package/import/g
    substitute/\s\+/ /g
    exe "normal! 2ER." . cur_class . ";\<Esc>lD"
  catch /.*/
    echoerr v:exception
  finally
    " wipe preview window (from buffer list)
    silent! wincmd P
    if &previewwindow
      bwipeout
    endif
    exe "normal! `z"
  endtry
endfunction


"let java_highlight_all = 1

" Helpful mappings when creating a new object
" Type: Object o<F2>
" Get:  Object o = new Object();
" F3 leaves the cursor between the parentheses.
inoremap <buffer> <F2> <C-O>A = new <Esc>^yE<End>pA();<CR>
inoremap <buffer> <F3> <C-O>A = new <Esc>^yE<End>pA();<Left><Left>

" makes the current buffer the only one on the screen
map <F1> :only<CR>
" key mappings
" maps to window's F2 (save)
"map <F2> :w<CR> 
" next match
"map <F3> /<C-R><C-W><CR>
" Java import stuff
"map <F6> :JavaRun<CR>
"map <F7> :JavaRun 

" maps to window's ctrl-f (find)
map <C-F> :promptfind<CR>
" maps to window's ctrl-s (save)
map <C-S> :w<CR> 
" maps to window's ctrl-o (open)
map <C-O> :browse confirm e<CR>
" maps to window's ctrl-h (find and replace)
map <C-H> :promptrepl<CR>
" maps to window's ctrl-p (print)
map <C-P> :hardcopy<CR> 
" maps to window's ctrl-n (new)
map <C-N> :tabnew<CR>
" map to match braces/parens/brackets
map <C-[> %

" this will remove the current buffer from the buffer list
"map <C-K> :bd<CR>
"map <C-Delete> :bd<CR>
" this will cycle through the current buffers
map <C-TAB> :tabnext<CR>
map <C-S-TAB> :tabprev<CR>
" Despite behave mswin, ctrl-v never seems to work so fix it here for now
map <C-V> "+gP

" windows (vim type), remember <C-W><C-W> switches between the windows
"map <C-Space> :e #<CR>
"map <C-Space> :stag <cword><CR>
" quits vim, saving all buffers
"map <C-Q> :wqall<CR>

" Opening and closing braces
"imap <C-B> {<CR>}<C-O>O

" automatically maximize gvim on start
"autocmd GUIEnter * simalt ~x
autocmd Filetype gitcommit setlocal spell textwidth=72

