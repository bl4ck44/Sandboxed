#!/bin/bash

while :
do

clear

echo

echo
echo -e "\033[32m   _________                  .______.                           .___  \033[0m"
echo -e "\033[32m  /   _____/____    ____    __| _/\_ |__   _______  ___ ____   __| _/  \033[0m"
echo -e "\033[32m  \_____  \\__  \  /    \  / __ |  | __ \ /  _ \  \/  // __ \ / __ |   \033[0m"
echo -e "\033[32m  /        \/ __ \|   |  \/ /_/ |  | \_\ (  <_> >    <\  ___// /_/ |   \033[0m"
echo -e "\033[32m /_______  (____  /___|  /\____ |  |___  /\____/__/\_ \\___  >____ |   \033[0m"
echo -e "\033[32m         \/     \/     \/      \/      \/            \/    \/     \/   \033[0m"

echo

int_handler (){
    clear
    echo
    echo -e "\033[1m [+] Adios\033[0m"
    echo
    kill $PPID
    exit 1
}

trap 'int_handler' INT

if [ "$(id -u)" != "0" ]; then
   echo "Ejecute este script como root (usando sudo)."
   exit 1
fi


Comprobar (){

if command -v manalyze >/dev/null 2>&1; then
  echo -e "\n[✔️] manalyze"
else
  echo -e "\n[❌] manalyze"
fi



if command -v peframe >/dev/null 2>&1; then
  echo -e "\n[✔️] peframe"
else
  echo -e "\n[❌] peframe"
fi



if command -v pestr >/dev/null 2>&1; then
  echo -e "\n[✔️] pestr"
else
  echo -e "\n[❌] pestr"
fi



if command -v pscodedump >/dev/null 2>&1; then
  echo -e "\n[✔️] pscodedump"
else
  echo -e "\n[❌] pscodedump"
fi



if command -v olevba >/dev/null 2>&1; then
  echo -e "\n[✔️] olevba"
else
  echo -e "\n[❌] olevba"
fi



if command -v xlmdeobfuscator >/dev/null 2>&1; then
  echo -e "\n[✔️] xlmdeobfuscator"
else
  echo -e "\n[❌] xlmdeobfuscator"
fi



if command -v pdfextract >/dev/null 2>&1; then
  echo -e "\n[✔️] pdfextract"
else
  echo -e "\n[❌] pdfextract"
fi



if command -v pdfresurrect >/dev/null 2>&1; then
  echo -e "\n[✔️] pdfresurrect"
else
  echo -e "\n[❌] pdfresurrect"
fi


}



Instalar (){

if command -v manalyze >/dev/null 2>&1; then
  echo -e "\n[✔️] manalyze"
else
  echo -e "\n[❌] manalyze"
  apt-get install libboost-regex-dev libboost-program-options-dev libboost-system-dev libboost-filesystem-dev libssl-dev build-essential cmake git
  pkg install boost-libs-1.55.0_8 libressl cmake git
  git clone https://github.com/JusticeRage/Manalyze.git && cd Manalyze
  cmake .
  make -j5
  cd bin && ./manalyze --version
  cd ..
  make install
fi



if command -v peframe >/dev/null 2>&1; then
  echo -e "\n[✔️] peframe"
else
  echo -e "\n[❌] peframe"
  sudo apt install git
  git clone https://github.com/guelfoweb/peframe.git
  cd peframe
  sudo apt-get install libreadline-dev
  pip3 install -r requirements.txt
  pip3 install readline 
  sudo bash install.sh
  sudo python3 setup.py install 
fi



if command -v pestr >/dev/null 2>&1; then
  echo -e "\n[✔️] pstr"
else
  echo -e "\n[❌] pstr"
  sudo apt-get install pev
fi



if command -v pcodedmp >/dev/null 2>&1; then
  echo -e "\n[✔️] pcodedmp"
else
  echo -e "\n[❌] pcodedmp"
  pip install pcodedmp -U
fi



if command -v olevba >/dev/null 2>&1; then
  echo -e "\n[✔️] olevba"
else
  echo -e "\n[❌] olevba"
  pip install oletools
fi



if command -v xlmdeobfuscator >/dev/null 2>&1; then
  echo -e "\n[✔️] xlmdeobfuscator"
else
  echo -e "\n[❌] xlmdeobfuscator"
  pip install XLMMacroDeobfuscator --force
fi


if command -v pdfextract >/dev/null 2>&1; then
  echo -e "\n[✔️] pdfextract"
else
  echo -e "\n[❌] pdfextract"
  pip install pdfextract
fi



if command -v pdfresurrect >/dev/null 2>&1; then
  echo -e "\n[✔️] pdfresurrect"
else
  echo -e "\n[❌] pdfresurrect"
  git clone https://github.com/enferex/pdfresurrect.git
  cd pdfresurrect
  ./configure
  make
  ./configure --prefix=/my/desired/path/
  ./configure --enable-debug
  make install
fi



if [ -d Manalyze ]; then 
  rm -r Manalyze; 
fi


}



echo -e "\033[1m [1] Comprobar requsitos \033[0m"
echo -e "\033[1m [2] Instalar requisitos \033[0m"
echo -e "\033[1m [3] Salir \033[0m"

echo

#leemos del teclado
read -p $'\033[1m [+] Seleccione una opción: \033[0m' opcion

case $opcion in

           1) echo
           Comprobar
           sleep 2.0;;

           2) echo
           Instalar
           sleep 1.5;;

           3) echo
           clear
           echo
           echo -e "\033[1m [+] Adios\033[0m"
           echo
           exit;;
           
esac

echo

done