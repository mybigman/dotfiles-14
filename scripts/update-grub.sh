#!/bin/bash
sudo mkinitcpio -P && sudo grub-mkconfig -o /boot/grub/grub.cfg
sleep 2 && reboot

