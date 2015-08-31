# Created by newuser for 5.0.2

bindkey -v		#ターミナル入力キーバインドをvi風にする

#コマンドを10000保存する
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
#以下２つは同じコマンドを記録しないようにするオプション
setopt hist_ignore_dups
setopt share_history

#ビープ音を出さない
setopt nolistbeep
##環境変数LANGの設定
export LANG=ja_JP.UTF-8

##色を使う
setopt prompt_subst
##補完候補一覧をファイル種別ごとに色を変える
setopt list_types
##補完機能の強化
autoload -U compinit
compinit

#Tab補完を詰めて表示する
setopt list_packed

##これを入れるとターミナル表示が適応される
unsetopt correct
set -0

setopt auto_cd		#cdを入力しなくてもディレクトリを移動できる
setopt auto_pushd	#移動したディレクトリを記録する

##ターミナルの表示設定
case ${UID} in
	0)
		PROMPT="%B%{[31m%}%/#%{^[[m%}%b "
		PROMPT2="%B%{[31m%}%/#%{[m%}%b "
		SPROMPT="%B%{[31m%}%r correct? [n,y,a,e]:%{m%}%b "
		[ -n "${REMOTHEHOST}${SSH_CONNECTION}" ] &&
			PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
		;;
	*)
		PROMPT="%{[31m%}%/%%%{[m%} "
		PROMPT2="%{[31m%}%_%%%{[m%} "
		SPROMPT="%{[31m%}%r is correct? [n,y,a,e]:%{[m%} "
		[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] &&
			PROMPT="%{[37m%}${HOST%%.*} ${PROMPT}"
		;;
esac

