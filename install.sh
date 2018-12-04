#!/bin/bash

clear

SPED_VERSION="SPEDContabil_linux_x86-5.0.3.jar"


echo "Atualizando sistema..."
sudo apt-get update

echo "Instalando Bibliotecas..."
sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install -y libc6:i386 libncurses5:i386 libstdc++6:i386 libxi6:i386 libxrender1:i386 libxtst6:i386 wget
sudo apt-get install ttf-mscorefonts-installer
sudo fc-cache

wget http://www.receita.fazenda.gov.br/publico/programas/Sped/SpedContabil/${SPED_VERSION}

tar -zxvf jre.tar.gz
./jre/bin/java -jar ${SPED_VERSION}
rm -rf  $HOME/ProgramasSPED/SpedContabil/jre/
rm -f ${SPED_VERSION}
echo "Movendo JRE..."
mv jre $HOME/ProgramasSPED/SpedContabil
echo "Permissão de arquivos..."
sudo chmod -Rf 777 $HOME/ProgramasSPED/SpedContabil/contabilpva.jar
sudo chmod -Rf 777 $HOME/ProgramasSPED/SpedContabil/jre/
echo '-------------------'
echo '\0/ Instalado! \0/'
echo '-------------------'
