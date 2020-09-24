"Curtis Bridges <curtis@curtisbridges.com>
"init.vim

source $HOME/.config/nvim/settings.vim
source $HOME/.config/nvim/mappings.vim
source $HOME/.config/nvim/subs.vim
source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/colors.vim

"TO BE CLEANED UP!

filetype plugin on
filetype plugin indent on
filetype indent on

"setting wrap while editing markdown files
autocmd FileType markdown set wrap

"Delete trailing white space on save, useful for some filetypes
"fun! CleanExtraSpaces()
"    let save_cursor = getpos(".")
"    let old_query = getreg('/')
"    silent! %s/\s\+$//e
"    call setpos('.', save_cursor)
"    call setreg('/', old_query)
"endfun

