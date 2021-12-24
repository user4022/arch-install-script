#!/bin/bash

USERNAME=$1
AUTOLOGIN=$2

arch-chroot /mnt pacman -S --noconfirm lightdm lightdm-gtk-greeter
arch-chroot /mnt systemctl enable lightdm.service 

if [ $2 = true ]; then

	arch-chroot /mnt groupadd autologin
	arch-chroot /mnt usermod -a -G autologin $USERNAME
	sed -i "s/#autologin-user=/autologin-user=$USERNAME/" /mnt/etc/lightdm/lightdm.conf
fi




