
" Color Scheme
Plug 'tomasr/molokai'
Plug 'nanotech/jellybeans.vim'
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'

" Status bar to graphical
Plug 'itchyny/lightline.vim'
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ },
      \ }
function! LightlineFilename()
  return expand("%:p")
endfunction

" hightlight word by underline
Plug 'osyo-manga/vim-brightest'
let g:brightest_enable = 1
let g:brightest#highlight = {
      \   "group" : "BrightestUnderline"
      \}
