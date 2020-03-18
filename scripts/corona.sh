#!/usr/bin/env bash

# cores
C1="#f52d2d"
P1="#ffffff"
AL="#f52d2d"

# Fontes
NORMAL="Fira Code:Regular:size=7"
#PRAG="Fire Code-Regular:size=8"
#FontAwesome="^fn(FontAwesome)"

# Icons
time_icon="^i($HOME/.config/dzen2/clock.xbm)"
note_icon="^i($HOME/.config/dzen2/note.xbm)"
info_icon="^i($HOME/.config/dzen2/info.xbm)"
info2_icon="^i($HOME/.config/dzen2/info2.xbm)"
info3_icon="^i($HOME/.config/dzen2/info3.xbm)"

readonly API_URL='https://corona.lmao.ninja'

declare -A data

json2array() {
  local jsonData="$1"

  # Verificando se é um JSON válido
  jq empty <<<"$jsonData" 2>/dev/null || return 1

  while IFS== read -r key value; do
    data[$key]="$value"
  done < <(jq -r '. | to_entries | .[] | .key + "=" + (.value|tostring)' <<<"$jsonData")
}

main() {
  local json

# Obtendo dados do Brasil
  json="$(curl --silent "${API_URL}/countries/brazil")"

  if ! json2array "$json"; then
    echo "ERRO: Falha ao obter os dados de $API_URL" >&2
    exit 1
  fi


(
echo "^fn($PRAG)^fg($C1)${info_icon} COVID-19 - CORONAVIRUS^fg()"; echo

echo "^fn($PRAG)^fg($C1)Casos no Brasil^fg()"; echo
echo "^fg($P1)${info3_icon} Número de casos:............. ^fg()^fg($AL)${data[cases]}^fg()"
echo "^fg($P1)${info3_icon} Casos registrados hoje:....... ^fg()^fg($AL)${data[todayCases]}^fg()"
echo "^fg($P1)${info3_icon} Número de mortes:.............. ^fg()^fg($AL)${data[deaths]}^fg()"
echo "^fg($P1)${info3_icon} Mortes registradas hoje:....... ^fg()^fg($AL)${data[todayDeaths]}^fg()"
echo "^fg($P1)${info3_icon} Pacientes curados:............. ^fg()^fg($AL)${data[recovered]}^fg()"
echo "^fg($P1)${info3_icon} Pacientes em situação crítica: ^fg()^fg($AL)${data[critical]}^fg()"
echo""
echo                     "^fg($P1)by: Franklin Souza"

) | dzen2 -p -fn "$NORMAL" -x "1200" -y "30" -bg "#26282D" -fg "#666666" -l "11" -w "360" -sa "c" -e "onstart=uncollapse;button3=exit"

#Modifique x e y para ajustar a janela...

}

main "$@"
