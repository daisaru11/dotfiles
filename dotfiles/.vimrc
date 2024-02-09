autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

set swapfile
set directory=/tmp

set ttimeout
set ttimeoutlen=0

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
"set cursorline
set t_Co=256

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

