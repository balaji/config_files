set nocompatible              
filetype off                 
filetype plugin indent on
syntax on
set number 
set incsearch
set hlsearch
set wildmode=longest,list
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set autochdir
set cindent
set nowritebackup
set nobackup
set showmatch
set showcmd
set shortmess=atI
set laststatus=2
set noerrorbells
set completeopt=longest,menuone
set omnifunc=syntaxcomplete#Complete

set runtimepath+=~/.vim/bundle/vundle

call vundle#rc()
Plugin 'gmarik/vundle'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-git'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlp.vim'
Plugin 'bling/vim-airline'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-bufferline'
Plugin 'vim-ruby/vim-ruby'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'L9'
Plugin 'FuzzyFinder'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'

if has('gui_running')
  colorscheme monokai
	set guifont=Source_Code_Pro:h12
endif

imap ss <esc>a<Plug>snipMateNextOrTrigger
smap ss <Plug>snipMateNextOrTrigger
