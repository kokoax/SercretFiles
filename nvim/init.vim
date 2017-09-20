if filereadable( expand( '$HOME/.config/nvim/options.vim' ) )
  source $HOME/.config/nvim/options.vim
endif

if filereadable( expand( '$HOME/.config/nvim/keybind.vim' ) )
  source $HOME/.config/nvim/keybind.vim
endif

if filereadable( expand( '$HOME/.config/nvim/plugins/basic.vim' ) )
  source $HOME/.config/nvim/plugins/basic.vim
endif

set nocompatible
filetype off

filetype plugin indent on
filetype indent on

" 256色使う設定
set t_Co=256

syntax on

highlight Normal ctermbg=none

"Python3 support
let g:python3_host_prog = '/usr/bin/python3'

