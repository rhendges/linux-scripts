#!/bin/bash

#Script de personalização inicial da minha distro Debian
#Executar como sudo

apt update -y
apt install -y wget git gcc python3 screenfetch software-properties-common

###Criar if para escolha se já possui interface grafica instalada
#apt install -y xorg xfce4 xfce4-goodies lightdm

mkdir -p ~/.themes
cd /tmp
wget https://github.com/rhendges/linux-scripts/raw/master/flat-remix-blue.xz
tar -xvf flat-remix-blue.xz
cp -r Flat-Remix-Blue/ ~/.icons/
cp -r Flat-Remix-Blue/ /usr/share/icons/
rm -rf Flat-Remix-Blue/
rm flat-remix-blue.xz
wget https://github.com/rhendges/linux-scripts/raw/master/NumixHolo.zip
unzip NumixHolo.zip
cp -r NumixHolo/ ~/.themes/
cp -r NumixHolo/ /usr/share/themes/
rm -rf NumixHolo/
rm NumixHolo.zip
echo "screenfetch" >> ~/.bashrc
echo "screenfetch" >> /etc/skel/.bashrc
wget https://github.com/rhendges/linux-scripts/raw/master/xfce4.zip
unzip xfce4.zip
rm xfce4.zip
cp -r panel/ ~/.config/xfce4
cp -r terminal/ ~/.config/xfce4
cp -r xfconf/ ~/.config/xfce4

#copia templates do usuário para /etc/skel
mkdir /etc/skel/.config
mkdir /etc/skel/.config/xfce4
cp -r panel/ /etc/skel/.config/xfce4
cp -r terminal/ /etc/skel/.config/xfce4
cp -r xfconf/ /etc/skel/.config/xfce4
