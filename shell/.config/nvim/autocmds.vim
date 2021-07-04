"
" Textfiles
"
autocmd BufRead,BufNewFile *.txt setlocal spell

"
" Markdown autocommands
"
"setting wrap while editing
autocmd FileType markdown set wrap

"set turn on spelling
"autocmd FileType md,markdown,txt setlocal spell
autocmd FileType md,markdown setlocal conceallevel=2
"autocmd FileType md,markdown,txt setlocal spell

" Spellcheck for features and markdown
"autocmd BufRead,BufNewFile *.md setlocal textwidth=0

"
" Git Commit messages
"
"use spell check
autocmd BufRead COMMIT_EDITMSG setlocal spell
autocmd BufRead COMMIT_EDITMSG setlocal colorcolumn=50

" typescript
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript
