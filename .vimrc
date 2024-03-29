""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Author: Fabio Perez - http://fabioperez.com.br
" Config layout inspired by https://amix.dk/vim/vimrc.html
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"    Install plugins     :PluginInstall
"    Clean plugins       :CleanInstall
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'mileszs/ack.vim'                " Ack for vim
Plug 'scrooloose/nerdcommenter'       " Easy commenting
Plug 'vim-airline/vim-airline'        " Status bar
Plug 'vim-airline/vim-airline-themes'
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_theme = 'badwolf'
Plug 'airblade/vim-gitgutter'         " Inline git status
Plug 'tpope/vim-fugitive'             " Git
Plug 'ctrlpvim/ctrlp.vim'             " Fuzzy file search
if executable('rg')
    set grepprg=rg\ --color=never
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
    let g:ctrlp_custom_ignore = 'DS_Store\|git\|lmdb'
endif
Plug 'tpope/vim-surround'
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'tmhedberg/SimpylFold', { 'for' : 'python' }
Plug 'easymotion/vim-easymotion'

" Colorschemes
Plug 'NLKNguyen/papercolor-theme'
Plug 'tomasr/molokai'
Plug 'altercation/vim-colors-solarized'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
set history=8000          " set long history
filetype plugin indent on " enable filetype plugins
set autoread              " watch for file changes outside vim
set nobackup              " disable old backup and swap
set nowritebackup
set noswapfile
set mouse=a               " enable mouse
set t_Co=256              " force vim to use 256 colours
set laststatus=2          " show status line

" use ; as :
nnoremap ; :

" remap map leader to SPACE
noremap <SPACE> <Nop>
let mapleader=" "

" remove leader key timeout
set notimeout

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=10            " when moving with j/k show at least
" 10 lines after/befor current line
set wildmenu                " improve vim command-line completion
set wildignore=*.o,*~,*.pyc " ignore compiled files
set ruler                   " show line number on status bar
set number                  " show current line number
set relativenumber          " show relative line numbers
set hidden                  " keep file hidden when buffer is changed
set backspace=indent,eol,start
set whichwrap+=h,l          " wrap when using h/l
set lazyredraw              " don't redraw while executing macros
set visualbell              " don't beep
set noerrorbells            " don't beep
set diffopt+=vertical       " use vertical diff

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" Graphic configs
set guioptions-=T           " remove toolbar from MacVim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Search
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all
" lowercase, case-sensitive otherwise
set hlsearch      " highlight search
set incsearch     " show search matches as you type
set magic         " better regular expressions

" keep search matches in the middle of the window.
nnoremap n nzzzv
" keep search matches in the middle of the window.
nnoremap N Nzzzv

" Use // to search selected text
vnoremap // y/<C-R>"<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colours and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable             " syntax highlighting
set background=light
set encoding=utf-8
set ffs=unix,dos,mac      " use unix as the standard file type
set cursorline            " highlight current line
set colorcolumn=100        " Show vertical bar
set textwidth=99
colorscheme solarized

let g:Powerline_symbols="fancy"
let g:airline_powerline_fonts = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on   " detect filetype
set expandtab               " convert tabs to spaces
set smarttab
set shiftwidth=4            " one tab = 4 spaces (indentation)
set softtabstop=4           " insert / delete 4 spaces at time
set autoindent              " copy current line indent to new lines
set cindent
set wrap                    " wrap lines
set cino+=(0                " align on parenthesis

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

" next window        <space>w
" next buffer        <space>a
" delete buffer      <space>q
nmap <silent> <leader>w <c-w>w
nmap <silent> <leader>a :bprev<CR>
nmap <silent> <leader>d :bnext<CR>
nmap <silent> <leader>q :bdelete<CR>

" Delete without yank
nnoremap <leader><leader>d "_d

" return to last edit position when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \   exe "normal! g`\"" |
            \ endif
set viminfo^=% " Remember info about open buffers on close

" Center line when Ctrl+o
nnoremap <c-o> <c-o>zz

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Additional functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Delete trailing white space on save
func! DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//ge
    exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Additional functions
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set undofile                " Save undo's after file closes
set undodir=$HOME/.vim/undo " where to save undo histories
set undolevels=10000        " How many undos
set undoreload=10000        " number of lines to save for undo

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nofoldenable        " dont fold by default
set foldlevelstart=10   " open most folds by default
set foldnestmax=3      " deepest fold is 10 levels
set foldmethod=syntax   " fold based on syntax
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Python specific settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Indent
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4
au BufRead,BufNewFile *.py,*.pyw, set textwidth=99


""""""""""""" UNDER CONSTRUCTION

" Surround
nmap <silent> <leader>su ysiw

" SHORTCUTS

" Quickly edit/reload the vimrc file
" <space>ev (edit) | <space>sv (save and reload)
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :source ~/.vimrc<CR>
