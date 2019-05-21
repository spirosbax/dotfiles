"""""""""""""""""""""""""""""
" init.vim by Spiros Baxevanakis, spirosbax.com
"""""""""""""""""""""""""""""

" Plugins
call plug#begin()

" Autocomplete
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" Snippets
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

" General Programming Support
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-syntastic/syntastic'
Plug 'fatih/vim-go'
Plug 'tomlion/vim-solidity'
Plug 'dmdque/solidity.vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'Shougo/deoplete-clangx'
Plug 'spirosbax/vim-mypy'
" use with caution, it will fill your project with large tag files
" Plug 'ludovicchabant/vim-gutentags'

setlocal iskeyword+=$
setlocal iskeyword+=-

function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release
    else
      !cargo build --release --no-default-features --features json-rpc
    endif
  endif
endfunction
Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

" Latex
Plug 'xuhdev/vim-latex-live-preview'

" HTML
Plug 'alvan/vim-closetag'

" Motion
Plug 'wesQ3/vim-windowswap'	  "\ww to select window to swap
Plug 'easymotion/vim-easymotion' "\\<motion> search, it's awesome!
Plug 'terryma/vim-multiple-cursors'
Plug 'takac/vim-hardtime'

" Commands
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'qpkorr/vim-bufkill' " :BD :bd
Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
" Plug 'kassio/neoterm'


" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Interface
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Colorschemes
Plug 'rakr/vim-one'
Plug 'ajh17/Spacegray.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'morhetz/gruvbox'
Plug 'AlessandroYorba/Sierra'
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim'

" Other
" Plug 'drmikehenry/vim-fixkey'
Plug 'kien/rainbow_parentheses.vim'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}

call plug#end()            " required

filetype plugin indent on    " required

"""""""""""""""""""""""""""""
" Colors
syntax enable
set background:dark
" colorscheme flattened_dark
" let g:seoul256_background = 234
colorscheme jellybeans
" colorscheme seoul256
let g:airline_theme = 'deus'
" set t_Co=16

"""""""""""""""""""""""""""""
" Key mappings
map <F4> ;NERDTreeToggle<CR>
map <F1> ;bprevious<Enter>
map <F2> ;bnext<Enter>
" fuzzy file searching using fzf
map <c-g> ;CtrlPFunky<Enter>
map <c-p> ;Files<Enter>
map <c-b> ;Buffers<Enter>
" swap shift - ; to ; only in normal mode
nnoremap ; :
nnoremap : ;

nnoremap <Leader>t :call Open_term()<CR>
nnoremap <Leader>h :vertical resize -5<CR>
nnoremap <Leader>l :vertical resize +5<CR>
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

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

function! GoDef() abort
    let wordUnderCursor = expand("<cword>")
    execute "CtrlPFunky " . wordUnderCursor
    call feedkeys("\<CR>")
endfunction

nnoremap <Leader>g :call GoDef()<CR>


" Custon Functions

function! Open_term() abort
    exec "vs"
    exec "term"
endfunction


function! PrettyPrintJson() abort
    exec ":%!python -m json.tool"
endfunction

" aug QFClose
"   au!
"   au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
" aug END

" " custom function that moves the qf window
" function! MoveQuickFix() abort
"     winc R
"     vertical resize -30
" endfunction
" autocmd FileType qf call MoveQuickFix()

"""""""""""""""""""""""""""""
" Options
" let c='a'
" while c <= 'z'
"   exec "set <A-".c.">=\e".c
"   exec "imap \e".c." <A-".c.">"
"   let c = nr2char(1+char2nr(c))
" endw

" make Esc happen without waiting for timeoutlen
" fixes Powerline delay
" augroup FastEscape
"   autocmd!
"   au InsertEnter * set timeoutlen=0
"   au InsertLeave * set timeoutlen=1000
" augroup END

set number relativenumber " adds hybrid numbers
set statusline+=%{FugitiveStatusline()} " adds git info on the statusline
set scrolloff=15		" scroll when reaching end of page
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
" set cursorline "show a visual line under the cursor's current line
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
set hidden
set timeoutlen=1000
set ttimeoutlen=0
set nowrap
set nocursorcolumn
set cursorline
" syntax sync minlines=256
set re=1
set nogdefault
set splitbelow
set splitright
set clipboard+=unnamedplus


" rainbow_parentheses
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

" hard time conf
let g:hardtime_default_on = 0
let g:hardtime_ignore_quickfix = 1
let g:hardtime_ignore_buffer_patterns = ["NERD.*"]

" deoplete conf
let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('min_pattern_length', 1)
call deoplete#custom#option('auto_complete_delay', 1)

" python-mode conf
" let python_highlight_all = 1 "enable all Python syntax highlighting features
" let g:pymode_python = 'python3'
" let g:pymode_lint_cwindow = 0

" Goyo conf
" let g:goyo_linenr = 1

" Vim go conf
let g:syntastic_mode_map = { "mode" : "passive" }
let g:move_key_modifier = "A"
let g:deoplete#enable_at_startup = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:closetag_filenames = "*.html, *.xhtml, *.phtml, *.php, *.jsx, *.js"
let g:multi_cursor_select_all_word_key = '<C-a>'

" Syntastic config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

autocmd FileType vue setlocal shiftwidth=2 tabstop=2
autocmd FileType js setlocal shiftwidth=2 tabstop=2
autocmd FileType ejs setlocal shiftwidth=2 tabstop=2
autocmd FileType tsx setlocal shiftwidth=2 tabstop=2
autocmd BufNewFile,BufRead *.cu set filetype=cpp

let NERDTreeShowHidden=1
let g:ctrlp_map = ''
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = 'c'

" rpt stuff
set rtp+=~/.fzf
