" PERL
" Tidy/beautify code
nnoremap <leader>s :%!perltidy -q<CR>
" Check syntax - save first
nnoremap <leader>c :w<CR>:!perl -wc %<CR>
"
setlocal tabstop=2
setlocal shiftwidth=2
