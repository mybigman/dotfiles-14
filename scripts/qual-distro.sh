#!/bin/sh
# Credit: Franklin Souza
# Telegram: @FranklinTech

# NOME: Qualdistro?

# AUTOR: Jefferson Rocha

# EMAIL: lrcjefferson@gmail.com

# HOMEPAGE do AUTOR: http://slackjeff.emmilinux.com.br

# LICENÇA: "GPL" https://www.gnu.org/licenses/gpl.txt

# VERSÃO: 0.1

# DEPENDENCIA:

# DESCRIÇÃO: Programa para verificar qual a distribuição
# que mais se encaixa para o usuário!
# São feitas algumas perguntas e no final se o número for,
# menor que X ele fica com um determinado grupo.
# Se for maior que Y ele fica com outro grupo.
# Programa é dividido em dois grupos inicialmente.

# OBSERVAÇÕES: As resposta (read) das perguntas começam neste esquema:
# Tela de boas vindas fica com a var "pre" seguindo "pre1" etc.../
# Na parte do questionario fica como var "rep1" "rep2" etc...

# MODO DE USO: Dê a sua devida permissão: (chmod +x qualdistro?)e,
# chame ./qualdistro? .
# Recomendavel usar o programa em fullscreen para, melhor experiencia.
#----------------------FIM-DO-CABEÇALHO-----------------------------------|


# VÁRIAVEIS GRUPO 1
ubuntu="Ubuntu"
linux_mint="Mint"
elementary="Elementary"
fedora="Fedora"
manjaro="Manjaro"
arch_Linux="Arch Linux"
opensuse="openSUSE"

# VÁRIAVEIS GRUPO 2
slack="Slackware"
deb="Debian"



####### Telas de boas vindas, Explicação e questionario de perguntas sobre o usuario
      echo -e "Antes de começar o nosso questionario, quero te conhecer um pouco... pode ser?\nDeseja prosseguir [s/n]??"
      read pre
   if [ "$pre" != "s" ]; then
      echo "Que pena, saindo..." ; sleep 1
   exit
fi
      clear
      echo "Quantos anos você utiliza distribuições GNU/Linux em geral?"
      read pre1

      echo
      echo "Você já programou em shell? se não... deseja aprender? [sim/nao]"
      read pre2

   if [ "$pre2" != "sim" ]; then
      echo -e "Hm.... $pre1 é isso mesmo? ok... chega de falar\nOu escrever haha, vamos começar :)"; sleep 4
else
      echo "entre no meu site que disponibilizo vários pdfs para leitura"; sleep 2
      echo
      echo "http://slackjeff.emmilinux.com.br"; sleep 4
fi


######### Questionario para o usuário.
      clear # Limpeza básica
      echo -e "Você é uma pessoa que gosta de novidades e deseja ter tudo que é mais de novo em primeira mão?\n [1 para sim / 2 para não]"
      read rep1

      echo
      echo -e "Você prefere estabilidade ao invés de recursos novos?\n[1 para sim / 2 para não]"
      read rep2

      echo
      echo -e "Você gosta da filosofia KISS (keep it simple stupid) ou acha algo ultrapassado?\n [1 para sim / 2 para não]"
      read rep3

      echo
      echo -e "Você gosta de jogar jogos?\n [1 para sim / 2 para não]" #Só se for até derreter o processador haha
      read rep4

      echo
      echo -e "$USER, Você é um usuario que gosta de fuçar e aprender novas coisas ou somente\nGosta de usar o computador para fins especificos?\n[1 para fuçador / 2 para usuário nutella]"
      read rep5

######## SOMA para jogar na condição de resposta
soma=$(($rep1 + $rep2 + $rep3 + $rep4 + $rep5))


########### Condição com duas tomadas.

   if [ "$soma" -lt "7" ]; then
      echo -e "$USER, Definimos que você se encaixa em uma destas opções de Distribuições:\n$ubuntu, $linux_mint, $elementary, $fedora, $manjaro, $arch, $opensuse."
else
      echo -e "$USER, definimos que você curti ESTABILIDADE\nPor isso estas opções de distribuições são as que mais se encaixam para você:\n$slack, $deb."
fi




############ Segunda parte, informações sobre o hardware do usuário
   echo
   echo -e "Ótimo, agora vamos para a segunda parte para saber um pouco melhor da sua máquina\nPara definir qual melhor ambiente gráfico" ;sleep 3

   echo
   echo "Seu computador tem 1gb, 2gb, 4gb ou 8gb mais de memoria RAM [1/2/4/8]?"
   read rep6

   echo
   echo "Quantos cores tem seu computador? 1 Core, 2 Cores, 4 Cores, 8 Cores+ (1/2/4/8)"
   read rep7

   if [ "$rep6" -lt "5" -a "$rep7" -lt "3" ]; then
      echo  -e "$USER, os melhores ambientes para um computador mais modesto são: LXDE, XFCE, MATE\nSe gosta de algo minimalista use os BOX... Fluxbox, Openbox\nPorem a familia BOX não são para iniciantes por ter uma dificuldade Maior de configuração."
else
      echo -e "$USER, seu computador é exelente, use estes ambientes com tranquilidade:\nCINNAMON, KDE, UNITY, GNOME, DEEPIN DESKTOP, PANTHEON...\n$USER, você está muito bem servido! :)"
fi
