set number
set relativenumber
set linebreak
set showbreak=+++
set textwidth=100
set showmatch
set visualbell
 
set hlsearch
set smartcase
set ignorecase
set incsearch
 
set autoindent
set expandtab
set shiftwidth=2
set smartindent
set smarttab
set softtabstop=4
 
set ruler
 
set undolevels=1000
set backspace=indent,eol,start

set mouse-=a

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
Plug 'vim-airline/vim-airline'
Plug 'sainnhe/everforest'
Plug 'navarasu/onedark.nvim'
Plug 'vim-airline/vim-airline-themes'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
call plug#end()

set background=dark

let g:airline_theme='onedark'

let g:onedark_config = {
      \'style': 'darker',
\}

let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla,colour_names'
let g:Hexokinase_highlighters = [ 'backgroundfull' ]

""""""""""""""""""""""""
"Colorscheme           "
""""""""""""""""""""""""
colorscheme onedark
