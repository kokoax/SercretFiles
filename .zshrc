# Created by newuser for 5.0.2
LANG=ja_JP.UTF-8

#ターミナル入力キーバインドをvi風にする
bindkey -v

#コマンドを10000保存する
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000

#以下２つは同じコマンドを記録しないようにするオプション
setopt hist_ignore_dups
setopt share_history

#ビープ音を出さない
setopt nolistbeep

##色を使う
setopt prompt_subst

##補完候補一覧をファイル種別ごとに色を変える
setopt list_types

##補完機能の強化
autoload -U compinit
compinit -u

#Tab補完を詰めて表示する
setopt list_packed

#auto_pushd cdで今まで移動したパスを補完する
setopt auto_pushd

##これを入れるとターミナル表示が適応される
unsetopt correct
set -0

setopt auto_cd		#cdを入力しなくてもディレクトリを移動できる
setopt auto_pushd	#移動したディレクトリを記録する

autoload predict-on
predict-on

[ -f ~/.zshrc.other ] && source ~/.zshrc.other
[ -f ~/.zshrc.color ] && source ~/.zshrc.color

