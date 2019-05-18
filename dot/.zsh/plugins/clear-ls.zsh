zle -N clear-ls
autoload clear-ls

function clear-ls() {
  clear
  ls
  echo
  zle reset-prompt
}
