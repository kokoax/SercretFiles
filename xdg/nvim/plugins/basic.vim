" setting cfn file type
augroup cfn-template
    autocmd!
    autocmd BufRead,BufNewFile */templates/*.yml set ft=cloudformation.yaml
augroup end

" plug auto install
let s:xdg_config_path = empty($XDG_CONFIG_HOME) ? expand('~/.local/share') : $XDG_CONFIG_HOME
let s:nvim_config_path = s:xdg_config_path . '/nvim'
let s:cache_path = s:nvim_config_path. '/.cache'
let s:plug_path = s:cache_path . '/plug.vim'
let s:plug_repo = 'https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

if !filereadable(s:plug_path)
  call system('sh -c "curl -fLo ' . shellescape(s:plug_path) . ' --create-dirs ' . s:plug_repo . '"')
endif

" plug load
exec 'source ' . s:plug_path

" setup plug cache path
let s:plugin_cache_path = s:cache_path . '/plugged'
if !isdirectory(s:plugin_cache_path)
  call mkdir(s:plugin_cache_path, 'p')
endif

call plug#begin(s:plugin_cache_path)

if filereadable( expand( s:nvim_config_path . '/plugins/color.vim' ) )
  exec 'source ' . s:nvim_config_path . '/plugins/color.vim'
endif

if filereadable( expand( s:nvim_config_path . '/plugins/lsp.vim' ) )
  exec 'source ' . s:nvim_config_path . '/plugins/lsp.vim'
endif

if filereadable( expand( s:nvim_config_path . '/plugins/lang.vim' ) )
  exec 'source ' . s:nvim_config_path . '/plugins/lang.vim'
endif

if filereadable( expand( s:nvim_config_path . '/plugins/other.vim' ) )
  exec 'source ' . s:nvim_config_path . '/plugins/other.vim'
endif

call plug#end()

" path set python binary
let g:python2_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/bin/python3'

" settup color scheme
if has( 'mac' )
  " colorscheme hybrid
  " colorscheme molokai
  colorscheme jellybeans
  " colorscheme gruvbox
elseif has( 'unix' )
  "colorscheme hybrid
  "colorscheme molokai
  colorscheme jellybeans
  " colorscheme gruvbox
endif
