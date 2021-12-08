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

" vim-lsp settings
let g:lsp_diagnostics_enabled = 1 " disable diagnostics support
let g:lsp_diagnostics_echo_cursor = 1 " show error message
let g:lsp_document_code_action_signs_enabled = 0
au BufNewFile,BufRead * call lsp#disable_diagnostics_for_buffer() " lsp diag off by default
command LSPDIAG call lsp#enable_diagnostics_for_buffer()
command LSPNODIAG call lsp#disable_diagnostics_for_buffer()
cnoreabbrev lspdiag LSPDIAG
cnoreabbrev lspnodiag LSPNODIAG
cnoreabbrev lspdef LspDefinition
cnoreabbrev lspdec LspDeclaration
cnoreabbrev lspimpl LspImplementation
cnoreabbrev lspref LspReferences
cnoreabbrev lsprename LspRename
cnoreabbrev lsphover LspReferences

command PRIVATECPP /\<\w*_\>
cnoreabbrev privatecpp PRIVATECPP

" ulti snip settings
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
nnoremap <S-Left>  <C-w><<CR>
nnoremap <S-Right> <C-w>><CR>
nnoremap <S-Up>    <C-w>-<CR>
nnoremap <S-Down>  <C-w>+<CR>

set mouse=a

"---------- custom EX command------------"
command SETCURRENT cd %:p:h
cnoreabbrev cdc SETCURRENT

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

" https://stackoverflow.com/questions/1676632/whats-a-quick-way-to-comment-uncomment-lines-in-vim
" Commenting blocks of code.
augroup commenting_blocks_of_code
  autocmd!
  autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
  autocmd FileType sh,ruby,python   let b:comment_leader = '# '
  autocmd FileType conf,fstab       let b:comment_leader = '# '
  autocmd FileType tex              let b:comment_leader = '% '
  autocmd FileType mail             let b:comment_leader = '> '
  autocmd FileType vim              let b:comment_leader = '" '
augroup END
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>
