"---------- file extension-----------"
filetype on

autocmd BufRead,BufNewFile *.jl setfiletype julia
autocmd BufRead,BufNewFile *.launch setfiletype xml
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
syntax on
try
    colorscheme apprentice
catch
    colorscheme morning
endtry

autocmd BufEnter *.md colorscheme morning
autocmd BufEnter *.tex colorscheme morning

"---------- indent ----------------"
autocmd Filetype xml setlocal ts=2 sw=2 expandtab

"---------- spell check -----------"
autocmd BufEnter *.tex setlocal spell spelllang=en_us | set spelllang+=cjk | set spell
autocmd BufEnter *.md setlocal spell spelllang=en_us | set spell

"---------- completeopt -----------"
autocmd Filetype python setlocal completeopt-=preview
autocmd Filetype cpp setlocal completeopt-=preview
