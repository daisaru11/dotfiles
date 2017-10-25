set nocompatible 
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

set swapfile
set directory=/tmp

"#######################
" Display
"#######################
set number
set showmode
set title
set ruler
set showcmd
set showmatch
set laststatus=2
set scrolloff=5
set nowrap
set cursorline

"#######################
" Move
"#######################
set whichwrap=b,s,h,l,<,>,[,]

"#######################
" Syntax
"#######################

set smartindent
set expandtab
set list
set listchars=trail:-,tab:>\ ,extends:<

set tabstop=2
set shiftwidth=2
set softtabstop=0

set completeopt=menu,menuone,longest

"#######################
" Search
"#######################
set ignorecase
set smartcase
set wrapscan
set incsearch
set hlsearch

set wildmode=longest,list

"#######################
" Key Mapping
"#######################

nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

nnoremap <C-w><Space> :bn<CR>
nnoremap <C-w><BS> :bp<CR>
nnoremap <C-w>n :bn<CR>
nnoremap <C-w>p :bp<CR>
nnoremap <C-w>d :bd<CR>

imap <C-e> <END>
imap <C-a> <HOME>
"imap <C-j> <Down>
"imap <C-k> <Up>
"imap <C-h> <Left>
"imap <C-l> <Right>
imap <C-b> <Left>
imap <C-f> <Right>

" Swap colons
noremap ; :
noremap : ;

" Tags
nnoremap    [Tag]   <Nop>
nmap    t [Tag]
nnoremap [Tag]t  <C-]>
nnoremap <silent> [Tag]n  :<C-u>tag<CR>
nnoremap <silent> [Tag]p  :<C-u>pop<CR>
nnoremap <silent> [Tag]l  :<C-u>tags<CR>
nnoremap <silent> [Tag]<C-l>  :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
nnoremap <silent> [Tag]<C-j>  <C-w><C-]>


"#######################
" plugin
"#######################

" neobundle
set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/

  call neobundle#begin(expand('~/.vim/bundle/'))
  NeoBundleFetch 'Shougo/neobundle.vim'
  call neobundle#end()
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neocomplcache'

NeoBundle 'scrooloose/syntastic'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'bling/vim-airline'
NeoBundle 'YankRing.vim'
NeoBundle 'junegunn/vim-easy-align'

" airline
"let g:airline_enable_fugitive=1
"let g:airline_enable_syntastic=1
let g:airline_left_sep=''
let g:airline_right_sep=''

"YankRing
nnoremap ,y :YRShow<CR>

"EasyAlign
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

"#######################
" File Type
"#######################
syntax on

"ftplugin
filetype plugin on
filetype indent on

"syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2

"#######################
" Color
"#######################
set t_Co=256
"colorscheme desert
colorscheme jellybeans

