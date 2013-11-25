" vimrc for Windows:
" :echo $HOME for homedir info - dir for _vimrc and vimfiles folder
" clone vundle into vimfiles/bundle/vundle - requires curl and git
" git clone https://github.com/gmarik/vundle.git
set nocompatible
filetype off
set rtp+=vimfiles/bundle/vundle
call vundle#rc()

Bundle 'gmarik/vundle'
" Bundle Addon Installer List
Bundle 'tpope/vim-fugitive'
Bundle 'flazz/vim-colorschemes'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-easymotion'
"Fuzzyfinder requires 'L9' as a dependency
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'Lokaltog/vim-powerline'
" Clojure
Bundle 'guns/vim-clojure-static'
Bundle 'tpope/vim-fireplace'

" call pathogen#runtime_append_all_bundles()
let mapleader = ","

syntax on
syntax enable
filetype on
filetype plugin on
filetype plugin indent on " = entspricht erlaubt einrücken
au BufRead,BufNewFile *.hx set filetype=haxe
set tabstop=4
set smarttab
set shiftwidth=4
set autoindent
set expandtab
set number
set hidden
set ignorecase
set smartcase
set title
set clipboard=unnamed

" open mycimrc with ,v
map <Leader>v <c-w><c-v>:e $MYVIMRC<cr>
" evaluate with ,s
map <Leader>s :source $MYVIMRC<cr>

" ------------
" NERDTree
" ------------
map ä :NERDTreeToggle<cr>
" ------------
" SEARCH
" ------------
set incsearch
set hlsearch
map ö :nohl<cr>

" Backup Dire off
silent! !mkdir -p C:/Users/georg_000/vimfiles/backup
silent! !mkdir -p C:/Users/georg_000/vimfiles/swap
set backup
set backupdir=C:/Users/georg_000/vimfiles/backup//
set directory=C:/Users/georg_000/vimfiles/swap//

" GUI
set guioptions-=m
set guioptions-=T
set background=light
colorscheme lazarus
set guifont=Consolas

" Folding
if version >= 600
    set foldenable
    set foldmethod=marker
    set foldlevel=100
    set foldmarker=\ {{{,\ }}}
endif

nnoremap <c-space> za
vnoremap <c-space> zf

" Save
map <c-s> :w<cr>

" schnelles wechseln zwischen den Fenstern
map <c-j> <c-w>j
map <c-h> <c-w>h
map <c-k> <c-w>k
map <c-l> <c-w>l

map <c-Tab> <c-l>
map <S-c-Tab> <c-h> 

" jump around faster with alt-k/-j
map <a-k> 5k<cr>
map <a-j> 5j<cr>
map <a-l> 5l<cr>
map <a-h> 5h<cr>

map <F2> <Esc>:1,$!xmllint --format -<CR>

"jump to last cursor position when opening a file
"dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
    if &filetype !~ 'commit\c'
        if line("'\"") > 0 && line("'\"") <= line("$")
            exe "normal g`\""
        endif
    end
endfunction

set nowrap
set exrc
set foldmethod=marker
set pastetoggle=<F9>
