" End completion
Plug 'tpope/vim-endwise'

" Filer
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
nnoremap <leader>n :Files<CR>
nnoremap <leader>m :Rg<CR> " Need install ripgrep binary

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
