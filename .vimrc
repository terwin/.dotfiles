" set up Vundle bundles
source ~/.vim/bundles.vim

syntax on
" syntax enable

nnoremap <Space> <Nop>
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

" Fix some highlighting
augroup FixHighlights
  autocmd!
  au ColorScheme * hi! link ShowTrailingWhitespace ErrorMsg
  au ColorScheme * hi! link SignColumn LineNr
  au ColorScheme * hi! link CursorLineNr DiffAdd
  " au ColorScheme * hi SignColumn
augroup END

" set t_Co=16
" set background=light
colorscheme solarized

set nofoldenable

set grepprg=grep\ -nH\ $*

" save 200 commands/searches/etc
set history=200

set spellfile=~/.vim/spell/en.utf-8.add

" jump to last known position after opening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

if &term =~ "rxvt-unicode"
  " hi Comment term=italic cterm=italic
  let &t_SI .= "\<Esc>[6 q"
  let &t_EI .= "\<Esc>[2 q"
  " let g:solarized_termtrans = 1
endif
" persistent undo
if v:version >= 703
  set undolevels=1000
  set undodir=/scr/terwin/.tmp
  set undofile
endif

if v:version >= 703
  set number
  " set relativenumber
  " set numberwidth=3
endif

set hlsearch
set incsearch
set wildmode=list:longest:full
set noshowmode
set showcmd
set laststatus=2
set ruler

set list
if &encoding ==? "utf-8"
  " set listchars=tab:│\ ,trail:•,extends:❯,precedes:❮
  set listchars=tab:│\ ,trail:•,extends:,precedes:
  " set listchars=tab:│\ ,trail:•,extends:,precedes:
else
  set listchars=tab:\|\ ,trail:.,extends:>,precedes:<
endif

set hidden

set wildignore+=*.o,*.a,*.so,*.mod

" let g:NumberToggleOn = '<C-y>'

let g:ShowTrailingWhitespace = 0

let g:indentLine_fileType = ['python']
" | ¦ ┆ ┊ │
if &encoding ==? "utf-8"
  let g:indentLine_char = "│"
else
  let g:indentLine_char = "|"
endif

"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

let g:Gitv_OpenHorizontal = 'auto'

if ! has("gui_running")
  let g:airline_solarized_reduced=0
  let g:airline_solarized_bg='light'
endif
set ttimeoutlen=10
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END
let g:airline_theme = 'solarized'
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" let g:airline_symbols.paste = ' P'
let g:airline_symbols.paste = 'P'
let g:airline_symbols.whitespace = '!'

let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'Nrm',
    \ 'i'  : 'Ins',
    \ 'R'  : 'Rep',
    \ 'c'  : 'Cmd',
    \ 'v'  : 'Vis',
    \ 'V'  : 'V-L',
    \ '' : 'V-B',
    \ 's'  : 'Sel',
    \ 'S'  : 'S-L',
    \ '' : 'S-B',
    \ }

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#buffer_nr_format = '%s:'

let g:airline#extensions#hunks#non_zero_only = 1

let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#whitespace#show_message = 1
let g:airline#extensions#whitespace#trailing_format = 't[%s]'
let g:airline#extensions#whitespace#mixed_indent_format = 'i[%s]'

let g:Powerline_symbols="fancy"
"let g:Powerline_colorscheme="solarized"
"let g:Powerline_symbols_override = {
"  \ 'BRANCH': [0xE0A0],
"  \ 'LINE':   'L'
"  \ }

" let g:gitgutter_enabled = 0

" hi link ShowTrailingWhitespace ErrorMsg
" hi! link SignColumn LineNr
" hi! link CursorLineNr DiffAdd

set mouse=a
set bs=2
noremap <Leader>j <c-d>
noremap <Leader>k <c-u>

set autoindent
set autowrite
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set nowrap
set textwidth=79
set formatoptions=croql
set whichwrap=h,l,~,[,]
set ignorecase
set smartcase

set scroll=1
set scrolloff=5
set sidescroll=1
set sidescrolloff=5

noremap Y y$

nnoremap n nzz
nnoremap N Nzz

let g:LargeFile = 100

let g:UltiSnipsDontReverseSearchPath = "1"
let g:UltiSnipsNoPythonWarning = 1

let g:SuperTabCompletionContexts = ['s:ContextText', 's:ContextDiscover']
"let g:SuperTabContextTextOmniPrecedence = ['&omnifunc', '&completefunc']
let g:SuperTabContextDiscoverDiscovery = ["&completefunc:<c-x><c-u>", "&omnifunc:<c-x><c-o>"]
let g:SuperTabDefaultCompletionType = "context"

"let fortran_more_precise=1
let fortran_fold=1

let g:nrrw_rgn_vert = 1
let g:nrrw_topbot_leftright = 'botright'
let b:nrrw_aucmd_create = "normal ="

xmap <Leader>dd :Linediff<CR>
nmap <Leader>dr :LinediffReset<CR>

"let g:lua_inspect_events = ''
"let g:lua_inspect_warnings = 0
"let g:lua_inspect_internal = 1

set efm+=%E%f:%l.%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%C%.%#

let g:tex_flavor='latex'

let g:LatexBox_show_warnings=1

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
        \ | wincmd p | diffthis
endif

augroup vimrc
  au!
  au FileType, tex set formatoptions=tcroql
  au FileType, c,cpp,slang set cindent cino=(0,W2s
augroup END

augroup myFileTypes
  au!
  au BufNewFile,BufRead *.doxygen setf doxygen
  au BufNewFile,BufRead *.gnuplot,*.gnp setf gnuplot
  au BufNewFile,BufRead *.ggo setf gengetopt
  au BufNewFile,BufRead *.mf90 setf fortran
  "au BufNewFile,BufRead *.m,*.oct setf octave
  au BufNewFile,BufRead *.wxm setf maxima
  au BufNewFile,BufRead Tupfile,*.tup setf tup
augroup END

nnoremap <Leader>n m':execute 'normal! ' . <c-r><c-w> . 'j'<CR>
nnoremap <Leader>h :nohlsearch<CR>
nnoremap <Leader>e :e#<CR>
nnoremap <silent> <Leader>t :TagbarToggle<CR>
