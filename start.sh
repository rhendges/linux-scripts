#!/bin/bash
echo 'Script de personalização inicial da minha distro Debian...'
echo "Pressione <ENTER> para continuar ou CTRL+C para sair."
read

#Instala netselect para otimizar mirrors apt
sudo apt update
sudo apt install -y open-vm-tools netselect-apt
#sudo netselect-apt -t 6 -a amd64 -n stable
#sudo mv sources.list /etc/apt/sources.list

#Instala dependências e ferramentas
sudo apt update -y
sudo apt install -y wget git gcc vim ruby golang python3 python3-venv python3-pip screenfetch software-properties-common qterminal firefox-esr xrdp lolcat adwaita-qt remmina rdesktop nmap
sudo apt install -y accountsservice gir1.2-atk-1.0 gir1.2-freedesktop gir1.2-gdkpixbuf-2.0 gir1.2-gst-plugins-base-1.0 gir1.2-gstreamer-1.0 gir1.2-gtk-3.0 gir1.2-pango-1.0 gstreamer1.0-gl libaccountsservice0 libgraphene-1.0-0 libgstreamer-gl1.0-0 libpangoxft-1.0-0 python3-cairo python3-pexpect python3-ptyprocess build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev libffi-dev curl libbz2-dev software-properties-common

#Instala interface grafica com xfce4
if dpkg -l | grep xserver-xorg-core > /dev/null ; then
echo "Xorg instalado!"
else
sudo apt install -y task-xfce-desktop
fi

#Instala pacote mugshot faltante
cd /tmp
wget https://github.com/rhendges/linux-scripts/raw/master/mugshot_0.4.3-1_all.deb
sudo dpkg -i mugshot_0.4.3-1_all.deb

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

wget https://github.com/rhendges/linux-scripts/raw/master/config.zip
unzip -qq -o config.zip
rm config.zip

wget https://github.com/rhendges/linux-scripts/raw/master/.gtkrc-2.0
cp .gtkrc-2.0 /home/$USER/
sudo cp .gtkrc-2.0 /etc/skel/

wget https://github.com/rhendges/linux-scripts/raw/master/Kali-Dark.colorscheme
wget https://github.com/rhendges/linux-scripts/raw/master/Kali-Light.colorscheme
sudo mv *.colorscheme /usr/share/qtermwidget5/color-schemes

#Define os temas
mkdir /home/$USER/.config
cp -r xfce4/ /home/$USER/.config/
cp -r dconf/ /home/$USER/.config/
cp -r qterminal.org/ /home/$USER/.config/

#copia templates do usuário para /etc/skel
sudo mkdir /etc/skel/.config
sudo cp -r dconf/ /etc/skel/.config/
sudo cp -r qterminal.org/ /etc/skel/.config/
sudo cp -r xfce4/ /etc/skel/.config/

#Inicializa screenfetch no .bashrc
if grep -q screenfetch ~/.bashrc; then
echo "Já"
else
echo "screenfetch|lolcat" >> /home/$USER/.bashrc
fi

if grep -q screenfetch /etc/skel/.bashrc; then
echo "Já"
else
sudo bash -c 'echo "screenfetch|lolcat" >> /etc/skel/.bashrc'
fi

#Baixa e instala python 3.8
cd /opt
sudo wget https://www.python.org/ftp/python/3.8.7/Python-3.8.7.tgz
sudo tar -xvf Python-3.8.7.tgz
cd Python-3.8.7/
sudo ./configure --enable-optimizations
sudo make altinstall
alias python=python3.8
if grep -q python=python3.8 ~/.bashrc; then
echo "Já"
else
echo "alias python=python3.8" >> /home/$USER/.bashrc
fi
if grep -q python=python3.8 /etc/skel/.bashrc; then
echo "Já"
else
sudo bash -c 'echo "alias python=python3.8" >> /etc/skel/.bashrc'
fi

#Instala ferramentas uteis
sudo apt install python3-pip
python3 -m pip install pipx
python3 -m pipx ensurepath
export PATH=$PATH:/home/$USER/.local/bin
python3 -m pipx install crackmapexec
python3 -m pip install git+https://github.com/calebstewart/pwncat.git
