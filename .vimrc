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
set nocompatible
filetype off  
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>
Plugin 'mileszs/ack.vim'                " Ack for vim
Plugin 'scrooloose/nerdcommenter'       " Easy commenting
"Plugin 'wincent/command-t'
Plugin 'sukima/xmledit'
Plugin 'bling/vim-airline'              " Status bar
Plugin 'airblade/vim-gitgutter'         " Inline git status
Plugin 'MattesGroeger/vim-bookmarks'
highlight SignColumn ctermbg=white
Plugin 'tpope/vim-fugitive'             " Git
Plugin 'Mark'

" Colorschemes
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'tomasr/molokai'
Plugin 'altercation/vim-colors-solarized'

"Plugin 'mattn/zencoding-vim'
"Plugin 'ervandew/supertab' 
"Plugin 'pangloss/vim-javascript'
"Plugin 'Townk/vim-autoclose'
"Plugin 'kshenoy/vim-signature'

" Snipmate
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

call vundle#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=8000          " set long history
set undolevels=20000      " undo memory
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=10            " when moving with j/k show at least
" 10 lines after/befor current line
set wildmenu                " improve vim command-line completion 
set wildignore=*.o,*~,*.pyc " ignore compiled files
set ruler                   " show line number on status bar
set number                  " show line numbers
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colours and Fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable             " syntax highlighting
set background=light  
set encoding=utf-8
set ffs=unix,dos,mac      " use unix as the standard file type
set cursorline            " highlight current line

" Try to load colorscheme
try
    colorscheme molokai
catch /^Vim\%((\a\+)\)\=:E185/
endtry

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
set smartindent 
set wrap                    " wrap lines

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
nmap <silent> <leader>a :bnext<CR> 
nmap <silent> <leader>q :bdelete<CR> 

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
" => Folding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nofoldenable        " dont fold by default
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " deepest fold is 10 levels
set foldmethod=syntax   " fold based on syntax
"set foldmethod=indent   "fold based on indent
let javaScript_fold=1         " JavaScript
let perl_fold=1               " Perl
let php_folding=1             " PHP
let r_syntax_folding=1        " R
let ruby_fold=1               " Ruby
let sh_fold_enabled=1         " sh
let vimsyn_folding='af'       " Vim script
let xml_syntax_folding=1      " XML

""""""""""""" UNDER CONSTRUCTION


"Custom file extensions
let asmsyntax='armasm' 
let filetype_inc='armasm'
au! BufRead,BufNewFile *.dasc           setfiletype dasc
au! Syntax dasc source $HOME/util/vim-scripts/dasc.vim

" SHORTCUTS

" Quickly edit/reload the vimrc file
" <space>ev (edit) | <space>sv (save and reload)
nmap <silent> <leader>ev :e ~/.vimrc<CR> 
nmap <silent> <leader>sv :source ~/.vimrc<CR>

" CMD+i Auto-indent entire file
"map <D-i> mqHmwgg=G`wzt`q

