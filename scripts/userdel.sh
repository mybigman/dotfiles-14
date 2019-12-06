#!/bin/bash
# Credit: Franklin Souza
# Telegram: @FranklinTech
#
# Um Script para deletar usuários.
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
         read U

# Deletendo usuário:
        dele(){
                if sudo userdel -r $U; then
                        clear
                                echo "Ok, usuário [$U] foi deletado com sucesso."
                                echo "--------------------------------------------------"
                else
                        clear
                                echo "Erro ao deletar usuário [$U], por favor tente novamente."
                                echo "--------------------------------------------------"
                fi
        }

   # Pergunta de segurança:
      opc(){
            echo -en "\nVocê tem certeza que deseja deletar este usuário [$U]? [s/n]: "
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
