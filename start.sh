#!/bin/bash

#Script de personalização inicial da minha distro Debian
#Executar como sudo

#Seleciona o mirror mais rápido para o apt
sudo apt install -y netselect-apt
sudo netselect-apt -c brazil -t 6 -a amd64 -n stable
mv sources.list /etc/apt/sources.list

#atualiza o apt e instala pacotes necessários
apt update -y
apt install -y wget git gcc python3 screenfetch software-properties-common

###Criar if para escolha se já possui interface grafica instalada
#apt install -y xorg xfce4 xfce4-goodies lightdm

#instala pacote mugshot faltante
cd /tmp
wget http://ftp.br.debian.org/debian/pool/main/m/mugshot/mugshot_0.4.2-1_all.deb
dpkg -i mugshot_0.4.2-1_all.deb

#Baixa e instala temas
mkdir -p ~/.themes
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
wget https://github.com/rhendges/linux-scripts/raw/master/.gtkrc-2.0
cp .gtkrc-2.0 ~/
cp .gtkrc-2.0 /etc/skel

#Define os temas
cp -r panel/ ~/.config/xfce4
cp -r terminal/ ~/.config/xfce4
cp -r xfconf/ ~/.config/xfce4

#copia templates do usuário para /etc/skel
mkdir /etc/skel/.config
mkdir /etc/skel/.config/xfce4
cp -r panel/ /etc/skel/.config/xfce4
cp -r terminal/ /etc/skel/.config/xfce4
cp -r xfconf/ /etc/skel/.config/xfce4
