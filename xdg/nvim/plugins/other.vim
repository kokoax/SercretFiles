" End completion
Plug 'tpope/vim-endwise'

" Filer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <leader>n :Files<CR>
nnoremap <leader>m :Rg<CR>

" Indent visualizer plugin
Plug 'nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 1

" Unnecessary space visualizer plugin
Plug 'bronson/vim-trailing-whitespace'

" Quick program runner
Plug 'thinca/vim-quickrun'
let g:quickrun_no_default_key_mappings = 1
nmap <Leader>r <Plug>(quickrun)

" Edit config
Plug 'editorconfig/editorconfig-vim'

" Markdown folding
" Plug 'SidOfc/mkdx'
" let g:mkdx#settings = {
"   \ 'highlight': { 'enable': 1 },
"   \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
"   \ 'fold': {
"   \   'enable': 1,
"   \   'components': ['toc', 'fence'],
"   \ },
"   \ 'map': { 'enable': 1 },
" \ }

" indexで飛ぶコマンドでfzfを使う
fun! s:MkdxGoToHeader(header)
  call cursor(str2nr(get(matchlist(a:header, ' *\([0-9]\+\)'), 1, '')), 1)
endfun

fun! s:MkdxFormatHeader(key, val)
  let text = get(a:val, 'text', '')
  let lnum = get(a:val, 'lnum', '')
  if (empty(text) || empty(lnum)) | return text | endif

  return repeat(' ', 4 - strlen(lnum)) . lnum . ': ' . text
endfun

fun! s:MkdxFzfQuickfixHeaders()
  let headers = filter(map(mkdx#QuickfixHeaders(0), function('<SID>MkdxFormatHeader')), 'v:val != ""')
  call fzf#run(fzf#wrap(
        \ {'source': headers, 'sink': function('<SID>MkdxGoToHeader') }
        \ ))
endfun

nnoremap <silent> <Leader>I :call <SID>MkdxFzfQuickfixHeaders()<Cr>

Plug 'hashivim/vim-terraform'

Plug 'previm/previm'
let g:previm_open_cmd = 'open -a Google\ Chrome'
