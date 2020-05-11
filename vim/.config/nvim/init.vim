"Curtis Bridges <curtis@curtisbridges.com>
"init.vim

source $HOME/.config/nvim/general/settings.vim
source $HOME/.config/nvim/keys/mappings.vim
source $HOME/.config/nvim/vim-plug/plugins.vim
"source $HOME/.config/nvim/themes/onedark.vim

"TO BE CLEANED UP!

filetype plugin on
filetype plugin indent on
filetype indent on

"setting wrap while editing markdown files
autocmd FileType markdown set wrap

"Make double-<Esc> clear search highlights
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

"Delete trailing white space on save, useful for some filetypes ;)
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun
