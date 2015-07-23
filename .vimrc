filetype plugin on
let g:BASH_Author   = 'Jonathan Holloway'

"Syntax coloring
"set t_Co=256
colorscheme inkpot
syntax enable

if has("statusline")
 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

set clipboard=unnamedplus
