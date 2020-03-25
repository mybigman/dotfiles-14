#!/usr/bin/env sh
#
# github - Script para enviar automaticamente mudanças ao Github
# LEMBRE-SE DE CONFIGURAR CORRETAMENTE SEU GIT SEM SENHA!!!
#
# Desenvolvido por Lucas Saliés Brum <lucas@archlinux.com.br>
#
# Sugestão de crontab:
# */15 * * * * sh -c "~/.local/bin/github" > /dev/null 2>&1
#
# Criado em: 20/12/2017 19:27:31
# Última Atualização: 06/05/2019 12:51:21

nome="GitHub.sh"
dir="${HOME}/.github"
repos=('dotfiles')
remoto="Franklin@Souza"
dotfiles=1
icone="${HOME}/.local/share/icons/elementary/github.svg"
som="complete"

detectax() {
	if xset q &>/dev/null; then
		# ls /usr/share/sounds/freedesktop/stereo/
		#dbus-launch canberra-gtk-play -i $som 2>&1
		export DISPLAY=:0 ; canberra-gtk-play -i $som 2>&1
		#DISPLAY=:0.0 canberra-gtk-play -i $som
		dbus-launch notify-send -i $icone "$1" "$2"
	else
		echo "${1}: $2"
	fi
}


atualiza() {
	if [ -d $1 ]; then
		if [ ! -f $1/.noup ]; then
			cd $1
			status=$(git add . -n)
			if [ ! -z "$status" ]; then
				c=$(echo $(git add . -n | tr '\r\n' ' '))
				m="Autocommit por ${nome}: alterações: $c"
				git add .
				git commit -m "$m"
				git push
				if [ "$?" == 0 ]; then
					detectax $nome "Repo <b>$(basename $1)</b> atualizado."
					[ -f /tmp/git-cron.error ] && rm /tmp/git-cron.error
				else
					if [ ! -f /tmp/git-cron.error ]; then
						icone="${HOME}/.local/share/icons/elementary/network-error.png"
						som="dialog-warning"
						detectax $nome "Erro ao atualizar <b>$(basename $1)</b>."
						touch /tmp/git-cron.error
					fi
				fi
			fi
		fi
	fi
}

if [ ! $1 ] || [ "$1" == "-a" ]; then
	for r in "${repos[@]}";	do
		caminho="${dir}/${r}"
		atualiza "$caminho"
	done

	[ $dotfiles == 1 ] && atualiza "${HOME}/.dotfiles"
	[ "$1" == "-a" ] && ssh $remoto "/usr/local/scripts/github"
elif [ ! $2 ]; then
	atualiza "$1"
else
	for r in "$@";	do
		caminho="${dir}/${r}"
		atualiza "$caminho"
	done
fi

