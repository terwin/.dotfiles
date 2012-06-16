" set up Vundle bundles
source ~/.vim/bundles.vim

syntax on

set t_Co=16
colorscheme solarized

set nofoldenable

set grepprg=grep\ -nH\ $*

" save 200 commands/searches/etc
set history=200

" jump to last known position after opening a file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" persistent undo
if v:version >= 703
  set undolevels=1000
  set undodir=/scr/terwin/.tmp
  set undofile
endif

set hlsearch
set incsearch
set wildmode=list:longest
set showmode
set showcmd
set laststatus=2
set ruler

"hi Search ctermbg=cyan

set mouse=a
set bs=2
noremap <Space> <PageDown>
noremap <BS> <PageUp>

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

set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

"let g:lua_inspect_events = ''
"let g:lua_inspect_warnings = 0
"let g:lua_inspect_internal = 1

set efm+=%E%f:%l.%c:,%E%f:%l:,%C,%C%p%*[0123456789^],%ZError:\ %m,%C%.%#

let g:tex_flavor='latex'
au FileType, c,cpp,slang set cindent cino=(0,W2s
au BufNewFile,BufRead *.doxygen setf doxygen
au BufNewFile,BufRead *.gnuplot,*.gnp setf gnuplot
au BufNewFile,BufRead *.ggo set filetype=gengetopt
au BufNewFile,BufRead *.mf90 set filetype=fortran
au BufNewFile,BufRead *.f90,*.F90,*.mf90 let b:fortran_do_enddo=1
"au BufNewFile,BufRead *.m,*.oct setf octave

nnoremap <Leader>n :execute 'normal! ' . <c-r><c-w> . 'j'<CR>
nnoremap <Leader>h :nohlsearch<CR>
