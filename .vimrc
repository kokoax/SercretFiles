set number

set smartindent
"set expandtab
set autoindent

set display=lastline

set pumheight=10

set showmatch
set matchtime=1

set tabstop=2
set shiftwidth=2
set softtabstop=2


nnoremap s <Nop>

nnoremap + <C-a>
nnoremap - <C-x>
nnoremap Y y$
nnoremap <CR> o<ESC>

nnoremap ss :split<CR>
nnoremap sv :vsplit<CR>

nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

nnoremap sH <C-w>H
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sr <C-w>r
nnoremap s> <C-w>>
nnoremap s< <C-w><
nnoremap s+ <C-w>+
nnoremap s- <C-w>-
nnoremap s= <C-w>=

nnoremap st :tabnew<CR>

imap <C-l> <ESC>

set nocompatible
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
  call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'

"インデントの深さを可視化
NeoBundle 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

"行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

"括弧を自動補完してくれる
"   なんか括弧前にスペース入れると閉じる方の括弧を消してくれない
"NeoBundle 'Townk/vim-autoclose'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'

"htmlのオートインデントを行うプラグイン
let g:html_indent_inctags = "html,body,head,tbody"

"color scheme Vimの色分けとか背景色とかのやつ
NeoBundle 'tomasr/molokai'
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'

"insertModeで開始する
let g:unite_enable_start_insert=1
"bufferList
noremap <C-P> :Unite buffer<CR>
"FileList
noremap <C-N> :Unite -buffer-name=file file<CR>
"最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-J> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-K> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

"NeoBundleで新たしいプラグインがあったらインストールが起動する。
NeoBundleCheck
call neobundle#end()

filetype plugin indent on
filetype indent on

set t_Co=256

syntax on

colorscheme molokai
highlight Normal ctermbg=none

"colorscheme jellybeans


