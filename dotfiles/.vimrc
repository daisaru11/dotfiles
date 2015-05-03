set nocompatible "vi非互換モード
" ファイルを開いた際に、前回終了時の行で起動
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" スワップファイル
set swapfile
set directory=/tmp

"#######################
" Display
"#######################
set number "行番号表示
set showmode "モード表示
set title "編集中のファイル名を表示
set ruler "ルーラーの表示
set showcmd "入力中のコマンドをステータスに表示する
set showmatch "括弧入力時の対応する括弧を表示
set laststatus=2 "ステータスラインを常に表示
set scrolloff=5 "スクロールの余白
set nowrap
set cursorline

"#######################
" Move
"#######################
set whichwrap=b,s,h,l,<,>,[,]

"#######################
" Syntax
"#######################

set smartindent "オートインデント
" tab関連
":set expandtab "タブの代わりに空白文字挿入
set list
set listchars=trail:-,tab:>\ ,extends:<

set tabstop=4
set shiftwidth=4
set softtabstop=0

" 補完
set completeopt=menu,menuone,longest " プレビューウィンドウ出さない

"#######################
" Search
"#######################
set ignorecase "検索文字列が小文字の場合は大文字小文字を区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set incsearch
set hlsearch

set wildmode=longest,list

"#######################
" Key Mapping
"#######################
"ノーマルモードで空白を挿入
"nnoremap <C-m> o<ESC>

"検索語を真ん中に表示
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

" insert mode での移動
imap <C-e> <END>
imap <C-a> <HOME>
"imap <C-j> <Down>
"imap <C-k> <Up>
"imap <C-h> <Left>
"imap <C-l> <Right>
imap <C-b> <Left>
imap <C-f> <Right>

" コロンセミコロン入れ変え
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
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'Rip-Rip/clang_complete'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'derekwyatt/vim-scala'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'gregsexton/gitv'
NeoBundle 'bling/vim-airline'
NeoBundle 'YankRing.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'tsukkee/unite-tag'
NeoBundle 'sudo.vim'
"NeoBundle 'majutsushi/tagbar'
NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'shawncplus/phpcomplete.vim'
NeoBundle 'fatih/vim-go'

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
syntax on "カラー表示

"ftplugin
filetype plugin on
filetype indent on

"coffeescript
"autocmd BufWritePost *.coffee silent CoffeeMake! -cb | cwindow | redraw!

"syntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
"let g:syntastic_disabled_filetypes = []
let g:syntastic_mode_map = { 'mode': 'passive',
	\ 'active_filetypes': ['php', 'python', 'ruby', 'javascript', 'coffee', 'html', 'css'],
	\ 'passive_filetypes': [] }
let g:syntastic_javascript_checker = 'jshint'


"go
let g:go_fmt_command = "goimports"

"#######################
" Color
"#######################
set t_Co=256
"colorscheme desert
colorscheme jellybeans


"#######################
" Unite
"#######################
" 入力モードで開始する
nnoremap [unite] <Nop>
nmap     <space>u [unite]
nnoremap <silent> [unite]f   :<C-u>Unite -buffer-name=files file<CR>
nnoremap <silent> [unite]m   :<C-u>Unite -buffer-name=files file_mru<CR>
nnoremap <silent> [unite]a   :<C-u>Unite -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]r   :<C-u>Unite file_rec/async:!<CR>
nnoremap <silent> [unite]g   :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]G   :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>

nnoremap <silent> [unite]p   :<C-u>Unite -buffer-name=register -prompt=">\  register<CR>
nnoremap <silent> [unite]t   :<C-u>UniteWithCursorWord -immediately tag<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')

let g:unite_enable_start_insert=1

if executable('ag')
	let g:unite_source_grep_command = 'ag'
	let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
	let g:unite_source_grep_recursive_opt = ''
endif

"#######################
" AutoCompletion
"#######################

" neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
"autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
"autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType java setlocal omnifunc=javacomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
	let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.css = '\v^\s+\w+|\w+[):;]?\s+|[@!]'
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
"let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'
"let g:neocomplcache_omni_patterns.java = '\%(\.\)\h\w*'
let g:neocomplcache_omni_patterns.go = '\h\w*\.\?'


"clang
if !exists('g:neocomplcache_force_omni_patterns')
	let g:neocomplcache_force_omni_patterns = {}
endif
let g:neocomplcache_force_overwrite_completefunc = 1
let g:neocomplcache_force_omni_patterns.c =
	\ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.cpp =
	\ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplcache_force_omni_patterns.objc =
	\ '\h\w\+\|[^.[:digit:] *\t]\%(\.\|->\)'
	"\ '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_force_omni_patterns.objcpp =
	\ '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:clang_complete_auto = 0
let g:clang_auto_select = 0
let g:clang_use_library = 1
"let g:clang_snippets = 1
"let g:clang_exec = '/usr/local/bin/clang'
"let g:clang_library_path = '/usr/local/lib/libclang.dylib'

"neosnippet
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)
" 
"imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: pumvisible() ? "\<C-n>" : "\<TAB>"
"smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
"\ "\<Plug>(neosnippet_expand_or_jump)"
"\: "\<TAB>"
 
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

