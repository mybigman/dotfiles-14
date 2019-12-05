#!/bin/bash

# RACHA CUCA v1.0
# Credit: Franklin Souza
# Telegram: @FranklinTech
# Xerxes Lins (www.vivaolinux.com.br/~xerxeslins)
# GPL

#   COMO JOGAR:
#
#   Objetivo: colocar os números na ordem de 01 até 15. Assim:
#
#   +----+----+----+----+
#   | 01 | 02 | 03 | 04 |
#   +----+----+----+----+
#   | 05 | 06 | 07 | 08 |
#   +----+----+----+----+
#   | 09 | 10 | 11 | 12 |
#   +----+----+----+----+
#   | 13 | 14 | 15 | __ |
#   +----+----+----+----+
#
#   Para mover um NÚMERO para o espaço vazio você deve usar as setas
#   direcionais (cima, baixo, direita e esquerda). Para que não haja confusão:
#   as setas movem os NÚMEROS e não o espaço vazio (__).
#
#   Para fechar o jogo use Ctrl+c.
#
#   Obs.: aleatoriamente nem toda configuração inicial permite a resolução
#   do problema, mas o script só cria problemas solúveis.
#
########################################################################

bold=$(tput bold)
normal=$(tput sgr0)

function _embaralha_tudo () {
   #Embaralha uma lista de números consecutivos (01 a 15)
   X=$( shuf -e $(seq -w 01 15))

   #Adiciona os números embaralhados ao vetor Y
   for i in {0..14}; do
      Y[$i]=$(echo $X | cut -d " " -f $(( $i + 1 )) )
   done

   #Atribui o espaço vazio
   VAZIO=15
   Y[$VAZIO]="__"

   #Checa se o jogo tem solução. Se não tiver, refaz o jogo.
   #Para mais informações:
   #http://www.geeksforgeeks.org/check-instance-15-puzzle-solvable/
   _inversoes
   if [ $(( $INVERSAO % 2)) -eq 0 ]
      then
         _desenha
      else
         _embaralha_tudo
   fi
}

#Conta o número de inversões
function _inversoes () {
   INVERSAO=0
   for i in {0..13}; do
      N1=$(echo ${Y[$i]})
      x=$(( $i + 1 ))
      while [ $x -lt 15 ]
      do
         N2=$(echo ${Y[$x]})
         if [ $N1 -gt $N2 ]
            then
               INVERSAO=$(( $INVERSAO + 1 ))
         fi
         x=$(( $x + 1 ))
         clear
         echo "Criando um problema solúvel. Aguarde...
         "
         echo "$i. $N1 > $N2 ($INVERSAO)"
         sleep 0.02
      done
   done
}

#Função que enconta o índice da casa vazia no vetor
function _vazio () {
   for i in {0..15}; do
      if [ "${Y[$i]}" == "__" ]
         then
            VAZIO=$i
      fi
   done
}

#Compara cada casa para ver se está na ordem certa
function _conseguiu () {
   FINAL=$(echo $(sort <<<"${X[@]:0:44}"))
   ATUAL=${Y[@]:0:15}
   if [ "$ATUAL" == "$FINAL" ]
      then
            #Exibe a mensagem e encerra!
            echo "CONSEGUIU!!!
            "
            exit 0
   fi
}

#Realiza o movimento da troca
function _move () {
   TEMP=${Y[$POSICAO]}
   Y[$POSICAO]=${Y[$VAZIO]}
   Y[$VAZIO]=$TEMP
}

#Função para trocar ao pressionar as setas
function _troca () {

   #Verifica distância entre o número que deseja mover e a casa vazia.
   #Isso determina a direção (esquerda, direita, cima e baixo).
   DIST=$(( $POSICAO - $VAZIO ))

   #Colunas laterais
   COLUNA1=("3" "7" "11" "15")
   COLUNA2=("0" "4" "8" "12")

   #Mover para esquerda
   if  [ $DIST -eq -1 ]
      then
         if [[ ! " ${COLUNA1[@]} " =~ " ${POSICAO} " ]]; then _move; fi
   fi

   #Mover para direita
   if  [ $DIST -eq 1 ]
      then
         if [[ ! " ${COLUNA2[@]} " =~ " ${POSICAO} " ]]; then _move; fi
   fi

   #Mover para cima ou para baixo
   if  [ $DIST -eq 4 ] || [ $DIST -eq -4 ]; then _move; fi
}

#Verifica a possibilidade da troca
function _verifica () {

   #Opção do jogador
   OPT="${Y[$NUM]}"

   #Checa posição do número escolhido e se o mesmo pertence ao vetor
   PERTENCE="0"
   for i in {0..15}; do
      if [ "${Y[$i]}" == "$OPT" ] || [ "${Y[$i]}" == "0$OPT" ]
         then
            POSICAO=$i
            PERTENCE="1"
      fi
   done

   #Se pertence, pode trocar.
   if [ $PERTENCE == "1" ]
      then
         _troca
   fi
   _desenha
}

#"Desenha" o jogo
function _desenha () {
   _vazio
   clear
   echo "Racha-cuca!"
   #echo "$INVERSAO: ${Y[@]:0:15}"
   echo "${bold}
   +----+----+----+----+
   | ${Y[0]} | ${Y[1]} | ${Y[2]} | ${Y[3]} |
   +----+----+----+----+
   | ${Y[4]} | ${Y[5]} | ${Y[6]} | ${Y[7]} |
   +----+----+----+----+
   | ${Y[8]} | ${Y[9]} | ${Y[10]} | ${Y[11]} |
   +----+----+----+----+
   | ${Y[12]} | ${Y[13]} | ${Y[14]} | ${Y[15]} |
   +----+----+----+----+${normal}"
   echo ""
   echo "Use as setas para mover os NÚMEROS"
   echo "Use Ctrl+c para encerrar"
   echo "$INVERSOES"
   _conseguiu
   read -n3 -s INPUT
   case $INPUT in
   $'\e[A') NUM=$(( $VAZIO + 4 ));;
   $'\e[B') NUM=$(( $VAZIO - 4 ));;
   $'\e[C') NUM=$(( $VAZIO - 1 ));;
   $'\e[D') NUM=$(( $VAZIO + 1 ));;
   *) _desenha;;
   esac
   _verifica
}
_embaralha_tudo
