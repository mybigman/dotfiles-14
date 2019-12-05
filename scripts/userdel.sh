#!/bin/bash
# Credit: Franklin Souza
# Telegram: @FranklinTech
#
# Deletar usuário:
del(){
   # Exibir usuários existentes:
                clear
                        echo "Usuário(s) existente(s):"
                        echo "_____________________________"
                                egrep [1][0-9]{3} /etc/passwd | cut -d: -f1
                        echo "_____________________________"

        # Nome:
      echo -en "\nDelete um usuário: "
         read E

# Deletendo usuário:
        dele(){
                if sudo userdel -r $E; then
                        clear
                                echo "[Ok] usuário [$E] foi deletado"
                                echo "--------------------------------------------------"
                else
                        clear
                                echo "[Erro] ao deletar usuário [$E]"
                                echo "--------------------------------------------------"
                fi
        }

   # Pergunta de segurança:
      opc(){
            echo -en "\nVocê tem certeza que deseja deletar este usuário [$E] [s/n]: "
            read F
               case $F in
                  s| S) dele;;
                  n| N) del;;
                  *) echo -e " _______________\n|Opção incorreta|\n|_______________|"; sleep 2s; clear; opc;;
               esac
      }
      opc

}
del
