" CSS
" Tidy/beautify code
nnoremap <leader>s :%! js-beautify --css -s 2 -<CR>
vnoremap <leader>s :!js-beautify --css -s 2 -<CR>
" Check syntax - save first
" nnoremap <leader>c :SyntasticCheck<CR>
"
