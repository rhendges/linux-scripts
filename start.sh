#!/bin/bash
#Script de personalização inicial da minha distro Debian
#Trabalho em andamento... noob noob noob

#Instala dependências e ferramentas
sudo apt update -y
sudo apt install -y wget git gcc vim ruby golang python3 screenfetch software-properties-common qterminal firefox-esr
sudo apt install -y accountsservice gir1.2-atk-1.0 gir1.2-freedesktop gir1.2-gdkpixbuf-2.0 gir1.2-gst-plugins-base-1.0 gir1.2-gstreamer-1.0 gir1.2-gtk-3.0 gir1.2-pango-1.0 gstreamer1.0-gl libaccountsservice0 libgraphene-1.0-0 libgstreamer-gl1.0-0 libpangoxft-1.0-0 python3-cairo python3-pexpect python3-ptyprocess

###Criar if para escolha se já possui interface grafica instalada
#apt install -y xorg xfce4 xfce4-goodies lightdm

#Instala pacote mugshot faltante
cd /tmp
wget http://ftp.br.debian.org/debian/pool/main/m/mugshot/mugshot_0.4.2-1_all.deb
sudo dpkg -i mugshot_0.4.2-1_all.deb

#Baixa e instala temas
#mkdir -p /home/$USER/.themes
wget https://github.com/rhendges/linux-scripts/raw/master/flat-remix-blue.xz
tar -xf flat-remix-blue.xz
#cp -r Flat-Remix-Blue/ /home/$USER/.icons/
sudo cp -r Flat-Remix-Blue/ /usr/share/icons/
rm -rf Flat-Remix-Blue/
rm flat-remix-blue.xz

wget https://github.com/rhendges/linux-scripts/raw/master/NumixHolo.zip
unzip -qq -o NumixHolo.zip
#cp -r NumixHolo/ /home/$USER/.themes/
sudo cp -r NumixHolo/ /usr/share/themes/
rm -rf NumixHolo/
rm NumixHolo.zip

wget https://github.com/rhendges/linux-scripts/raw/master/xfce4.zip
unzip -qq -o xfce4.zip
rm xfce4.zip

wget https://github.com/rhendges/linux-scripts/raw/master/.gtkrc-2.0
cp .gtkrc-2.0 /home/$USER/
sudo cp .gtkrc-2.0 /etc/skel/

#Define os temas
mkdir /home/$USER/.config
cp -r panel/ /home/$USER/.config/xfce4/
cp -r terminal/ /home/$USER/.config/xfce4/
cp -r xfconf/ /home/$USER/.config/xfce4/

#copia templates do usuário para /etc/skel
sudo mkdir /etc/skel/.config
sudo mkdir /etc/skel/.config/xfce4
sudo cp -r panel/ /etc/skel/.config/xfce4/
sudo cp -r terminal/ /etc/skel/.config/xfce4/
sudo cp -r xfconf/ /etc/skel/.config/xfce4/


#echo "screenfetch" >> /home/$USER/.bashrc
#sudo echo "screenfetch" >> /etc/skel/.bashrc

