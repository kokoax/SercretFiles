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

" 256$B?';H$&@_Dj(B
set t_Co=256

syntax on

highlight Normal ctermbg=none
