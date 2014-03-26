set nocompatible
filetype off

set runtimepath+=~/.vim/bundle/vundle

call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'

Bundle 'christoomey/vim-tmux-navigator'

Bundle 'SearchComplete'

Bundle 'matchit.zip'
Bundle 'sjl/gundo.vim'
Bundle 'kien/ctrlp.vim'

Bundle 'AutoTag'
Bundle 'majutsushi/tagbar'

Bundle 'tomtom/tcomment_vim'

Bundle 'Yggdroot/indentLine'

"Bundle 'jezcope/vim-align'
Bundle 'godlygeek/tabular'

"Bundle 'peterhoeg/vim-tmux'
"Bundle 'kana/vim-fakeclip'

Bundle 'CountJump'
Bundle 'ShowTrailingWhitespace'
Bundle 'DeleteTrailingWhitespace'
Bundle 'JumpToTrailingWhitespace'

Bundle 'IndexedSearch'

Bundle 'tpope/vim-unimpaired'

Bundle 'tpope/vim-git'
Bundle 'tpope/vim-fugitive'
Bundle 'gregsexton/gitv'

"Bundle 'airblade/vim-gitgutter'
Bundle 'mhinz/vim-signify'

Bundle 'tpope/vim-dispatch'

"Bundle 'git://vim-latex.git.sourceforge.net/gitroot/vim-latex/vim-latex'
"Bundle 'git://atp-vim.git.sourceforge.net/gitroot/atp-vim/atp-vim'
Bundle 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'LaTeX-Help'

"Bundle 'Lokaltog/vim-powerline'
Bundle 'bling/vim-airline'

Bundle 'ervandew/supertab'
Bundle 'SirVer/ultisnips'

Bundle 'VisIncr'

Bundle 'AndrewRadev/linediff.vim'

Bundle 'chrisbra/NrrwRgn'

" Bundle 'sjl/vitality.vim'
" Bundle 'Greduan/vim-numbertoggle'
" Bundle 'jeffkreeftmeijer/vim-numbertoggle'
if v:version >= 703
  Bundle 'myusuf3/numbers.vim'
endif

Bundle 'bootleq/LargeFile'

filetype plugin indent on
