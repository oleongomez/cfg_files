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

colorscheme molokai          " Change a colorscheme.
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
noremap <leader>q :q<cr>
noremap <leader>n :NERDTreeToggle<cr>
noremap <leader>] :YcmCompleter GoTo<cr>
noremap <F3> :set hlsearch!<cr>
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
"Manage plugins with vim-plug"
let g:plug_timeout = 300 "Increase vim-plug timeout for YouCompleteMe.
call plug#begin()

Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-vinegar'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'easymotion/vim-easymotion'
Plug 'tell-k/vim-autopep8'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}
Plug 'ycm-core/YouCompleteMe', {'do': './install.py'}
Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
Plug 'puremourning/vimspector'

call plug#end()
let g:ale_set_quickfix = 1
let g:ale_python_autopep8_executable = '/home/oscar/.pyenv/shims/autopep8'
let g:ale_python_pylint_executable = '/home/oscar/.pyenv/shims/pylint'
let g:ale_fixers = {'python':['autopep8']}
let g:ale_linters = {'python':['pylint']} 
