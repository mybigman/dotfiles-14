#!/bin/sh

while true; do
	echo -e "\033[01;32m$(cat /dev/urandom | tr -cd '0-1' | head -c10000)"
done
