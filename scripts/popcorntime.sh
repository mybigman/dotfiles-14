#!/bin/bash

#+------------------------------------------+
## Título: popcorn_time.sh                  |
## Autor: Lucas de M. corrêa                |
## UF: MT                                   |
## Data: 09/09/2017                         |
## Contato: correa2000.gta@gmail.com        |
## Credit: Franklin Souza                   |
## Telgram: @FranklinTech                   |                    
#+------------------------------------------+
#+-------------------------------------------------------+
## Basta que tengas confianza en vos mismo...            |
## Para que los demás comiencem a confiar en usted.      |
##                                                       |
##                                 Johann W. von Goethe  |
#+-------------------------------------------------------+


clear
echo -e "\033[1;34m"
echo "Olá $USER!"
sleep 2s

lmc() {
echo -e "\033[1;34m"
clear
echo "1. Instalar PopcornTime"
echo "2. Desinstalar Popcorntime"
echo "3. Créditos"
echo "4. Sair"
echo
echo -n "_>"
read resposta
case $resposta in

  1|01|"")
clear
arq=$(uname -m)

if [ "$arq" == "x86_64" ] || [ "$arq" == "aarch64" ] || [ "$arq" == "x64" ]
then ###Caso sua arquitetura seja 64 bits, esta função será executada...

echo -e "\033[1;32m" "Baixando..."

sleep 2s

echo -e "\033[3;37m"

wget https://get.popcorntime.sh/build/Popcorn-Time-0.3.10-Linux-64.tar.xz -O popcorntime.tar.xz


elif [ "$arq" == "i686" ] || [ "$arq" == "i386" ] || [ "$arq" == "x86" ]
then ####Caso sua arquitetura seja 32 bits, esta função será executada...

echo -e "\033[1;32m" "Baixando..."

sleep 2s

echo -e"\033[3;37m"

wget https://get.popcorntime.sh/build/Popcorn-Time-0.3.10-Linux-32.tar.xz -O popcorntime.tar.xz
fi

echo
echo -e "\033[1;32m" "Instalando..."
  sleep 2s
   echo -e "\033[3;37m"

  sudo mkdir /opt/popcorntime
  sudo tar Jxf popcorntime.tar.xz -C /opt/popcorntime/

echo
echo -e "\033[1;32m" "Finalizando instalação..."
  sleep 2s
   echo -e "\033[3;37m"

  sudo ln -sf /opt/popcorntime/Popcorn-Time /usr/bin/Popcorn-Time
  echo -e '[Desktop Entry]\n Version=1.0\n Name=popcorntime\n Exec=/opt/popcorntime/Popcorn-Time\n Icon=/opt/popcorntime/src/app/images/icon.png\n Type=Application\n Categories=Application' | sudo tee /usr/share/applications/popcorntime.desktop
  sudo rm /home/$USER/popcorntime.tar.xz

echo
echo -e "\033[1;32m" "Concluído"
  sleep 2s
lmc
;;


  2|02|"")
     clear
echo -e "\033[1;32m Desinstalando..."

sleep 2s

echo -e "\033[3;37m"

sudo rm -Rf /opt/popcorntime
sudo rm -Rf /usr/bin/Popcorn-Time
sudo rm -Rf /usr/share/applications/popcorntime.desktop

echo -e "\033[1;32m Finalizado..."
sleep 2s
lmc
;;


  3|03|"")
     clear
echo -e "\033[1;12m"
echo " ____   ___  ____   ____ ___  ____  _   _   _____ ___ __  __ _____             "
echo "|  _ \ / _ \|  _ \ / ___/ _ \|  _ \| \ | | |_   _|_ _|  \/  | ____|            "
echo "| |_) | | | | |_) | |  | | | | |_) |  \| |   | |  | || |\/| |  _|              "
echo "|  __/| |_| |  __/| |__| |_| |  _ <| |\  |   | |  | || |  | | |___   _   _   _ "
echo "|_|    \___/|_|    \____\___/|_| \_\_| \_|   |_| |___|_|  |_|_____| (_) (_) (_)"

echo
sleep 2s
echo -e "\033[3;31m"
echo "                                    .cx0NNNNNNNNKkd;.                    "
echo "                                .:xOXNXXXXXXXXXXXXNNXOo;.                "
echo "                             :0NXXXXXXXXXXXXXXXXXXXXXXNXd,               "
echo "                            oXNXXXXXXXXXXXXXXXXXXXXXXXXXXXNk.            "
echo "                          ;ONXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXKo.          "
echo "                         oNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX0.         "
echo "            ......      cNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXK'        "
sleep 1s
echo "        .:dOXNNNNN0x:. 'KXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXO        "
echo "       ;KNXXXXXXXXXXNXo0XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX:       "
echo "      oXXXXXXXXXXXXXXXNXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXd       "
echo "     ,XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx       "
echo "     :XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXx       "
echo "     .0XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXl       "
sleep 1s
echo "      .OXXXXXXXXXXKl,..':kXXXXXXXXXXXXXXXXXXXXXXOc'..'l0XXXXXXXXX'       "
echo "       ,KXXXXXXXXK,  .kOc.oXXXXXXXXXXXXXXXXXXXXk.  ;OO,.kXXXXXXXo        "
echo "     .xXXXXXXXXXXx.  .ld; ,KXXXXXXXXXXXXXXXXXXXc   'do. cXXXXXXXk,       "
echo "     0XXXXXXXXXXXXc.     .kXXXXXXXXXXXXXXXXXXXX0'      ,OXXXXXXXXNO.     "
echo "    .XXXXXXXXXXXXXXkoccldKXXXXdlclccccccclll0XXXKxlcclkXXXXXXXXXXXXx     "
sleep 1s
echo "    .KXXXXXXXXXXXXXXXXXXXXXXXXl............;KXXXXXXXXXXXXXXXXXXXXXX0.    "
echo "     cXXXXXXXXXXXXXXXXXXXXXXXXKc..........c0XXXXXXXXXXXXXXXXXXXXXXXd     "
echo "      'dKXXXXXXXXXXXXXXXXXXXXXXX0dc:;;;coOXXXXXXXXXXXXXXXXXXXXXXXKx.     "
echo "      .'ONNNNNXKK0kkkOKXXXXKKKXXXXXXXXXXXXXXKKKXXXX0OkkkOKKXXNNNN0,.     "
echo "     ..kNNNNNNNKl;;;;;:d0XNNNNNXKK0kxxk0KKXNNNNNX0d:;;;;;l0NNNNNNNX;.    "
echo "      .xNNNNNNN0;;;;;;;;kNNNNNNNNx:;;;;:dXNNNNNNNk;;;;;;;;ONNNNNNN0'     "
sleep 1s
echo "      .lNNNNNNNK:;;;;;;;dNNNNNNNNc;;;;;;;0NNNNNNNd;;;;;;;:KNNNNNNNo.     "
echo "      .,XNNNNNNNl;;;;;;;oNNNNNNNNc;;;;;;;0NNNNNNNl;;;;;;;lNNNNNNNX:.     "
echo "       .ONNNNNNNd;;;;;;;lNNNNNNNNl;;;;;;;0NNNNNNXc;;;;;;;dNNNNNNNO..     "
echo "       .dNNNNNNNx;;;;;;;cXNNNNNNNl;;;;;;;0NNNNNNK:;;;;;;;kNNNNNNNd.      "
echo "       .lNNNNNNN0;;;;;;;:KNNNNNNNl;;;;;;;KNNNNNN0;;;;;;;;0NNNNNNNc.      "
echo "        ,KNNNNNNXc;;;;;;;0NNNNNNNo;;;;;;:KNNNNNNO;;;;;;;cNNNNNNNX,.      "
sleep 1s
echo "        .xNNNNNNNo;;;;;;;ONNNNNNNo;;;;;;:KNNNNNNk;;;;;;;oNNNNNNNk.       "
echo "        .cNNNNNNNk;;;;;;;xNNNNNNNo;;;;;;cXNNNNNNx;;;;;;;xNNNNNNNo.       "
echo "        .'0NNNNNNO;;;;;;;dNNNNNNNo;;;;;;cXNNNNNNd;;;;;;;ONNNNNNN:.       "
echo "         .xNNNNNNXc;;;;;;oNNNNNNNd;;;;;;lNNNNNNNl;;;;;;:KNNNNNN0'        "
echo "         .lNNNNNNNo;;;;;;lNNNNNNNd;;;;;;lNNNNNNNc;;;;;;oNNNNNNNd.        "
echo "        .;XNNNNNNx;;;;;;cXNNNNNNd;;;;;;oNNNNNNX:;;;;;;xNNNNNNK;.         "
echo "          .,oxxxxxl'''''',oxxxxxxc'''''':xxxxxxd,''''',lxxxxxo;.         "
echo "             ................................................            "
sleep 1s
echo -e "\033[0;36m"
echo "============== Assista filmes e programas de TV instantaneamente =============="
sleep 1s
echo "=========================== https://popcorntime.sh/ ==========================="
sleep 1s
echo "===================== https://github.com/popcorn-official ====================="
sleep 1s
echo
echo "Baixar material protegido por direitos autorais pode ser ilegal em seu país. "
echo "Use por sua própria conta e risco."
echo
echo "==============================================================================="
sleep 1s
echo
echo "Popcorn Time é um cliente BitTorrent em multiplataforma livre e de código"
echo "aberto — isso inclui um tocador de mídia. O programa destina-se como uma"
echo "alternativa gratuita para serviços de vídeo sob demanda em assinatura, como o"
echo "Netflix. Após a criação, Popcorn Time rapidamente recebeu inesperadamente a"
echo "atenção"
echo "da mídia positivamente, com alguns comparando-a com ao Netflix, devido à sua"
echo "facilidade de uso. O programa foi abruptamente descontinuado por seus"
echo "criadores"
echo "originais em 14 de março de 2014, mas posteriormente foi bifurcado e foi"
echo "retomado por"
echo "outros desenvolvedores."
echo "A interface do Popcorn Time apresenta miniaturas e os títulos de maneira muito"
echo "similar ao Netflix. Elas podem ser pesquisados&#8203;&#8203;, ou visualizados por gêneros e"
echo "categorias. Quando um usuário seleciona um dos títulos, o filme é transmitido"
echo "através do protocolo BitTorrent. Como outros clientes BitTorrent, o Popcorn"
echo "Time envia o torrent do filme ao usuário que deseja acessá-lo, criando assim"
echo "uma nuvem BitTorrent"
echo "--------------------------------------------------------------FONTE: Wikipedia"
sleep 1s
echo
echo "Autor: Lucas de M. Corrêa"
echo "Nickname (VOL): Correalinux"
echo "https://www.vivaolinux.com.br/~correalinux"
echo "Contato: correa2000.gta@gmail.com"
echo
echo "Sinta-se à vontade para editar este script como quiser..."
echo "Seja para corrigir bugs/erros, atualizá-lo, ou simplesmente adequá-lo as suas necessidades."
sleep 2s
pop() {
echo -e "\033[1;34m"
echo "1. Voltar"
echo "2. Sair"
echo -n "_>"
read resposta
case $resposta in
  1) voltar ;;
  2) sair ;;
  *) nn ;;
esac
}
voltar() {
  lmc
}
sair() {
  clear
   exit
}
nn() {
  echo -e -n "\033[1;31m Opção Inválida"
   echo
    sleep 1s
     pop
}
pop
;;

  4|04|"")
     clear
     exit
;;


  *|"")
     echo -e -n "\033[1;31m Opção Inválida"
     sleep 1s
lmc
;;
esac

}
lmc
