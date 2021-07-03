"Key Mappings

nnoremap <leader>w :w<cr>

" jj escape
inoremap jj <Esc>
inoremap jk <Esc>
inoremap kk <Esc>

"auto indent pasted text
"nnoremap p p=`]<C-o>
"nnoremap P P=`]<C-o>

"code indent as a block
vnoremap < <gv
vnoremap > >gv

"window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"remap C-/ to comment out the current line
"nnoremap <C-/> gcc
"remap <CR> in normal mode to enter command mode
nnoremap <CR> :

"move to beginning/end of line
nnoremap H ^
nnoremap L $

"surround current word with double-quotes
"nnoremap <leader>"" viw<esc>a"<esc>hbi"<esc>lel

"Make double-<Esc> clear search highlights¬
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>¬

"enable from plugin mappings
nnoremap <C-p> :Files<CR>
nnoremap <leader>b :buffers<CR>:buffer<SPACE>
nnoremap <Leader>h :History<CR>

"format selection
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
