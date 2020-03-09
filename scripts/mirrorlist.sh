#!/bin/bash
# Credit: Franklin Souza
# Telegram: @FranklinTech
#
# Script para pegar os melhores mirrorlist no archlinux
#
# Mirrors Brasileiros
#url="https://www.archlinux.org/mirrorlist/?country=BR&use_mirror_status=on"

# Lithuania
#url="https://www.archlinux.org/mirrorlist/?country=LT&protocol=http&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on"

# Germany
#url="https://www.archlinux.org/mirrorlist/?country=DE&protocol=http&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on"

# Mirrors Canadenses
#url="https://www.archlinux.org/mirrorlist/?country=CA&use_mirror_status=on"

# Croatia
#url="https://www.archlinux.org/mirrorlist/?country=HR&protocol=http&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on"

# Todos os Mirrors
url="https://www.archlinux.org/mirrorlist/?country=all&protocol=http&protocol=https&ip_version=4&ip_version=6&use_mirror_status=on"

  tmpfile=$(mktemp --suffix=-mirrorlist)

  # Get latest mirror list and save to tmpfile
  curl -so ${tmpfile} ${url}
  sed -i 's/^#Server/Server/g' ${tmpfile}

  # Faça backup e substitua o arquivo atual da lista de espelhos (se o novo arquivo for diferente de zero)
  if [[ -s ${tmpfile} ]]; then
   { echo " Backup do Mirrorlist original..."
     mv -i /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bkp; } &&
   { echo "Gerando um novo mirrorlist"
     mv -i ${tmpfile} /etc/pacman.d/mirrorlist; }
  else
    echo "Erro ao atualizar a lista de mirrorlist..."
  fi

# Permissão no mirrorlist
#chmod -r /etc/pacman.d/mirrorlist
chmod 0644 /etc/pacman.d/mirrorlist
