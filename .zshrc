# Created by newuser for 5.0.2

##環境変数LANGの設定
export LANG=ja_JP.UTF-8

##色を使う
setopt prompt_subst
##補完候補一覧をファイル種別ごとに色を変える
setopt list_types
##補完機能の強化
autoload -U compinit
compinit
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

unsetopt correct
set -0
