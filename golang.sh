#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0 $*"
    exit 1
fi

#Check if golang exists

    if ! hash go 2>/dev/null; then
        #Download Latest Go
        echo [+] Golang não encontrado. Procedendo com a instalação...
        echo [+] Verificando versão atual do go...
        versao="$(curl -s https://golang.org/VERSION?m=text)"
        echo [+] Versão encontrada: ${versao}
        echo [+] Baixando golang...
	url='https://golang.org/dl/'${versao}'.linux-amd64.tar.gz'
	echo $url
	echo ''
	wget --quiet --continue --show-progress "${url}"
	#Instalando go
	tar -xvf ${versao}.linux-amd64.tar.gz -C /tmp/go
	mv /tmp/go /usr/bin/go
	unset url
	unset versao
	echo [+] $(echo $(go version)) instalado em $(which go).
    fi
echo [+] $(go version) encontrado em $(echo $(which go))


# Download assetfinder
go get -u github.com/tomnomnom/assetfinder


