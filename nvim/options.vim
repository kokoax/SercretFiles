" マウス操作の無効化
set mouse=

set encoding=utf-8
set fileencodings=utf-8,sjis,euc-jp,iso-2022-jp
set fileencoding=utf-8
set number

set textwidth=0

set smartindent
set expandtab
"autocmd BufNewFile,BufRead *.ws set noexpandtab

set autoindent
"HTML特有のインデントを切る.
autocmd FileType html :setlocal indentexpr=''

" syntax highlight で読み込む最大の行数
set synmaxcol=200

set display=lastline

set pumheight=10

set showmatch
set matchtime=1

set tabstop=2
set shiftwidth=2
set softtabstop=2

set nocompatible

set guioptions+=a

" 閉じカッコが入力されたら,対応するカッコをハイライトする
set showmatch

" 選択しいる行をしばらく時間が立つとハイライト
set cursorline

augroup AutoHTML
  autocmd!
  autocmd Filetype xml inoremap <buffer> </ </<C-x><C-o>
  autocmd Filetype html inoremap <buffer> </ </<C-x><C-o>
  autocmd FileType html imap <buffer><expr><tab>
        \ emmet#isExpandable() ? '\<plug>(emmet-expand-abbr)' :
        \ '\<tab>'
augroup END

autocmd BufNewFile, BufRead *.php setf html

" 全部インデントしてカーソルを元のの位置に戻す
function All_indent()
  let view = winsaveview()
  normal gg=G''
  silent call winrestview(view)
endfunction
" autocmd BufWritePre * :call All_indent()


