#!/bin/bash
#Script para automatizar enumeração com nmap
end_ip=$1
nom_ip=$(echo $end_ip | tr '/' _)
nports=$(nmap -p- --open -T4 $end_ip | grep ^[0-9] | cut -d '/' -f 1 | tr '\n' ',' | sed s/,$//)
echo ""
echo "Enumerando serviços das seguintes portas descobertas:"
echo $nports
echo ""
nmap -Pn -sC -sV -p$nports $end_ip -oN nmap_$nom_ip.txt
