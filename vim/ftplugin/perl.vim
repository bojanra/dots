" PERL
" Tidy/beautify code
nnoremap <leader>s ms:%!perltidy -q<CR>'s
" Check syntax - save first
nnoremap <leader>c :w<CR>:!perl -wc %<CR>

" jump to marker <++>
" inoremap <Space><Space> <Esc>/<++><Enter>"_c4l
" subroutine start
inoremap ;s sub {<CR>my ($self) = @_;<CR><++><CR>}<CR><Esc>kkkkf{i

setlocal tabstop=4
setlocal shiftwidth=4

