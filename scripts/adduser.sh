#!/bin/bash
# Credit: Franklin Souza
# Telegram: @FranklinTech

# Criar um novo usuário:
cr(){
   # Exibir usuários existentes:
      clear
         echo "Usuário(s) existente(s):"
         echo "_____________________________"
            egrep [1][0-9]{3} /etc/passwd | cut -d: -f1
         echo "_____________________________"

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
      if sudo useradd -m $novo_usuario -p $(openssl passwd -1 $senha1) -s /bin/bash; then
         clear
            echo "[Ok] usuário [$novo_usuario] foi criado"
            echo "-------------------------------------------------------"
      else
         clear
            echo "[Erro] ao criar o usuário [$novo_usuario]"
            echo "-------------------------------------------------------"
      fi
}
cr
