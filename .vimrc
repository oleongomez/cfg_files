" => Chapter 1: Getting Started --------------------------------------- {{{

" Basic Python-friendly Vim configuration. Colorscheme is changed from
" 'default' to make screenshots look better in print.

syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.

set autoindent             " Respect indentation when starting a new line.
set expandtab              " Expand tabs to spaces. Essential in Python.
set tabstop=4              " Number of spaces tab is counted for.
set shiftwidth=4           " Number of spaces to use for autoindent.

set backspace=2            " Fix backspace behavior on most terminals.

colorscheme delek         " Change a colorscheme.
set undofile
if !isdirectory(expand("$HOME/.vim/undodir"))
    call mkdir(expand("$HOME/.vim/undodir"),"p")
endif
set undodir=$HOME/.vim/undodir
packloadall                " Load all  plugins
silent! helptags ALL       " Load help files for all plugins
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>
nmap ; :
let mapleader = "\<space>"
noremap <leader>w :w<cr>
noremap <leader>n :NERDTreeToggle<cr>
noremap <leader>q :q<cr>
set foldmethod=indent      "Folding python code
set wildmenu               "Enable wildmenu
set wildmode=list:longest,full
"autocmd VimEnter * NERDTree "Enable NERDTree on Vin startup
let NERDTreeHijackNetrw = 0      "Avoid NERDTree replacing Netrw
set number
set hlsearch
"Install vim-plug if it is not already installed
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.github.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
"Manage plugins with vim-plug
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'

call plug#end()
