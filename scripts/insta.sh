#!/usr/bin/env bash
# author:   Marcos Oliveira <contato@terminalroot.com.br>
# license:  GPLv3
# Credit: Franklin Souza
# Telegram: @FranklinTech

INSTAVERSION="${0##*/} - version: 1.0 - Download instagram pictures, albums and videos."

usage(){
  cat <<EOF
usage: ${0##*/} [options] [file/url ...]

 Options:

  -v,--version  Print version
  -h,--help     Show this help message
  -f,--file     Get urls from file

 Examples:

  instagram https://www.instagram.com/p/BnrplkmhY0T/
  instagram https://www.instagram.com/p/BnrplkmhY0T/ https://www.instagram.com/p/CnrpmmmhY0X/ # ...
  instagram -f file.txt

 * Where the file must have the urls that have Instagram images and/or videos, they can be on each line,
either separated or with blanks, ... they can not be stuck together.

EOF

}

[[ -z "$1" ]] && echo -e "Inform the url.\nUse: ${0##*/} --help" && exit 1


instagram(){

   _pg=$(mktemp)

   wget "$1" -O "$_pg" 2>/dev/null

   if [[ "$(grep 'mp4' $_pg)" ]]; then

      _arq=$(sed -n '/mp4/{p;q;}' "$_pg" | sed 's/.*content..//g;s/\".*//g')

      echo -ne 'Downloading...\r'
      wget "$_arq" 2>/dev/null

   else

      _arq=$(sed 's/https/\n&/g' "$_pg" | sed 's/jpg.*/jpg/g' | egrep -o '^http.*jpg$' | sed -r '/[0-9]+x[0-9]+/d' | sort | uniq | grep -o '.*e35.*')

      _num=$(sed 's/https/\n&/g' "$_pg" | sed 's/jpg.*/jpg/g' | egrep -o '^http.*jpg$' | sed -r '/[0-9]+x[0-9]+/d' | sort | uniq | grep -o '.*e35.*' | wc -l)

      _start=1

      while [[ "$_start" -le "$_num" ]]; do

         echo -ne "Baixando...\r"
         wget $(echo $_arq | awk "{print \$$_start}") 2>/dev/null

         let _start=_start+1

      done

   fi

}

fileinsta(){

   _tmpfile=$(mktemp)
   sed '/^$/d' "$1" > "$_tmpfile"
   sed -i ':a ; $!N ; s/\n/ /g ; ta' "$_tmpfile"
   $0 $(cat $_tmpfile)

}



while [[ "$1" ]]; do

   case "$1" in

   -v|--version) echo $INSTAVERSION && exit 0 ;;
   -h|--help) usage && exit 0 ;;

   -f|--file)

      shift

      if [[ "$(egrep -v '^https://(www.)?instagram.com/[a-z]+/[_a-zA-Z0-9-]+.*(/)?$' $1 2>&-)" || ! -f "$1" ]]; then
         echo 'Invalid file.'
         exit 1
      else
         fileinsta "$1"
         exit 0
      fi

   ;;

   *)
      if [[ "$1" =~ ^https://(www.)?instagram.com/[a-z]+/[_a-zA-Z0-9-]+.*(/)?$ ]]; then
         instagram "$1"
      else
         echo "Invalid parameter: '$1'"
         exit 1
      fi
   ;;

   esac

   shift
done
