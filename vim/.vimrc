set nocompatible              
filetype off                 
filetype plugin indent on
syntax on
set autochdir 
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
Bundle 'gmarik/vundle'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-git'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'ctrlp.vim'
Bundle 'bling/vim-airline'
Bundle 'edkolev/tmuxline.vim'
Bundle 'scrooloose/syntastic'
Bundle 'bling/vim-bufferline'
Bundle 'vim-ruby/vim-ruby'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle "L9"
Bundle "FuzzyFinder"
Bundle "Valloric/YouCompleteMe"

colorscheme solarized
set background=light
if has('gui_running')
	set guifont=Source_Code_Pro:h12
endif
