set nocompatible              
filetype off                 
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

"neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

"pathogen
execute pathogen#infect()

set runtimepath+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-fireplace'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-git'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-leiningen'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'guns/vim-sexp'
Plugin 'guns/vim-clojure-static'
Plugin 'scrooloose/nerdtree'
Plugin 'edkolev/tmuxline.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-ruby/vim-ruby'
Plugin 'Shougo/neosnippet.vim'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/unite.vim'
Plugin 'rking/ag.vim'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-rbenv'
Plugin 'ctrlp.vim'
Plugin 'bling/vim-bufferline'
Plugin 'mhinz/vim-signify'
Plugin 'flazz/vim-colorschemes'
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
call vundle#end()

let g:unite_enable_start_insert = 1
nmap <space> [unite]
nnoremap [unite] <nop>

call unite#filters#matcher_default#use(['matcher_fuzzy'])
nnoremap <silent> [unite]f :<C-u>Unite grep:.<cr>
nnoremap <silent> [unite]s :<C-U>Unite -buffer-name=buffers buffer<cr>
nnoremap <silent> [unite]e :<C-u>Unite -buffer-name=buffer -quick-match buffer<cr>

filetype plugin indent on

if has('gui_running')
  colorscheme monokai
  set guifont=Fira\ Mono\ for\ Powerline:h15
endif
