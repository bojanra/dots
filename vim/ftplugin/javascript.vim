" JAVASCRIPT
" Tidy/beautify code
nnoremap <leader>s ms:%! js-beautify -<CR>'s
vnoremap <leader>s :!js-beautify -<CR>
" Check syntax - save first
nnoremap <leader>c :w<CR>:SyntasticCheck <CR>
"
setlocal tabstop=2
setlocal shiftwidth=2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 1
let g:syntastic_error_symbol = '❌'
let g:syntastic_style_error_symbol = '⁉️'
let g:syntastic_warning_symbol = '⚠️'
let g:syntastic_style_warning_symbol = '💩'
highlight link SyntasticErrorSign SignColumn
highlight link SyntasticWarningSign SignColumn
highlight link SyntasticStyleErrorSign SignColumn
highlight link SyntasticStyleWarningSign SignColumn
