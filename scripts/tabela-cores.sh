#!/bin/bash

cores()
{

linha="==========================================="

clear
echo -e "\e[34m${linha} \e[0m"
#Tabela de cores
echo -e "\e[37;100m|            Tabelas de cores             |\e[0m"

echo -e "\e[34m${linha} \e[0m"
#Menu 1
echo -e "\e[104m|     Cor       |     Letra   |   Fundo   |\e[0m"

echo -e "\e[34m${linha} \e[0m"
#Preto, Vermelho, Amarelo, Azul, Rosa, Branco
echo -e "\e[37;46m|      Preto           30           40    |\e[0m"
echo "|     Vermelho         31           41    |"
echo -e "\e[37;46m|      Verde           32           42    |\e[0m"
echo "|     Amarelo          33           43    |"
echo -e "\e[37;46m|      Azul            34           44    |\e[0m"
echo "|      Rosa            35           45    |"
echo -e "\e[37;46m|     Ciano            36           46    |\e[0m"
echo "|     Branco           37           47    |"

echo -e "\e[34m${linha} \e[0m"
#Menu 2
echo -e "\e[104m|  Cor Brilhante  |  Letra   |    Fundo   |\e[0m"

echo -e "\e[34m${linha} \e[0m"
#Preto, Vermelho, Verde, Amarelo, Azul
echo -e "\e[37;46m|      Preto          90           100    |\e[0m"
echo "|     Vermelho        91           101    |"
echo -e "\e[37;46m|      Verde          92           102    |\e[0m"
echo "|     Amarelo         93           103    |"
echo -e "\e[37;46m|      Azul           94           104    |\e[0m"

echo -e "\e[34m${linha} \e[0m"
echo ""
#Fim do menu

#Pergunta as variaveis para colorir o texto
echo -n "Cor da letra: "
read fonte
echo -n "Cor de fundo: "
read fundo 
echo -n "Escreva um texto: "
read texto
echo -n "Negrito? (s/n) "
read modoN
echo -n "Sublinhado? (s/n) "
read modoS

#Verifica se a variavel fundo é nula...
if [ -e $fundo ]
then

#Sem fundo com negrito sem sublinado
case $modoN in
s|S|Sim|sim|SIM)
negrito="1"
echo ""
echo -e "\e[${negrito};${fonte}m ${texto} \e[0m"
echo -n "O seu código (sem fundo e negrito): "
echo "echo -e \"\e[$negrito;$fonte"m" $texto [0m\""
esac

#Sem fundo com sublinhado sem negrito
case $modoS in
s|S|Sim|sim|SIM)
sublinhado="4"
echo ""
echo -e "\e[${sublinhado};${fonte}m ${texto} \e[0m"
echo -n "O seu código (sem fundo e sublinhado): "
echo "echo -e \"\e[$sublinhado;$fonte"m" $texto [0m\""
esac

#Sem fundo com negrito e sublinhado
if [ $modoN = $modoS ]
then
echo ""
echo -e "\e[${negrito};${sublinhado};${fonte}m ${texto} \e[0m"
echo -n "O seu código (sem fundo, com sublinhado e negrito): "
echo "echo -e \"\e[$negrito;$sublinhado;$fonte"m" $texto [0m\""
fi

echo -n "Fazer novamente? (s/n) "
read resposta

if [ $resposta = "s" ]
then
cores
else
exit
fi


#Se for com fundo...
else


#Com fundo com negrito sem sublinado
case $modoN in
s|S|Sim|sim|SIM)
negrito="1"
echo ""
echo -e "\e[${negrito};${fundo};${fonte}m ${texto} \e[0m"
echo -n "O seu código (com fundo e negrito): "
echo "echo -e \"\e[$negrito;$fundo;$fonte"m" $texto [0m\""
esac

#Com fundo com sublinhado sem negrito
case $modoS in
s|S|Sim|sim|SIM)
sublinhado="4"
echo ""
echo -e "\e[${sublinhado};${fundo};${fonte}m ${texto} \e[0m"
echo -n "O seu código (com fundo e sublinhado): "
echo "echo -e \"\e[$sublinhado;$fundo;$fonte"m" $texto [0m\""
esac

#Com fundo com negrito e sublinhado
if [ $modoN = $modoS ]
then
echo ""
echo -e "\e[${negrito};${sublinhado};${fundo};${fonte}m ${texto} \e[0m"
echo -n "O seu código (com fundo, sublinhado e negrito): "
echo "echo -e \"\e[$negrito;$sublinhado;$fundo;$fonte"m" $texto [0m\""
fi

echo -n "Fazer novamente? (s/n) "
read resposta

if [ $resposta = "s" ]
then
cores
else
exit
fi


fi
}

#Mostra o menu cores
cores
