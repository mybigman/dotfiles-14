#!/bin/sh

cor0="#fe0000"
cor1="#30ff00"
cor2="#000cff"
cor3="#dd00fe"
cor4="#fcff00"
cor5="#ff5200"
cor6="#00eaff"

while true; do
	for(( r=0; r<=6; r++ ))
	do
		efeito=cor$r
		echo "%{B${!efeito}}"
		sleep .5
	done
done | lemonbar -p -b | sh
