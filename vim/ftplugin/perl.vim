" PERL
" Tidy/beautify code
nnoremap <leader>s ms:%!perltidy -q<CR>'s
" Check syntax - save first
nnoremap <leader>c :w<CR>:!perl -wc %<CR>
"
setlocal tabstop=4
setlocal shiftwidth=4
