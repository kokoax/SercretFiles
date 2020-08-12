zle -N clear-ls
autoload clear-ls

function clear-ls() {
  clear
  exa -F

  git status 2> /dev/null > /dev/null
  if [ $? -eq 0 ]; then
    git status -s
  fi

  echo 'ᓚᘏᗢ  < 調べてないことを説明するのはやめよう。まとめてから話そうね'
  if test `date '+%u'` -eq 5; then
    echo 'ᓚᘏᗢ  < 今日は金曜日！やばそうな修正のリリースは考えよう！'
  fi
  echo
  zle reset-prompt
}
