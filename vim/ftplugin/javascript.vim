" JAVASCRIPT
" Tidy/beautify code
nnoremap <leader>s :%! js-beautify -s 2 -<CR>
vnoremap <leader>s :!js-beautify - --indent-size=2<CR>
" Check syntax - save first
nnoremap <leader>c :SyntasticCheck<CR>
"
setlocal tabstop=2
setlocal shiftwidth=2
