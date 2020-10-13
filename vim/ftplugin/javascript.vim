" JAVASCRIPT
" Tidy/beautify code
nnoremap <leader>s ms:%! js-beautify -s 2 -<CR>'s
vnoremap <leader>s :!js-beautify - -s 2<CR>
" Check syntax - save first
nnoremap <leader>c :SyntasticCheck<CR>
"
setlocal tabstop=2
setlocal shiftwidth=2
