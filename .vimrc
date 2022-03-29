" => Chapter 1: Getting Started --------------------------------------- {{{

" Basic Python-friendly Vim configuration. Colorscheme is changed from
" 'default' to make screenshots look better in print.

syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.

set autoindent             " Respect indentation when starting a new line.
set expandtab              " Expand tabs to spaces. Essential in Python.
set tabstop=4              " Number of spaces tab is counted for.
set shiftwidth=4           " Number of spaces to use for autoindent.
set autoread               " Reload the files when changed outside vim
set backspace=2            " Fix backspace behavior on most terminals.

colorscheme molokai_dark        " Change a colorscheme.
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
:nnoremap <F2> :buffers<CR>:buffer<Space>
"set foldmethod=indent      "Folding python code
set wildmenu               "Enable wildmenu
set wildmode=list:longest,full
"autocmd VimEnter * NERDTree "Enable NERDTree on Vin startup
let NERDTreeHijackNetrw = 0      "Avoid NERDTree replacing Netrw
set number
set hlsearch
set tags=./tags;/
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
"Plug 'mileszs/ack.vim'
"Plug 'easymotion/vim-easymotion'
Plug 'tell-k/vim-autopep8'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries'}
Plug 'ycm-core/YouCompleteMe', {'do': './install.py'}
"Plug 'christoomey/vim-tmux-navigator'
Plug 'dense-analysis/ale'
"Plug 'puremourning/vimspector'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/ScrollColors'
Plug 'flazz/vim-colorschemes'
"Plug 'tpope/vim-surround'

call plug#end()
let g:ale_set_quickfix = 1
let g:ale_python_autopep8_executable = '/home/oscar/.pyenv/shims/autopep8'
let g:ale_python_pylint_executable = '/home/oscar/.pyenv/shims/pylint'
let g:ale_python_mypy_executable = '/home/oscar/.pyenv/shims/mypy'
let g:ale_fixers = {'python':['autopep8']}
let g:ale_linters = {'python':['pylint', 'mypy'], 'c++':['clang']} 

"Move lines mappings"
nnoremap <leader>j :m .+1<CR>==
nnoremap <leader>k :m .-2<CR>==
"inoremap <leader>j <Esc>:m .+1<CR>==gi
"inoremap <leader>k <Esc>:m .-2<CR>==gi
vnoremap <leader>j :m '>+1<CR>gv=gv
vnoremap <leader>k :m '<-2<CR>gv=gv

"Ctrlp mappings
nnoremap <leader>s  :CtrlP .<CR><c-d>
" let g:airline#extensions#tabline#enabled = 1
" Search and replace visually selected text
vnoremap <c-f> y<ESC>/<c-r>"<CR>
set redrawtime=10000
