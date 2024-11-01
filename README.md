****Для GNU/Linux Debian 12 x64****
 
 
*****Установка из файла*****

Во всех случаях до полной установки нужно добавить ключ  ****-y****   в конце / поправить файл при отсутствии пакета итд...

xargs apt-get install < FILENAME.txt


----------
****Сохранение в файл установленных в ОС пакетов*****

 apt-mark showmanual > FILENAME.txt
 
 
----------
 ****Сохранение в файл список подходящих файлов из РЕПОЗИТОРИЯ*****
 
 apt-cache pkgnames music > FILENAME.txt
 
    ( Сохраняет в файл все пакеты в имени с music )



----------
****Deb 2 - Debian 12 repository****

/etc/apt/sources.list

deb https://ftp.debian.org/debian/ bookworm contrib main non-free non-free-firmware

deb-src https://ftp.debian.org/debian/ bookworm contrib main non-free non-free-firmware


deb https://ftp.debian.org/debian/ bookworm-updates contrib main non-free non-free-firmware

deb-src https://ftp.debian.org/debian/ bookworm-updates contrib main non-free non-free-firmware


deb https://ftp.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware

deb-src https://ftp.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware


deb https://ftp.debian.org/debian/ bookworm-backports contrib main non-free non-free-firmware

deb-src https://ftp.debian.org/debian/ bookworm-backports contrib main non-free non-free-firmware


deb https://security.debian.org/debian-security/ bookworm-security contrib main non-free non-free-firmware

deb-src https://security.debian.org/debian-security/ bookworm-security contrib main non-free non-free-firmware



----------

 
  
