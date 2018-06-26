
"""""""""""""""""""""""""""""
" Colors
syntax on
" set background:dark
"""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""
" Key mappings
"map <C-n> ;NERDTreeToggle<CR>
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
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" Options
set number relativenumber " adds hybrid numbers
"set statusline+=%{FugitiveStatusline()} " adds git info on the statusline
set scrolloff=3		" scroll when reaching end of page
set autoindent
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
"""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""
" Plugins
call plug#begin()
Plug 'roxma/nvim-completion-manager'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'qpkorr/vim-bufkill' " :BD :bd
Plug 'junegunn/fzf.vim'
call plug#end()
"""""""""""""""""""""""""""""
