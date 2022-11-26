" LanguageClient
Plug 'mattn/vim-lsp-settings'
Plug 'prabirshrestha/vim-lsp'

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> <C-]> :tab LspDefinition<CR>
    nmap <buffer> <C-[> :LspPeekDefinition<CR>
    nmap <buffer> K <plug>(lsp-hover)
    nnoremap <buffer> <expr><c-d> lsp#scroll(+4)
    nnoremap <buffer> <expr><c-u> lsp#scroll(-4)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

" Complement
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" Ale
Plug 'dense-analysis/ale'
Plug 'rhysd/vim-lsp-ale'
