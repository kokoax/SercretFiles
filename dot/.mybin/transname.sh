tran=$(echo $1 | iconv -f SJIS -t UTF8)
mv "$1" "$tran"
