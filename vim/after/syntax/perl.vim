" Syntax files for SQL heredocs.
" Version: v0.1.0

" Store current syntax.
let s:previous_syntax = b:current_syntax

" Store the SQL syntax so it can be included below.
unlet b:current_syntax
syntax include @SQL syntax/sql.vim

" syntax region rubyHereDocSQL matchgroup=Statement            start=+<<\z(SQL\)+ end=+^\z1$+ contains=@SQL,rubyInterpolation
syn region perlHereDocStartSQL	matchgroup=perlStringStartEnd start=+<<\s*"\z(SQL\)"+ end=+^\z1$+ contains=@SQL,perlSpecialString

let b:current_syntax = s:previous_syntax
