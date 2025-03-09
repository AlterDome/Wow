 
#!/bin/bash
#######
#  chmod +x filename.sh
#  Deb 2 - Debian 12 repository
#  /etc/apt/sources.list

# deb https://ftp.debian.org/debian/ bookworm contrib main non-free non-free-firmware
# deb-src https://ftp.debian.org/debian/ bookworm contrib main non-free non-free-firmware

# deb https://ftp.debian.org/debian/ bookworm-updates contrib main non-free non-free-firmware
# deb-src https://ftp.debian.org/debian/ bookworm-updates contrib main non-free non-free-firmware

# deb https://ftp.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware
# deb-src https://ftp.debian.org/debian/ bookworm-proposed-updates contrib main non-free non-free-firmware

# deb https://ftp.debian.org/debian/ bookworm-backports contrib main non-free non-free-firmware
# deb-src https://ftp.debian.org/debian/ bookworm-backports contrib main non-free non-free-firmware

# deb https://security.debian.org/debian-security/ bookworm-security contrib main non-free non-free-firmware
# deb-src https://security.debian.org/debian-security/ bookworm-security contrib main non-free non-free-firmware
#
#######
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
