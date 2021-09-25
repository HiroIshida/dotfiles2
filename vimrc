" ----------------------------------------------------------
" Plugins
" ----------------------------------------------------------
if &g:loadplugins
  if v:version >= 704
    execute 'source' '~/.vim/rc/plugins.rc.vim'
  endif
endif

let g:UltiSnipsExpandTrigger='<tab>'
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsEditSplit="horizontal"

set fenc=utf-8
set nobackup
set noswapfile
set autoread
set hidden
set showcmd
set number
set cursorline
"set cursorcolumn

set virtualedit=onemore
"set smartindent
set visualbell
set showmatch
set laststatus=2
set statusline=%F
set wildmode=list:longest
nnoremap j gj
nnoremap k gk

set list listchars=tab:\▸\-
set expandtab
set tabstop=4
set shiftwidth=4

set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch

set completeopt-=preview

nmap <Esc><Esc> :nohlsearch<CR><Esc>
set clipboard=unnamed
inoremap <silent> jj <ESC>
inoremap <C-c> <ESC>
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

set mouse=a
set ttymouse=xterm2

"---------- custom EX command------------"
command TEXCOMPILE w|!./action.sh
cnoreabbrev ww TEXCOMPILE

"command TEXCOMPILE w|!pdflatex %
"autocmd BufEnter *.tex cnoreabbrev ww TEXCOMPILE

" to make a command which can be applied to specified multiple lines
" see https://www.xmisao.com/2014/03/19/how-to-define-range-specific-command-in-vim.html
" https://vi.stackexchange.com/questions/11025/passing-visual-range-to-a-command-as-its-argument
" example is the PrintRange function below
function! PrintRange() range
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  lnum1 p
endfunction

command! -range ApplyMacro '<,'>normal@a
cnoreabbrev ap ApplyMacro


"---------- file extension-----------"
syntax on
filetype on

autocmd BufRead,BufNewFile *.jl setfiletype julia
autocmd BufRead,BufNewFile *.launch setfiletype xml
autocmd BufRead,BufNewFile *.xacro setfiletype xml
autocmd BufRead,BufNewFile *.world setfiletype xml
autocmd BufRead,BufNewFile *.urdf setfiletype xml
autocmd BufRead,BufNewFile *.gazebo setfiletype xml
autocmd BufRead,BufNewFile *.sdf setfiletype xml
autocmd BufRead,BufNewFile *.config setfiletype xml
"autocmd BufRead,BufNewFile *.l setfiletype lisp
au BufRead,BufNewFile *.l set filetype=lisp
au BufRead,BufNewFile *.tpp set filetype=cpp
au BufRead,BufNewFile *.ino set filetype=cpp
au BufRead,BufNewFile *.rs set filetype=rust


"---------- color schemes-----------"
colorscheme molokai
autocmd BufEnter *.c colorscheme apprentice
autocmd BufEnter *.cpp colorscheme apprentice
autocmd BufEnter *.h colorscheme apprentice
autocmd BufEnter *.hpp colorscheme apprentice
"autocmd BufEnter *.lsp colorscheme tender
autocmd BufEnter *.l colorscheme tender
autocmd BufEnter *.py colorscheme apprentice
autocmd BufEnter *.jl colorscheme apprentice
autocmd BufEnter *.m colorscheme molokai
autocmd BufEnter *.xml colorscheme molokai
autocmd BufEnter *.md colorscheme morning
autocmd BufEnter *.tex colorscheme morning
autocmd BufEnter *.jl colorscheme apprentice
autocmd BufEnter *.m colorscheme apprentice
autocmd BufEnter *.tex setlocal spell spelllang=en_us | set spelllang+=cjk | set spell
autocmd BufEnter *.md setlocal spell spelllang=en_us | set spell

autocmd Filetype python setlocal completeopt-=preview
autocmd Filetype cpp setlocal completeopt-=preview
autocmd Filetype python colorscheme apprentice

"let g:clang_c_options = '-std=c11'
"let g:clang_cpp_options = '-std=c++1z -stdlib=libc++ --pedantic-errors'
"let g:clang_format_style = 'Google'
"autocmd BufRead,BufNewFile *.cpp setfiletype cpp
"autocmd BufRead,BufNewFile *.py setfiletype python

"-----------setting for matlab------------"
autocmd bufRead,BufNewFile *.m setfiletype matlab
source $VIMRUNTIME/macros/matchit.vim
filetype indent on
autocmd BufRead *.m compiler mlint

"-----------setting for lisp--------------"
let g:paredit_mode=0

"----------- keyword ----------------"
autocmd BufEnter *.tex set isk+=:
autocmd BufEnter *.jl set isk+=!
autocmd BufEnter *.jl set isk-=*
autocmd BufEnter *.jl set isk-=:
"set iskeyword-=[
"set iskeyword-=]
"set iskeyword-=.
"set iskeyword-=>
"set iskeyword-=<

" ime setting
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>

set tags=./tags;
