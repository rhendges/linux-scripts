#!/bin/bash
#Script de personalização inicial da minha distro Debian
#Executar como sudo
apt update -y
apt install -y wget git gcc python3 screenfetch software-properties-common

###Criar if para escolha se já possui interface grafica instalada
#apt install -y xorg xfce4 xfce4-goodies lightdm

mkdir -p ~/.themes
cd /tmp
