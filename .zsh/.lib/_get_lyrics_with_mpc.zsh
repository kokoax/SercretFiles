_get_lyrics_with_mpc() {
  _arguments \
    '(- *)'{-c,--current}'[get lyrics from current play music of mpd]' \
    '(- *)'{-s,--search}'[search music from mpd database and get lyrics]:search:->_type'

  case $state in
    _type)
      _describe 'type'
      # compadd "any" "title"
      ;;
    pattern)
      ;;
  esac
}

compdef _get_lyrics_with_mpc get_lyrics_with_mpc

