" ----------------------------------------------------------
" Plugins
" ----------------------------------------------------------
if &g:loadplugins
  if v:version >= 704
    execute 'source' '~/.vim/rc/plugins.rc.vim'
  endif
endif

" ----------------------------------------------------------
" file specific settings
" ----------------------------------------------------------
execute 'source' '~/.vim/rc/filetype.rc.vim'

let g:lsp_diagnostics_enabled = 0         " disable diagnostics support

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
command DOACTION w|!./action.sh
cnoreabbrev ww DOACTION

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

" ime setting
function! ImInActivate()
  call system('fcitx-remote -c')
endfunction
inoremap <silent> <C-[> <ESC>:call ImInActivate()<CR>
