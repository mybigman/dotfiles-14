#!/bin/bash
#
#
# ------------------------------------------------------------ #
#
#
# imdb-cli       Script para consultar filmes|séries|atores
#                pelo site imdb.com.
#                Baseado no codigo da url ou no nome dos
#                atores|filmes|series.
#
#
# requer         lynx,gawk,sed,grep
#
#
# funcionamento:
#
# 1-             O imdb referencia os filmes|series com um
#                (ttxxxx) e os atores com (nmxxxx) na url,
#                onde x são números.
#                O script pega a página de acordo com essa
#                referencia. Se digitar a referencia o script
#                pega direto a página. Se digitar nome de ator
#                ou serie|filme, o script baixa o html com as
#                várias possibilidades e então pega a Primeira
#                ttxxxx que aparece. Pega a primeira pois na pagina
#                aparecem todas as ttxxx referentes a todas as
#                posibilidades e o script não tem como saber
#                qual é qual então pega a primeira.
#                Esta forma é mais falivel, pois por exemplo:
#                Se digitar Quantico, o script em vez de pegar a
#                série Quantico, pega a série Criminal Minds porque
#                lá no imdb o Criminal Minds aparece em baixo do
#                titulo -- aka Quantico e como é mais famosa aparece
#                primeiro.
#                Dito isto, a maior parte dos atores e filmes|series
#                dá para pegar digitando o nome mesmo, que é bem mais
#                confortavel do que ter que ir procurar a referencia.
#
# 2-             O script tenta ser o mais tolerante possivel
#                com a escrita.
#                Ex: se escrever ncis em vez de NCIS o script pega
#                a serie certa.
#                Mas se escrever ncis los angeles em vez de
#                ncis: los angeles, pode ser que falhe.
#
# 3-             Nos filmes|series quando mostra os atores que
#                participam da serie|filme e os seus papeis, mostra
#                duas vezes o nome dos atores. Deve ter forma de fazer
#                mostrar só uma vez, mas não me ocorreu nenhuma então fica
#                assim.
#
# 4 -            Para os atores não mostra a filmografia toda,
#                só mostra 4 filmes ou series que aparece no imdb
#                na parte "Known For". Senão não havia tela para tudo kk.
#                E mostra a descrição do ator, tipo:
#
#                "Amy Lou Adams was born in Vicenza, Veneto, Italy,
#                to American parents, Kathryn (Hicken) and Richard Kent Adams,
#                a U.S. serviceman who was stationed at Caserma Ederle
#                in Italy at the time. She was raised in a Mormon family of
#                seven children in Castle Rock, Colorado, and has English,
#                as well as smaller amounts of Danish, Swiss-German, and Norwegian,..."
#
# 5-             O script usa o gawk -- dizem que há coisas que tem no
#                gawk que não tem no awk (não sei se é mesmo..),
#                mas aprendi o gawk, então  é ele que uso.
#                Usa por exemplo a Built-in IGNORECASE e funçao gsub.
#
#
# autor          pedro fernandes
# email          pedrobfernandes@protonmail.com
#
#
# ------------------------------------------------------------ #
#
#
# Constantes
#
#
Base_Url="https://www.imdb.com/"                  # url imdb
Query_Url="${Base_Url}find?q="                    # url de consulta
Query_Actor="${Base_Url}name/nm"                  # url para pegar nome de actor
Query_Title="${Base_Url}title/tt"                 # url para pegar filme/serie
Actor_Ref="$(mktemp $HOME/actor_refXXXXXX)"       # arquivo com a ref nmxxxxx do ator
Flix_Ref="$(mktemp $HOME/flix_refXXXXXX)"         # arquivo com a ref ttxxxxx do filme/serie
Flix="$(mktemp $HOME/flixXXXXXX)"                 # arquivo com de descricao de serie/filme não filtrado
Flix_Resumo="$(mktemp ${HOME}/flix_resumXXXXXX)"  # arquivo com o resultado filme/serie filtrado
Actor="$(mktemp $HOME/actorXXXXXX)"               # arquivo com dados do ator não filtrado
Actor_Resumo="$(mktemp $HOME/actor_resumXXXXXX)"  # arquivo com dados do ator filtrado
LYNX="$(which lynx)"
#
#
# ------------------------------------------------------------ #
#
#
# Funcoes
#
#
limpeza()
{
   rm -f $Actor_Ref $Flix_Ref $Flix $Flix_Resumo \
   $Actor $Actor_Resumo
}
#
#
erro_padrao()
{
   echo "${0##*/}: ${1:- Erro Desconhecido}" >&2
   exit 1
}
#
#
lista_items()
{
   type $LYNX &> /dev/null || \
   erro_padrao "Tem que ter o programa lynx instalado."
   #
   #
   type gawk &> /dev/null ||
   erro_padrao "Tem que ter o gawk instalado."
}
#
#
actor_relato()      # mostra os dados do ator
{
   sed -n '/<meta name="title"/,/$/p' $Actor | sed '
   s/<.*="//g
   s/".*\/>//g
   s/&quot;/"/g' | fmt -u | sed 's/^ *//g' | sed '2i\\n' > $Actor_Resumo
   #
   #
   sed -n '/Known For/,/if/p' $Actor | \
   grep '^title=".*"$' | sed '
   s/^.*="//g
   s/"//g' | \
   sed '1i\\nKnown For:\n' >> $Actor_Resumo
   #
   #
   clear
   cat $Actor_Resumo
   echo
   exit 0
}
#
#
flix_relato()    # mostra os dados do filme|serie
{

   gawk '/\(BUTTON\) Rate This/,/^Stars/{print $0}' $Flix > $Flix_Resumo
   sed -n '/^Cast/,/^Plot Keywords/p' $Flix >> $Flix_Resumo
   #
   #
   sed 's/\[[[:alnum:][:punct:]]*\]//g' $Flix_Resumo | sed '
   /Episode Guide/,/^$/d
   /^Stars:/d
   /See/,/Edit/d
   /Rate This/d
   /Plot/,/^Plot/d' | sed '/^Creator/i\\n' |
   gawk '
   BEGIN {IGNORECASE=1}
   {gsub(".*poster[s]?","",$0)}
   {gsub(".*video[s]?","",$0)}
   {gsub(".*image[s]?","",$0)}
   {gsub(".*trailer[s]?","",$0); print}'
   #
   #
   exit 0
}
#
#
actor_name()    # pega a ref do ator xxxxx baseado no nome
{
   clear
   echo -n "Digite nome de ator|atriz: > "
   read nome
   echo "Pegando dados. Aguarde..."
   #
   #
   $LYNX -source "${Query_Url}$nome" > $Actor_Ref
   $LYNX -source "${Query_Actor}$(grep '/name/[[:alnum:]]*/' $Actor_Ref | \
   cut -d '=' -f 4 | cut -d '/' -f 2-3 | cut -c 8-)" > $Actor
   actor_relato
}
#
#
flix_name()     # pega a ref do filme|serie xxxx baseado no nome
{
   clear
   echo -n "Digite nome de filme|serie: > "
   read nome2
   echo "Pegando dados. Aguarde..."
   #
   #
   $LYNX -source "${Query_Url}$nome2" > $Flix_Ref
   $LYNX -dump "${Query_Title}$(grep 'href="/title' $Flix_Ref | gawk '
   BEGIN {RS="> <"} {print $0}' | grep -m 1 'href="/title' | \
   cut -d '/' -f 3 | cut -c 3-)" > $Flix
   flix_relato
   #
   #
}
#
#
actor_ref()
{
   clear
   echo "Digite a referencia do ator|atriz sem o nm"
   echo -n "Ex: original nmxxxxx - digite xxxxx - x são números: > "
   read actor_num
   #
   #
   local regex="$(echo $actor_num | grep -E '^[[:digit:]]+$')"
   if [ -z "$regex" ]
   then
      erro_padrao "Digite apenas números."
   else
      echo "Pegando dados. Aguarde..."
      $LYNX -source "${Query_Actor}$actor_num" > $Actor
   fi
   #
   #
   actor_relato
}
#
#
flix_ref()
{
   clear
   echo "Digite a referencia do filme|serie sem o tt"
   echo -n "Ex: original ttxxxxx - digite xxxxx - x são números: > "
   read flix_num
   #
   #
   local regex="$(echo $flix_num | grep -E '^[[:digit:]]+$')"
   if [ -z "$regex" ]
   then
      erro_padrao "Digite apenas números."
   else
      echo "Pegando dados. Aguarde..."
      $LYNX -dump "${Query_Title}$flix_num" > $Flix
   fi
   #
   #
   flix_relato
}
#
#
menu()
{
   clear
   echo
   echo -e "\t\t\t\t\timdb-cli -- Internet Movie Database - cli\n\n"
   echo -e "\t\t\t\t\t1. Consultar ator|atriz por nome"
   echo -e "\t\t\t\t\t2. Consultar ator|atriz por referencia. ex: nmxxxxx"
   echo -e "\t\t\t\t\t3. Consultar filme|série por nome"
   echo -e "\t\t\t\t\t4. Consultar filme|série por referencia ex: ttxxxxx"
   echo -e "\t\t\t\t\t0. Abortar e saír."
   echo -en "\n\n\t\t\t\t\tDigite a opção: > "
   read -n 1 opcao
   #
   #
   case $opcao in
   1)
      actor_name
      ;;
   2)
      actor_ref
      ;;
   3)
      flix_name
      ;;
   4)
      flix_ref
      ;;
   0)
      echo
      echo "Saíndo do script..."
      echo
      exit 0
      ;;
   *)
      echo
      erro_padrao "Opção invávlida. Abortando..."
      ;;
   esac
}
#
#
# ------------------------------------------------------------ #
#
#
# Principal
#
#
trap limpeza SIGINT SIGTERM EXIT
#
#
lista_items
menu
#
#
# ------------------------------------------------------------- #
#
#
exit $?
#
#
# ------------------------------------------------------------#
