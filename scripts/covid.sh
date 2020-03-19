#!/usr/bin/env bash
# covid.sh
##########
#
# Imprime números a respeito do COVID-19 (doença causada pelo Coronavirus).
#

#cor=$(awk -F# '/secondary/{print $2;exit}' ${HOME}/.config/polybar/config_modules)

readonly API_URL='https://corona.lmao.ninja'
# Deixando claro que data é um array associativo
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

  # Primeiro dados globais:
  json="$(curl --silent "${API_URL}/all")"

  if ! json2array "$json"; then
    echo "ERRO: Falha ao obter os dados de $API_URL" >&2
    exit 1
  fi

  # Obtendo dados do Brasil
  json="$(curl --silent "${API_URL}/countries/brazil")"

  if ! json2array "$json"; then
    echo "ERRO: Falha ao obter os dados de $API_URL" >&2
    exit 1
  fi

echo " %{F#${cor}}%{F-} : ${data[cases]} | %{F#${cor}}%{F-} : ${data[todayCases]} | %{F#${cor}}%{F-} : ${data[deaths]} | %{F#${cor}}✞%{F-} : ${data[todayDeaths]} | %{F#${cor}}%{F-} : ${data[recovered]} | %{F#${cor}}%{F-} : ${data[critical]}"

}


main "$@"

