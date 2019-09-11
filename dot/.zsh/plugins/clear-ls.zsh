zle -N clear-ls
autoload clear-ls

function clear-ls() {
  clear
  exa -F
  if test `date '+%u'` -eq 5; then
    echo 'ᓚᘏᗢ  < 今日は金曜日！やばそうな修正のリリースは考えよう！'
  fi
  echo
  zle reset-prompt
}
