" End completion
Plug 'tpope/vim-endwise'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
nnoremap <leader>n :Files<CR>
command! -bang -nargs=* GGrep
      \ call fzf#vim#grep(
      \   'git grep --line-number -- '.shellescape(<q-args>), 0,
      \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

nnoremap <leader>n :Files<CR>
nnoremap <leader>h :History<CR>
nnoremap <leader>m :GGrep<CR>

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
