"---------- file extension-----------"
filetype on

autocmd BufRead,BufNewFile *.jl setfiletype julia
autocmd BufRead,BufNewFile *.launch setfiletype xml
autocmd BufRead,BufNewFile *.test setfiletype xml
autocmd BufRead,BufNewFile *.xacro setfiletype xml
autocmd BufRead,BufNewFile *.world setfiletype xml
autocmd BufRead,BufNewFile *.urdf setfiletype xml
autocmd BufRead,BufNewFile *.gazebo setfiletype xml
autocmd BufRead,BufNewFile *.sdf setfiletype xml
autocmd BufRead,BufNewFile *.config setfiletype xml
autocmd BufRead,BufNewFile *.tpp setfiletype cpp
autocmd BufRead,BufNewFile *.ino setfiletype cpp
au BufRead,BufNewFile *.l set filetype=lisp

"---------- cpp -----------"
autocmd BufEnter *.cpp set tabstop=2
autocmd BufEnter *.cpp set shiftwidth=2

"---------- color schemes-----------"
" default
colorscheme eldar
hi Normal ctermbg=16 guibg=#000000
hi LineNr ctermbg=16 guibg=#000000

autocmd BufEnter *.md colorscheme white
autocmd BufEnter *.tex colorscheme white
autocmd BufEnter *.txt colorscheme white

"---------- indent ----------------"
autocmd Filetype xml setlocal ts=2 sw=2 expandtab

"---------- spell check -----------"
autocmd BufEnter *.tex setlocal spell spelllang=en_us | set spelllang+=cjk | set spell
autocmd BufEnter *.md setlocal spell spelllang=en_us | set spell

"---------- completeopt -----------"
autocmd Filetype python setlocal completeopt-=preview
autocmd Filetype cpp setlocal completeopt-=preview
