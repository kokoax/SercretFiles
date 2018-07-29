" dein settings
" dein自体の自動インストール
let s:cache_home = empty($XDG_CACHE_HOME) ? expand('~/.cache') : $XDG_CACHE_HOME
let s:dein_dir = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif

let &runtimepath = s:dein_repo_dir .",". &runtimepath
" set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" プラグイン読み込み＆キャッシュ作成
" let s:toml_file = fnamemodify(expand('<sfile>'), ':h').'/*.toml'
let s:lang_toml   = fnamemodify(expand('<sfile>'), ':h').'/lang.toml'
let s:color_toml  = fnamemodify(expand('<sfile>'), ':h').'/color.toml'
let s:other_toml  = fnamemodify(expand('<sfile>'), ':h').'/other.toml'
let s:shougo_toml = fnamemodify(expand('<sfile>'), ':h').'/shougo.toml'

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  call dein#load_toml(s:lang_toml)
  call dein#load_toml(s:color_toml)
  call dein#load_toml(s:other_toml)
  call dein#load_toml(s:shougo_toml)

  call dein#end()
  call dein#save_state()
endif

" 不足プラグインの自動インストール
if has('vim_starting') && dein#check_install()
  call dein#install()
endif

let g:python3_host_prog = '/usr/bin/python'

if has( 'mac' )
  colorscheme hybrid
  "colorscheme molokai
  "colorscheme jellybeans
elseif has( 'unix' )
  "colorscheme hybrid
  "colorscheme molokai
  colorscheme jellybeans
endif

