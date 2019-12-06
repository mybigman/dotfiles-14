#!/bin/bash
# Credit: Franklin Souza
# Telegram: @FranklinTech
#
#
# Um script para adicionar novos usuários.
#
# Criar um novo usuário:
cr(){
   # Exibir usuários existentes:
      clear
         echo "Usuário(s) existente(s):"
         echo "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁"
         echo ""
            egrep [1][0-9]{3} /etc/passwd | cut -d: -f1
         echo ""
         echo "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁"

   # Nome:
      echo -e "\n(Dica: Não coloque espaço e alguns caracteres especiais)\n"
         read -p "Crie um usuário: " novo_usuario

   # Senha:
      pass(){
         read -p "Digite a senha: " -s senha1
            echo -en "\nRedigite a senha: "
               read -s senha2
      }
      pass

   # Verifincando senha:
      while [ $senha1 != $senha2 ]; do
         clear
            echo " ______________________________"
            echo "|A senha não é igual; tente novamente|"
             echo -e "|______________________________|\n"
               pass
      done

   # Criando o usuário:
      if sudo useradd -m -g users -G wheel,audio,video,daemon,dbus,disk,rfkill,games,lp,optical,power,scanner,storage,input -p $(openssl passwd -1 $senha1) -s /bin/bash $novo_usuario; then
         clear
            echo "Meus parabéns [$novo_usuario] foi criado"
            echo "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁"
      else
         clear
            echo "Erro ao criar o usuário [$novo_usuario], por favor tente novamente"
            echo "▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁▁"
      fi
}
cr
