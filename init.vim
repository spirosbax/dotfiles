"""""""""""""""""""""""""""""
"Vimrc by Spiros Baxevanakis"
"spirosbax.me		    "
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" Plugins
call plug#begin()

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }


" General Programming Support
Plug 'ntpeters/vim-better-whitespace'
Plug 'python-mode/python-mode', { 'branch': 'develop' }
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'
Plug 'svermeulen/vim-easyclip'
Plug 'fatih/vim-go'

" HTML
Plug 'alvan/vim-closetag'

" Motion
Plug 'wesQ3/vim-windowswap'	  "\ww to select window to swap
Plug 'easymotion/vim-easymotion' "\\<motion> search, it's awesome!


" Commands
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'qpkorr/vim-bufkill' " :BD :bd
Plug 'junegunn/fzf.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Interface
" Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Colorschemes
Plug 'rakr/vim-one'
Plug 'ajh17/Spacegray.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'AlessandroYorba/Sierra'
Plug 'altercation/vim-colors-solarized'
Plug 'dracula/vim'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

call plug#end()            " required

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
nnoremap <esc>^[ <esc>^[
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"


"""""""""""""""""""""""""""""
" Options
" let c='a'
" while c <= 'z'
"   exec "set <A-".c.">=\e".c
"   exec "imap \e".c." <A-".c.">"
"   let c = nr2char(1+char2nr(c))
" endw

set nocompatible       	" be iMproved, required by Vundle
filetype off           	" required by Vundle
set clipboard=unnamed

" make Esc happen without waiting for timeoutlen
" fixes Powerline delay
" augroup FastEscape
"   autocmd!
"   au InsertEnter * set timeoutlen=0
"   au InsertLeave * set timeoutlen=1000
" augroup END

set number relativenumber " adds hybrid numbers
set statusline+=%{FugitiveStatusline()} " adds git info on the statusline
set scrolloff=3		" scroll when reaching end of page
" set autoindent
set smartindent
set softtabstop=4
set shiftwidth=4
set showtabline=4
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
set timeoutlen=1000
set ttimeoutlen=0
" set paste


let g:ycm_server_python_interpreter='/usr/bin/python2'
let python_highlight_all = 1 "enable all Python syntax highlighting features
" let g:hardtime_default_on = 1 " Hardtime on
" let g:pymode_python = 'python3'
let g:syntastic_mode_map = { "mode" : "passive" }
" let g:move_key_modifier = "A"
let g:deoplete#enable_at_startup = 1
