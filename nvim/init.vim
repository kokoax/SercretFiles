if filereadable( expand( '$HOME/.config/nvim/.vimrc.options' ) )
  source $HOME/.config/nvim/.vimrc.options
endif


if filereadable( expand( '$HOME/.config/nvim/.vimrc.keybind' ) )
  source $HOME/.config/nvim/.vimrc.keybind
endif

if filereadable( expand( '$HOME/.config/nvim/.vimrc.plugins' ) )
  source $HOME/.config/nvim/.vimrc.plugins
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

