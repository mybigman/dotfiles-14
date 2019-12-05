#!/bin/bash
######################################
# Script: jv.sh    ( Release 1.0 )   #
# Feito : Hertz S.                   #
# Obs   : Jogo da Velha              #
# Credit: Franklin Souza            #
# Telegram: @FranklinTech            #
######################################

tput clear

cat<<EOT


       |   |
    ---+---+---
       |   |
    ---+---+---
       |   |

EOT

#------------------------------------------------------------------------------

rm /tmp/jogadas.txt 2>/dev/null
cat<<EOT>/tmp/jogadas.txt
XXX
XXX
XXX
EOT

#------------------------------------------------------------------------------

Print_123()
{
   tput cup 2 5  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 2 9  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 2 13 ; echo "`tput smso`${valor}`tput rmso`"

   tput cup 2 7  ; echo "`tput smso`|`tput rmso`"
   tput cup 2 11 ; echo "`tput smso`|`tput rmso`"

   tput cup 2 4  ; echo "`tput smso` `tput rmso`"
   tput cup 2 6  ; echo "`tput smso` `tput rmso`"
   tput cup 2 8  ; echo "`tput smso` `tput rmso`"
   tput cup 2 10 ; echo "`tput smso` `tput rmso`"
   tput cup 2 12 ; echo "`tput smso` `tput rmso`"
   tput cup 2 14 ; echo "`tput smso` `tput rmso`"
}

Print_456()
{
   tput cup 4 5  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 4 9  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 4 13 ; echo "`tput smso`${valor}`tput rmso`"

   tput cup 4 7  ; echo "`tput smso`|`tput rmso`"
   tput cup 4 11 ; echo "`tput smso`|`tput rmso`"

   tput cup 4 4  ; echo "`tput smso` `tput rmso`"
   tput cup 4 6  ; echo "`tput smso` `tput rmso`"
   tput cup 4 8  ; echo "`tput smso` `tput rmso`"
   tput cup 4 10 ; echo "`tput smso` `tput rmso`"
   tput cup 4 12 ; echo "`tput smso` `tput rmso`"
   tput cup 4 14 ; echo "`tput smso` `tput rmso`"
}

Print_789()
{
   tput cup 6 5  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 6 9  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 6 13 ; echo "`tput smso`${valor}`tput rmso`"

   tput cup 6 7  ; echo "`tput smso`|`tput rmso`"
   tput cup 6 11 ; echo "`tput smso`|`tput rmso`"

   tput cup 6 4  ; echo "`tput smso` `tput rmso`"
   tput cup 6 6  ; echo "`tput smso` `tput rmso`"
   tput cup 6 8  ; echo "`tput smso` `tput rmso`"
   tput cup 6 10 ; echo "`tput smso` `tput rmso`"
   tput cup 6 12 ; echo "`tput smso` `tput rmso`"
   tput cup 6 14 ; echo "`tput smso` `tput rmso`"
}

Print_147()
{
   tput cup 2 5  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 4 5  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 6 5  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 3 5  ; echo "`tput smso`-`tput rmso`"
   tput cup 5 5  ; echo "`tput smso`-`tput rmso`"
}

Print_258()
{
   tput cup 2 9  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 4 9  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 6 9  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 3 9  ; echo "`tput smso`-`tput rmso`"
   tput cup 5 9  ; echo "`tput smso`-`tput rmso`"
}

Print_369()
{
   tput cup 2 13 ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 4 13 ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 6 13 ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 3 13 ; echo "`tput smso`-`tput rmso`"
   tput cup 5 13 ; echo "`tput smso`-`tput rmso`"
}

Print_159()
{
   tput cup 2 5  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 4 9  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 6 13 ; echo "`tput smso`${valor}`tput rmso`"

   tput cup 5 11  ; echo "`tput smso`+`tput rmso`"
   tput cup 3 7   ; echo "`tput smso`+`tput rmso`"
}

Print_357()
{
   tput cup 2 13 ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 4 9  ; echo "`tput smso`${valor}`tput rmso`"
   tput cup 6 5  ; echo "`tput smso`${valor}`tput rmso`"

   tput cup 3 11  ; echo "`tput smso`+`tput rmso`"
   tput cup 5 7   ; echo "`tput smso`+`tput rmso`"
}

#------------------------------------------------------------------------------

jogar()
{
   if [ "${1}" -eq "1" ]
   then
      linha1c2="`cat /tmp/jogadas.txt | head -1 | cut -c2,2`"
      linha1c3="`cat /tmp/jogadas.txt | head -1 | cut -c3,3`"
      linha2="`cat /tmp/jogadas.txt | head -2 | tail -1`"
      linha3="`cat /tmp/jogadas.txt | tail -1`"
      echo "${vx}${linha1c2}${linha1c3}" > /tmp/tmpj.$$
      echo "${linha2}"                  >> /tmp/tmpj.$$
      echo "${linha3}"                  >> /tmp/tmpj.$$
      mv /tmp/tmpj.$$ /tmp/jogadas.txt
      unset linha2 linha3 vx linha1c2 linha1c3
   fi

   if [ "${1}" -eq "2" ]
   then
      linha1c1="`cat /tmp/jogadas.txt | head -1 | cut -c1,1`"
      linha1c3="`cat /tmp/jogadas.txt | head -1 | cut -c3,3`"
      linha2="`cat /tmp/jogadas.txt | head -2 | tail -1`"
      linha3="`cat /tmp/jogadas.txt | tail -1`"
      echo "${linha1c1}${vx}${linha1c3}" > /tmp/tmpj.$$
      echo "${linha2}"                  >> /tmp/tmpj.$$
      echo "${linha3}"                  >> /tmp/tmpj.$$
      mv /tmp/tmpj.$$ /tmp/jogadas.txt
      unset linha2 linha3 vx linha1c1 linha1c3
   fi

   if [ "${1}" -eq "3" ]
   then
      linha1c1="`cat /tmp/jogadas.txt | head -1 | cut -c1,1`"
      linha1c2="`cat /tmp/jogadas.txt | head -1 | cut -c2,2`"
      linha2="`cat /tmp/jogadas.txt | head -2 | tail -1`"
      linha3="`cat /tmp/jogadas.txt | tail -1`"
      echo "${linha1c1}${linha1c2}${vx}" > /tmp/tmpj.$$
      echo "${linha2}"                  >> /tmp/tmpj.$$
      echo "${linha3}"                  >> /tmp/tmpj.$$
      mv /tmp/tmpj.$$ /tmp/jogadas.txt
      unset linha2 linha3 vx linha1c1 linha1c2
   fi

   if [ "${1}" -eq "4" ]
   then
      linha2c2="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c2,2`"
      linha2c3="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c3,3`"
      linha1="`cat /tmp/jogadas.txt | head -1`"
      linha3="`cat /tmp/jogadas.txt | tail -1`"
      echo "${linha1}"                   > /tmp/tmpj.$$
      echo "${vx}${linha2c2}${linha2c3}">> /tmp/tmpj.$$
      echo "${linha3}"                  >> /tmp/tmpj.$$
      mv /tmp/tmpj.$$ /tmp/jogadas.txt
      unset linha1 linha3 vx linha2c2 linha2c3
   fi

   if [ "${1}" -eq "5" ]
   then
      linha2c1="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c1,1`"
      linha2c3="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c3,3`"
      linha1="`cat /tmp/jogadas.txt | head -1`"
      linha3="`cat /tmp/jogadas.txt | tail -1`"
      echo "${linha1}"                   > /tmp/tmpj.$$
      echo "${linha2c1}${vx}${linha2c3}" >> /tmp/tmpj.$$
      echo "${linha3}"                   >> /tmp/tmpj.$$
      mv /tmp/tmpj.$$ /tmp/jogadas.txt
      unset linha1 linha3 vx linha2c1 linha2c3
   fi

   if [ "${1}" -eq "6" ]
   then
      linha2c1="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c1,1`"
      linha2c2="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c2,2`"
      linha1="`cat /tmp/jogadas.txt | head -1`"
      linha3="`cat /tmp/jogadas.txt | tail -1`"
      echo "${linha1}"                   > /tmp/tmpj.$$
      echo "${linha2c1}${linha2c2}${vx}">> /tmp/tmpj.$$
      echo "${linha3}"                  >> /tmp/tmpj.$$
      mv /tmp/tmpj.$$ /tmp/jogadas.txt
      unset linha1 linha3 vx linha2c3 linha2c4
   fi

   if [ "${1}" -eq "7" ]
   then
      linha3c2="`cat /tmp/jogadas.txt | tail -1 | cut -c2,2`"
      linha3c3="`cat /tmp/jogadas.txt | tail -1 | cut -c3,3`"
      linha1="`cat /tmp/jogadas.txt | head -1`"
      linha2="`cat /tmp/jogadas.txt | head -2 | tail -1`"
      echo "${linha1}"                   > /tmp/tmpj.$$
      echo "${linha2}"                  >> /tmp/tmpj.$$
      echo "${vx}${linha3c2}${linha3c3}">> /tmp/tmpj.$$
      mv /tmp/tmpj.$$ /tmp/jogadas.txt
      unset linha1 linha2 vx linha3c2 linha3c3
   fi

   if [ "${1}" -eq "8" ]
   then
      linha3c1="`cat /tmp/jogadas.txt | tail -1 | cut -c1,1`"
      linha3c3="`cat /tmp/jogadas.txt | tail -1 | cut -c3,3`"
      linha1="`cat /tmp/jogadas.txt | head -1`"
      linha2="`cat /tmp/jogadas.txt | head -2 | tail -1`"
      echo "${linha1}"                   > /tmp/tmpj.$$
      echo "${linha2}"                  >> /tmp/tmpj.$$
      echo "${linha3c1}${vx}${linha3c3}">> /tmp/tmpj.$$
      mv /tmp/tmpj.$$ /tmp/jogadas.txt
      unset linha1 linha2 vx linha3c1 linha3c3
   fi

   if [ "${1}" -eq "9" ]
   then
      linha3c1="`cat /tmp/jogadas.txt | tail -1 | cut -c1,1`"
      linha3c2="`cat /tmp/jogadas.txt | tail -1 | cut -c2,2`"
      linha1="`cat /tmp/jogadas.txt | head -1`"
      linha2="`cat /tmp/jogadas.txt | head -2 | tail -1`"
      echo "${linha1}"                   > /tmp/tmpj.$$
      echo "${linha2}"                  >> /tmp/tmpj.$$
      echo "${linha3c1}${linha3c2}${vx}">> /tmp/tmpj.$$
      mv /tmp/tmpj.$$ /tmp/jogadas.txt
      unset linha1 linha2 vx linha3c1 linha3c2
   fi

   if [ ${var} -gt 2 ]
   then
      check_play
   fi
}

#------------------------------------------------------------------------------

seq_123()
{
   conf="`cat /tmp/jogadas.txt | head -1 | grep X | wc -l`"

   if [ ${conf} -eq 0 ]
   then
      var1="`cat /tmp/jogadas.txt | head -1 | cut -c1,1`"
      var2="`cat /tmp/jogadas.txt | head -1 | cut -c2,2`"
      var3="`cat /tmp/jogadas.txt | head -1 | cut -c3,3`"
      tot="`expr ${var1} + ${var2} + ${var3}`"
         if [ ${tot} -eq 3 ] || [ ${tot} -eq 6 ]
         then
            STATUS="${tot}" ; REF="123"
         fi
   fi
   unset var1 var2 var3 tot conf
}

#------------------------------------------------------------------------------

seq_456()
{
   conf="`cat /tmp/jogadas.txt | head -2 | tail -1 | grep X | wc -l`"

   if [ ${conf} -eq 0 ]
   then
      var1="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c1,1`"
      var2="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c2,2`"
      var3="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c3,3`"
      tot="`expr ${var1} + ${var2} + ${var3}`"
         if [ ${tot} -eq 3 ] || [ ${tot} -eq 6 ]
         then
            STATUS="${tot}" ; REF="456"
         fi
   fi
   unset var1 var2 var3 tot conf
}

#------------------------------------------------------------------------------

seq_789()
{
   conf="`cat /tmp/jogadas.txt | tail -1 | grep X | wc -l`"

   if [ ${conf} -eq 0 ]
   then
      var1="`cat /tmp/jogadas.txt | tail -1 | cut -c1,1`"
      var2="`cat /tmp/jogadas.txt | tail -1 | cut -c2,2`"
      var3="`cat /tmp/jogadas.txt | tail -1 | cut -c3,3`"
      tot="`expr ${var1} + ${var2} + ${var3}`"
         if [ ${tot} -eq 3 ] || [ ${tot} -eq 6 ]
         then
            STATUS="${tot}" ; REF="789"
         fi
   fi
   unset var1 var2 var3 tot conf
}

#------------------------------------------------------------------------------

seq_147()
{
   CONF1="`cat /tmp/jogadas.txt | head -1 | cut -c1,1`"
   CONF2="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c1,1`"
   CONF3="`cat /tmp/jogadas.txt | tail -1 | cut -c1,1`"
   expr ${CONF1} + ${CONF2} + ${CONF3} 1>/dev/null 2>&1
   ERRO="$?"

   if [ ${ERRO} -gt 0 ]
   then
      conf=1
   else
      conf=0
   fi

   if [ ${conf} -eq 0 ]
   then
      var1="`cat /tmp/jogadas.txt | head -1 | cut -c1,1`"
      var2="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c1,1`"
      var3="`cat /tmp/jogadas.txt | tail -1 | cut -c1,1`"
      tot="`expr ${var1} + ${var2} + ${var3}`"
         if [ ${tot} -eq 3 ] || [ ${tot} -eq 6 ]
         then
            STATUS="${tot}" ; REF="147"
         fi
   fi
   unset var1 var2 var3 tot CONF1 CONF2 CONF3 conf
}

#------------------------------------------------------------------------------

seq_258()
{
   CONF1="`cat /tmp/jogadas.txt | head -1 | cut -c2,2`"
   CONF2="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c2,2`"
   CONF3="`cat /tmp/jogadas.txt | tail -1 | cut -c2,2`"
   expr ${CONF1} + ${CONF2} + ${CONF3} 1>/dev/null 2>&1
   ERRO="$?"

   if [ ${ERRO} -gt 0 ]
   then
      conf=1
   else
      conf=0
   fi

   if [ ${conf} -eq 0 ]
   then
      var1="`cat /tmp/jogadas.txt | head -1 | cut -c2,2`"
      var2="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c2,2`"
      var3="`cat /tmp/jogadas.txt | tail -1 | cut -c2,2`"
      tot="`expr ${var1} + ${var2} + ${var3}`"
         if [ ${tot} -eq 3 ] || [ ${tot} -eq 6 ]
         then
            STATUS="${tot}" ; REF="258"
         fi
   fi
   unset var1 var2 var3 tot CONF1 CONF2 CONF3 conf
}

#------------------------------------------------------------------------------

seq_369()
{
   CONF1="`cat /tmp/jogadas.txt | head -1 | cut -c3,3`"
   CONF2="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c3,3`"
   CONF3="`cat /tmp/jogadas.txt | tail -1 | cut -c3,3`"
   expr ${CONF1} + ${CONF2} + ${CONF3} 1>/dev/null 2>&1
   ERRO="$?"

   if [ ${ERRO} -gt 0 ]
   then
      conf=1
   else
      conf=0
   fi

   if [ ${conf} -eq 0 ]
   then
      var1="`cat /tmp/jogadas.txt | head -1 | cut -c3,3`"
      var2="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c3,3`"
      var3="`cat /tmp/jogadas.txt | tail -1 | cut -c3,3`"
      tot="`expr ${var1} + ${var2} + ${var3}`"
         if [ ${tot} -eq 3 ] || [ ${tot} -eq 6 ]
         then
            STATUS="${tot}" ; REF="369"
         fi
   fi
   unset var1 var2 var3 tot CONF1 CONF2 CONF3 conf
}

#------------------------------------------------------------------------------

seq_357()
{
   CONF1="`cat /tmp/jogadas.txt | head -1 | cut -c3,3`"
   CONF2="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c2,2`"
   CONF3="`cat /tmp/jogadas.txt | tail -1 | cut -c1,1`"
   expr ${CONF1} + ${CONF2} + ${CONF3} 1>/dev/null 2>&1
   ERRO="$?"

   if [ ${ERRO} -gt 0 ]
   then
      conf=1
   else
      conf=0
   fi

   if [ ${conf} -eq 0 ]
   then
      var1="`cat /tmp/jogadas.txt | head -1 | cut -c3,3`"
      var2="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c2,2`"
      var3="`cat /tmp/jogadas.txt | tail -1 | cut -c1,1`"
      tot="`expr ${var1} + ${var2} + ${var3}`"
         if [ ${tot} -eq 3 ] || [ ${tot} -eq 6 ]
         then
            STATUS="${tot}" ; REF="357"
         fi
   fi
   unset var1 var2 var3 tot CONF1 CONF2 CONF3 conf
}

#------------------------------------------------------------------------------

seq_159()
{
   CONF1="`cat /tmp/jogadas.txt | head -1 | cut -c1,1`"
   CONF2="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c2,2`"
   CONF3="`cat /tmp/jogadas.txt | tail -1 | cut -c3,3`"
   expr ${CONF1} + ${CONF2} + ${CONF3} 1>/dev/null 2>&1
   ERRO="$?"

   if [ ${ERRO} -gt 0 ]
   then
      conf=1
   else
      conf=0
   fi

   if [ ${conf} -eq 0 ]
   then
      var1="`cat /tmp/jogadas.txt | head -1 | cut -c1,1`"
      var2="`cat /tmp/jogadas.txt | head -2 | tail -1 | cut -c2,2`"
      var3="`cat /tmp/jogadas.txt | tail -1 | cut -c3,3`"
      tot="`expr ${var1} + ${var2} + ${var3}`"
         if [ ${tot} -eq 3 ] || [ ${tot} -eq 6 ]
         then
            STATUS="${tot}" ; REF="159"
         fi
   fi
   unset var1 var2 var3 tot CONF1 CONF2 CONF3 conf
}

#------------------------------------------------------------------------------

check_play()
{
   seq_123
   seq_456
   seq_789
   seq_147
   seq_258
   seq_369
   seq_357
   seq_159

   if [ -z $STATUS ]
   then
      echo not_yest > /dev/null
   else
      if [ ${STATUS} -eq 3 ]
      then
         Print_`echo ${REF}`
         tput cup 11 5
         echo "                                                    "
         tput cup 15 5
         echo "                                                    "
         tput cup 11 5
         echo "`tput smso`   Jogador : ${jogador1} Ganhou !!   `tput rmso`"
         rm /tmp/jogadas.txt 2>/dev/null
         tput cup 17 0
         exit
      fi

      if [ ${STATUS} -eq 6 ]
      then
         Print_`echo ${REF}`
         tput cup 11 5
         echo "                                                    "
         tput cup 15 5
         echo "                                                    "
         tput cup 11 5
         echo "`tput smso`   ${jogador2} Ganhou !!   `tput rmso`"
         rm /tmp/jogadas.txt 2>/dev/null
         tput cup 17 0
         exit
      fi
   fi
}

#------------------------------------------------------------------------------

aviso()
{
   tput cup 15 5
   echo -e "$player --> Posicao ja esta ocupada ! - Tecle <RETURN>...\c"
   read stop
   tput cup 15 5
   echo "                                                               "
   play $player
}

#------------------------------------------------------------------------------

rot1()
{
if [ -z $j1 ]
then
   j1=$player ; tput cup 2 5 ; echo "$valor" ; jogar 1
else
   aviso
fi
}

rot2()
{
if [ -z $j2 ]
then
   j2=$player ; tput cup 2 9 ; echo "$valor" ; jogar 2
else
   aviso
fi
}

rot3()
{
if [ -z $j3 ]
then
   j3=$player ; tput cup 2 13 ; echo "$valor" ; jogar 3
else
   aviso
fi
}

rot4()
{
if [ -z $j4 ]
then
   j4=$player ; tput cup 4 5 ; echo "$valor" ; jogar 4
else
   aviso
fi
}

rot5()
{
if [ -z $j5 ]
then
   j5=$player ; tput cup 4 9 ; echo "$valor" ; jogar 5
else
   aviso
fi
}

rot6()
{
if [ -z $j6 ]
then
   j6=$player ; tput cup 4 13 ; echo "$valor" ; jogar 6
else
   aviso
fi
}

rot7()
{
if [ -z $j7 ]
then
   j7=$player ; tput cup 6 5 ; echo "$valor" ; jogar 7
else
   aviso
fi
}

rot8()
{
if [ -z $j8 ]
then
   j8=$player ; tput cup 6 9 ; echo "$valor" ; jogar 8
else
   aviso
fi
}

rot9()
{
if [ -z $j9 ]
then
   j9=$player ; tput cup 6 13 ; echo "$valor" ; jogar 9
else
   aviso
fi
}

#------------------------------------------------------------------------------

tput cup 15 5
echo -e "Nome do Jogador [ 0 ] --> \c"
read jogador1

tput cup 17 5
echo -e "Nome do Jogador [ X ] --> \c"
read jogador2

tput cup 15 5
echo "                                                               "
tput cup 17 5
echo "                                                               "

tput cup 2 30
echo "Jogador [ 0 ] --> $jogador1"

tput cup 6 30
echo "Jogador [ X ] --> $jogador2"

#------------------------------------------------------------------------------

play()
{

tput cup 15 5
echo "                                                               "
tput cup 15 5
echo -e "$player : _\b\c"
read opcao

expr $opcao + 1 2>/dev/null 1>/dev/null
ERRO="$?"

if [ $ERRO -gt 0 ]
then
   tput cup 15 5
   echo -e "$player --> Digite um valor entre 1 e 9 - Tecle <RETURN> ...\c"
   read stop
   tput cup 15 5
   echo "                                                                            "
   play $player
else
   if [ -z $opcao ]
   then
      tput cup 15 5
      echo -e "$player --> Digite um valor entre 1 e 9 - Tecle <RETURN> ...\c"
      read stop
      tput cup 15 5
      echo "                                                               "
      play $player
   else
      if [ $opcao -gt 9 ] || [ $opcao -lt 1 ]
      then
         tput cup 15 5
         echo -e "$player --> Valor validos entre 1 e 9 ! - Tecle <RETURN> ...\c"
         read stop
         tput cup 15 5
         echo "                                                                 "
         play $player
      else
         rot`echo $opcao`
      fi
   fi
fi

}

#------------------------------------------------------------------------------

var=0
player="$jogador2"

while true
do
   var="`expr $var + 1`"

   if [ "$player" = "$jogador1" ]
   then
      valor=X
      vx="2"
      player="$jogador2"
      play $player
   else
      valor=O
      vx="1"
      player="$jogador1"
      play $player
   fi

   if [ $var -eq 9 ]
   then
      tput cup 17 0
      rm /tmp/jogadas.txt 2>/dev/null
      exit
   else
      tput cup 11 5
      echo "Jogada : ${var}"
   fi
done
