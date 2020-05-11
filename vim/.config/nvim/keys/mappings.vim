"Key Mappings


"auto indent pasted text
nnoremap p p=`]<C-o>
nnoremap P P=`]<C-o>

"code indent as a block
vnoremap < <gv
vnoremap > >gv

"window movement
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"remap C-/ to comment out the current line
nnoremap <C-_> gcc
"remap <CR> in normal mode to enter command mode
nnoremap <CR> :

"move to beginning/end of line
"cmb> leaving this commented out because I'm not sure I want to overwrite the default H and L behavior
"nnoremap H ^
"nnoremap L $

"surround current word with double-quotes
nnoremap <leader>"" viw<esc>a"<esc>hbi"<esc>lel
