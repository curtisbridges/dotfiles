
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
autocmd FileType md,markdown,txt setlocal spell

" Spellcheck for features and markdown
autocmd BufRead,BufNewFile *.md setlocal spell

"
" Git Commit messages
"
"use spell check
autocmd BufRead COMMIT_EDITMSG setlocal spell

