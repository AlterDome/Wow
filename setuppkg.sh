#
#  
#  Author Rybochkin Aleksei
#  September 2025
#
#  




###  1 
function aa() {
echo " "
echo " 1 - Установить обновления upgrade dist-upgrade  "

apt-get check
apt-get update
apt-get upgrade
apt-get dist-upgrade

apt-get check
apt-get update
apt-get check


# mk-build-deps --install

# echo yes | mk-build-deps -ri ## для установки без вопросов

}




###   2 
function ba() { 
echo "  "
echo " 2 - Сохранить пакеты в ОС в файл     "
echo "      Введите название файла     "

read filename

apt-mark showmanual > $filename

}

###   3 - 
function ca() { 
echo " 3 - Установить нужные пакеты из файла  "
echo "      Введите название файла     "

read filename

# -y нужно для согласия...
xargs apt-get install < $filename -y

echo " "

}




### - 4 Сохранение в файл из репы по названию
function da() { 
echo " Сохранение в файл из репы по названию"

echo "    Введите название слова поиска"
read slovo

echo "    Введите название файла для сохранения"
read filename

apt-cache pkgnames $slovo > $filename


}


### - 5  ВЫХОД ИЗ СКРИПТА
function ea() { 
echo " ВЫХОД ИЗ СКРИПТА "
echo " 5 Exit ..."

exit 0;
}


### - 6 Установка реп Debian 12
function fa() { 
echo " Установка реп Debian 12 "

cp /etc/apt/sources.list /etc/apt/sources.list.copy
#######
echo "#######" >> /etc/apt/sources.list

echo "deb https://ftp.debian.org/debian/ bookworm contrib main non-free non-free-firmware" >> /etc/apt/sources.list
echo "deb-src https://ftp.debian.org/debian/ bookworm contrib main non-free non-free-firmware" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "deb https://ftp.debian.org/debian/ bookworm-updates contrib main non-free non-free-firmware" >> /etc/apt/sources.list
echo "deb-src https://ftp.debian.org/debian/ bookworm-updates contrib main non-free non-free-firmware" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "deb https://ftp.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware" >> /etc/apt/sources.list
echo "deb-src https://ftp.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "deb https://ftp.debian.org/debian/ bookworm-backports contrib main non-free non-free-firmware" >> /etc/apt/sources.list
echo "deb-src https://ftp.debian.org/debian/ bookworm-backports contrib main non-free non-free-firmware" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "deb https://security.debian.org/debian-security/ bookworm-security contrib main non-free non-free-firmware" >> /etc/apt/sources.list
echo "deb-src https://security.debian.org/debian-security/ bookworm-security contrib main non-free non-free-firmware" >> /etc/apt/sources.list
echo "" >> /etc/apt/sources.list
echo "#######" >> /etc/apt/sources.list

#####
echo "It's done "


exit 0;
}



### - 7 Установка реп Debian 13 Trixie
function ga() { 
echo " Установка реп Debian 13 Trixie "

cp /etc/apt/sources.list /etc/apt/sources.list.copy
#######
echo "#######" >> /etc/apt/sources.list

echo "deb https://deb.debian.org/debian trixie main" >> /etc/apt/sources.list
echo "deb https://deb.debian.org/debian-security trixie-security main" >> /etc/apt/sources.list
echo "deb https://deb.debian.org/debian/ trixie-updates main" >> /etc/apt/sources.list

echo "" >> /etc/apt/sources.list
echo "#######" >> /etc/apt/sources.list
#####
echo "It's done "

exit 0;
}


### - 8 Установка реп Debian 14 Forky
function ha() { 
echo " Установка реп Debian 14 Forky "

cp /etc/apt/sources.list /etc/apt/sources.list.copy
#######
echo "#######" >> /etc/apt/sources.list

echo "deb https://deb.debian.org/debian forky main" >> /etc/apt/sources.list
echo "deb https://deb.debian.org/debian-security forky-security main" >> /etc/apt/sources.list
echo "deb https://deb.debian.org/debian/ forky-updates main" >> /etc/apt/sources.list

echo "" >> /etc/apt/sources.list
echo "#######" >> /etc/apt/sources.list
#####
echo "It's done "

exit 0;
}


####################################################################
function mainn() {
echo " 1 - Установить обновления upgrade dist-upgrade  "
echo ""

echo " 2 - Сохранить пакеты в ОС в файл     "
echo ""

echo " 3 - Установить нужные пакеты из файла  "
echo ""

echo " 4 - Сохранение в файл список подходящих файлов из РЕПОЗИТОРИЯ  "
echo ""

echo " 5 - Exit  "
echo ""

echo " 6 - Внести стандартные репы Debian 12 Bookworm в файл ОС  "
echo ""

echo " 7 - Внести стандартные репы Debian 13 Trixie в файл ОС  "
echo ""

echo " 8 - Внести стандартные репы Debian 14 Forky  в файл ОС "

echo " Введите значение ... "

main
}

function main() {

read number

case $number in

1) aa
;;
2) ba
;;
3) ca
;;
4) da
;;
5) ea
;;

6) fa
;;

7) ga
;;

8) ha
;;

*) mainn
;;
esac
}



#! /bin/bash
### ГЛАВНОЕ МЕНЮ 
echo " "
echo "                **********                "
echo "  Работа с пакетами  "
mainn
