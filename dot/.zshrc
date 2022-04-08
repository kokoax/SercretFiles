# zmodload zsh/zprof && zprof

alias mm='v ~/memos/work/memo.md'
alias mg='/Users/y-tokoi/repos/my_favorit_memos/my_favorit_memos --t'
alias ms='/Users/y-tokoi/repos/my_favorit_memos/my_favorit_memos --t | peco | awk -F ":" "{print $1}" | xargs -I{} ruby main.rb -e {}'

#一定時間で画面がOFFにならないようにする
# xset s off        #BlankTimeをoff
# xset dpms 0 0 0   #DPMSの機能をそれぞれoff

# コンソール透過(カーソルが触ってるwindowを透過するからよくない) # alacrittyなら本体についてる
# transset-df 0.8 -p 1> /dev/null

bindkey -e

# Created by newuser for 5.0.2
LANG=ja_JP.UTF-8

# neovim のinit.vimのフォルダを探すのに利用
export XDG_CONFIG_HOME=$HOME/.config

#コマンドを10000保存する
export HISTFILE=~/.zsh_history
export HISTSIZE=100000
export SAVEHIST=100000

# home binファイル をエクスポート
export PATH=$HOME/.bin:$PATH # 他の方の実行ファイル
export PATH=$HOME/.mybin:$PATH # 自分の実行ファイル
# local binファイル をエクスポート
export PATH=$HOME/.local/bin:$PATH # binをPATHに追加するのも忘れずに
# Homebrew
export PATH=/opt/homebrew/bin:$PATH

# キャッシュを使うことでパッケージマネージャのupdateを速くする
zstyle ':completion:*' use-cache true

#historyコマンドを共有しない
#setopt HIST_NO_STORE

#以下２つは同じコマンドを記録しないようにするオプション
setopt HIST_IGNORE_DUPS
setopt SHARE_HISTORY

#開始と終了を記録?
setopt HIST_EXPAND

#ビープ音を出さない
setopt nolistbeep

##色を使う
setopt prompt_subst

##補完候補一覧をファイル種別ごとに色を変える
setopt list_types

##補完機能の有効化
autoload -Uz compinit
compinit -u

#Tab補完を詰めて表示する
setopt list_packed

#auto_pushd cdで今まで移動したパスを補完する
setopt auto_pushd

##これを入れるとターミナル表示が適応される
unsetopt correct
set -0

#aliasを展開して補完
unsetopt complete_aliases

setopt auto_cd		#cdを入力しなくてもディレクトリを移動できる
setopt auto_pushd	#移動したディレクトリを記録する

#補完した候補を自動表示
autoload predict-on
predict-on

#historyとzhr_hisotoryの共有
setopt SHARE_HISTORY

autoload bashcompinit
bashcompinit

# 補完を選択できるオプション？
#setopt menu_complete


# タブ補完で表示されるものの設定
# zstyle ':completion:*' verbose yes
# zstyle ':completion:*:descriptions' format '%B%d%b'
# zstyle ':completion:*:messages' format '%d'
# zstyle ':completion:*:warnings' format 'No matches for: %d'
# zstyle ':completion:*' group-name ''

# [ -f ~/.bin/zen ] && ~/.bin/zen

# GoEnv
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source $HOME/.gvm/scripts/gvm
export PATH=$HOME/.ghq/bin:$GOPATH/bin:$PATH
export GOPATH=$GOPATH:$HOME/.ghq
export gowork=$GOPATH/src/github.com/kokoax

# export NVM_DIR="$HOME/.config"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# kiex(elixirのversion manager)の設定
export PATH=~/.kiex/bin:$PATH
[[ -s "$HOME/.kiex/scripts/kiex" ]] && source "$HOME/.kiex/scripts/kiex"

# anyenv
if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init - --no-rehash)"
fi

export EDITOR=nvim
eval "$(direnv hook zsh)"

# ruby settings
export PATH=$(ruby -e 'print Gem.user_dir')/bin:$PATH

# roswell settings
export PATH=$HOME/.roswell/bin:$PATH
# rust settings
export PATH=$HOME/.cargo/bin:$PATH

# コマンドのオプション補完ファイルをfpathに追記
[ -e ~/.zsh/lib ] && export FPATH=$FPATH:$HOME/.zsh/lib

# 分割した.zshファイルを読み込み
[ -f ~/.zsh/zsh.plugins ]	&& source ~/.zsh/zsh.plugins
[ -f ~/.zsh/zsh.alias ]		&& source ~/.zsh/zsh.alias
[ -f ~/.zsh/zsh.keybind ]	&& source ~/.zsh/zsh.keybind
[ -f ~/.zsh/zsh.color ]		&& source ~/.zsh/zsh.color

if [ ~/.zshrc -nt ~/.zshrc.zwc ]; then
  zcompile ~/.zshrc
fi

# if (which zprof > /dev/null 2>&1) ;then
#   zprof
# fi

tmux

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
