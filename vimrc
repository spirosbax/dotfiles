"""""""""""""""""""""""""""""
"Vimrc by Spiros Baxevanakis"
"spirosbax.me		    "
"""""""""""""""""""""""""""""

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

"""""""""""""""""""""""""""""
" Plugins
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" Autocomplete
Plugin 'Valloric/YouCompleteMe'
Plugin 'ternjs/tern_for_vim'

" General Programming Support
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'python-mode/python-mode', { 'branch': 'develop' }
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-syntastic/syntastic'
Plugin 'svermeulen/vim-easyclip'

" HTML
Plugin 'alvan/vim-closetag'

" Motion
Plugin 'wesQ3/vim-windowswap'	  "\ww to select window to swap
Plugin 'easymotion/vim-easymotion' "\\<motion> search, it's awesome!
"Plugin 'takac/vim-hardtime'

" Commands
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-repeat'
Plugin 'qpkorr/vim-bufkill' " :BD :bd
Plugin 'junegunn/fzf.vim'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'

" Interface
Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'scrooloose/nerdtree'
Plugin 'ryanoasis/vim-devicons'
" Plugin 'vim-airline/vim-airline'
" Plugin 'vim-airline/vim-airline-themes'

" Colorschemes
Plugin 'rakr/vim-one'
Plugin 'ajh17/Spacegray.vim'
Plugin 'nanotech/jellybeans.vim'
Plugin 'morhetz/gruvbox'
Plugin 'AlessandroYorba/Sierra'
Plugin 'altercation/vim-colors-solarized'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()            " required

filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"""""""""""""""""""""""""""""
" Colors
syntax on
set background:dark
colorscheme gruvbox

"""""""""""""""""""""""""""""
" Key mappings
map <C-n> ;NERDTreeToggle<CR>
" fuzzy file searching using fzf
map <F1> ;bprevious<Enter>
map <F2> ;bnext<Enter>
map <F3> ;Files<Enter>
" swap shift - ; to ; only in normal mode
nnoremap ; :
nnoremap : ;
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" nnoremap <silent> <CR> :nohlsearch<CR><CR>
nnoremap <esc> :noh<return><esc>
nnoremap <esc>^[ <esc>^[


"""""""""""""""""""""""""""""
" Options
set nocompatible       	" be iMproved, required by Vundle
filetype off           	" required by Vundle
set clipboard=unnamed

" make Esc happen without waiting for timeoutlen
" fixes Powerline delay
augroup FastEscape
  autocmd!
  au InsertEnter * set timeoutlen=0
  au InsertLeave * set timeoutlen=1000
augroup END

set number relativenumber " adds hybrid numbers
set statusline+=%{FugitiveStatusline()} " adds git info on the statusline
set scrolloff=3		" scroll when reaching end of page
" set autoindent
set smartindent
set softtabstop=2
set showtabline=2
set encoding=utf8
set noshowmode
set noruler
set laststatus=2
set expandtab "expand tabs into spaces
set ts=4 "set tabs to have 4 spaces
set cursorline "show a visual line under the cursor's current line
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set hidden


let python_highlight_all = 1 "enable all Python syntax highlighting features
let g:ycm_server_python_interpreter='/usr/bin/python2'
let g:hardtime_default_on = 1 " Hardtime on
" let g:pymode_python = 'python3'
let g:syntastic_mode_map = { "mode" : "passive" }
