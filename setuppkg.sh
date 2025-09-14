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
echo "####### Debian 12 Bookworm " >> /etc/apt/sources.list

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
echo "####### End of Debian 12 Bookworm" >> /etc/apt/sources.list

#####
echo "It's done "


exit 0;
}



### - 7 Установка реп Debian 13 Trixie
function ga() { 
echo " Установка реп Debian 13 Trixie "

cp /etc/apt/sources.list /etc/apt/sources.list.copy
#######
echo "####### Debian 13 Trixie " >> /etc/apt/sources.list

echo "deb https://deb.debian.org/debian trixie main" >> /etc/apt/sources.list
echo "deb https://deb.debian.org/debian-security trixie-security main" >> /etc/apt/sources.list
echo "deb https://deb.debian.org/debian/ trixie-updates main" >> /etc/apt/sources.list

echo "" >> /etc/apt/sources.list
echo "####### End of Debian 13 Trixie" >> /etc/apt/sources.list
#####
echo "It's done "

exit 0;
}


### - 8 Установка реп Debian 14 Forky
function ha() { 
echo " Установка реп Debian 14 Forky "

cp /etc/apt/sources.list /etc/apt/sources.list.copy
#######
echo "####### Debian 14 Forky " >> /etc/apt/sources.list

echo "deb https://deb.debian.org/debian forky main" >> /etc/apt/sources.list
echo "deb https://deb.debian.org/debian-security forky-security main" >> /etc/apt/sources.list
echo "deb https://deb.debian.org/debian/ forky-updates main" >> /etc/apt/sources.list

echo "" >> /etc/apt/sources.list
echo "####### End of Debian 14 Forky " >> /etc/apt/sources.list
#####
echo "It's done "

exit 0;
}

### - 9 Добавить репы Kali 
function ia() {
echo "####### Kali" >> /etc/apt/sources.list

echo "deb http://http.kali.org/kali kali-experimental main contrib non-free" >> /etc/apt/sources.list
echo "deb http://http.kali.org/kali kali-bleeding-edge main contrib non-free" >> /etc/apt/sources.list
echo "deb http://http.kali.org/kali kali-rolling main contrib non-free" >> /etc/apt/sources.list
echo "deb http://http.kali.org/kali kali-last-snapshot main contrib non-free" >> /etc/apt/sources.list
echo "####### End of Kali" >> /etc/apt/sources.list

wget 'https://archive.kali.org/archive-key.asc'
sudo apt-key add archive-key.asc
}



#
#
#
#
#
### - 10  Настроить tor proxychain торификацию в Debian 12
function ja() {
echo "Настроить tor proxychain торификацию в Debian 12 в /etc/proxychains4.conf "

apt-get check
#apt-get update
#apt-get upgrade
#apt-get dist-upgrade

echo "                  Ставим пакеты для тор и прокси ..."
apt-get install tor \
torbrowser-launcher \
tor-arm tor-geoipdb \
proxychains4 \
proxychains \
proxycheck \
proxytunnel \
proxytrack \
ufw \
gufw \
lynx

apt-get check

echo "                   Редактируем файл /etc/proxychains4.conf "

#/etc/proxychains4.conf
#
#Список прокси с портом 3128 ( самый лучший порт tcp )
##
# 128.199.202.122	3128	
# 45.129.141.143	3128	
# 154.0.14.116	3128	
# 95.47.239.65	3128	
# 197.243.27.122	3128	
# 47.99.112.148	3128	
# 47.91.89.3	3128		
# 8.138.82.6	3128	
# 193.34.237.41	3128
# 49.65.124.192	3128
# 8.220.141.8	3128
# 47.250.51.110	3128
# 8.148.23.202	3128
# 47.91.109.17	3128
# 8.130.39.117	3128
# 31.25.236.121	3128
# 66.29.154.103	3128
# 8.213.156.191	3128
# 47.109.110.100	3128
# 39.102.209.163	3128
# 195.93.172.32	3128
# 193.178.210.188	3128	
# 103.242.104.160	3128
# 47.250.177.202	3128
# 181.10.200.154	3128
# 188.166.197.129	3128
# 39.102.211.64	3128
# 129.146.167.15	3128
# 47.250.159.65	3128
# 103.163.13.126	3128
# 41.223.119.156	3128
# 66.29.154.105	3128
# 91.202.5.45	3128
# 47.91.29.151	3128
#
#
#

echo "# proxychains.conf  VER 4.x" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#        HTTP, SOCKS4a, SOCKS5 tunneling proxifier with DNS." > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# The option below identifies how the ProxyList is treated." > /etc/proxychains4.conf
echo "# only one option should be uncommented at time," > /etc/proxychains4.conf
echo "# otherwise the last appearing option will be accepted" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#dynamic_chain" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "# Dynamic - Each connection will be done via chained proxies" > /etc/proxychains4.conf
echo "# all proxies chained in the order as they appear in the list" > /etc/proxychains4.conf
echo "# at least one proxy must be online to play in chain" > /etc/proxychains4.conf
echo "# (dead proxies are skipped)" > /etc/proxychains4.conf
echo "# otherwise EINTR is returned to the app" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "strict_chain" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "# Strict - Each connection will be done via chained proxies" > /etc/proxychains4.conf
echo "# all proxies chained in the order as they appear in the list" > /etc/proxychains4.conf
echo "# all proxies must be online to play in chain" > /etc/proxychains4.conf
echo "# otherwise EINTR is returned to the app" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#round_robin_chain" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "# Round Robin - Each connection will be done via chained proxies" > /etc/proxychains4.conf
echo "# of chain_len length" > /etc/proxychains4.conf
echo "# all proxies chained in the order as they appear in the list" > /etc/proxychains4.conf
echo "# at least one proxy must be online to play in chain" > /etc/proxychains4.conf
echo "# (dead proxies are skipped)." > /etc/proxychains4.conf
echo "# the start of the current proxy chain is the proxy after the last" > /etc/proxychains4.conf
echo "# proxy in the previously invoked proxy chain." > /etc/proxychains4.conf
echo "# if the end of the proxy chain is reached while looking for proxies" > /etc/proxychains4.conf
echo "# start at the beginning again." > /etc/proxychains4.conf
echo "# otherwise EINTR is returned to the app" > /etc/proxychains4.conf
echo "# These semantics are not guaranteed in a multithreaded environment." > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#random_chain" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "# Random - Each connection will be done via random proxy" > /etc/proxychains4.conf
echo "# (or proxy chain, see  chain_len) from the list." > /etc/proxychains4.conf
echo "# this option is good to test your IDS :)" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# Make sense only if random_chain or round_robin_chain" > /etc/proxychains4.conf
echo "#chain_len = 2" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# Quiet mode (no output from library)" > /etc/proxychains4.conf
echo "#quiet_mode" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## Proxy DNS requests - no leak for DNS data" > /etc/proxychains4.conf
echo "# (disable all of the 3 items below to not proxy your DNS requests)" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# method 1. this uses the proxychains4 style method to do remote dns:" > /etc/proxychains4.conf
echo "# a thread is spawned that serves DNS requests and hands down an ip" > /etc/proxychains4.conf
echo "# assigned from an internal list (via remote_dns_subnet)." > /etc/proxychains4.conf
echo "# this is the easiest (setup-wise) and fastest method, however on" > /etc/proxychains4.conf
echo "# systems with buggy libcs and very complex software like webbrowsers" > /etc/proxychains4.conf
echo "# this might not work and/or cause crashes." > /etc/proxychains4.conf
echo "proxy_dns" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# method 2. use the old proxyresolv script to proxy DNS requests" > /etc/proxychains4.conf
echo "# in proxychains 3.1 style. requires ``proxyresolv`` in $PATH" > /etc/proxychains4.conf
echo "# plus a dynamically linked `dig` binary." > /etc/proxychains4.conf
echo "# this is a lot slower than ``proxy_dns``, doesn't support .onion URLs," > /etc/proxychains4.conf
echo "# but might be more compatible with complex software like webbrowsers." > /etc/proxychains4.conf
echo "#proxy_dns_old" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# method 3. use proxychains4-daemon process to serve remote DNS requests." > /etc/proxychains4.conf
echo "# this is similar to the threaded ``proxy_dns`` method, however it requires" > /etc/proxychains4.conf
echo "# that proxychains4-daemon is already running on the specified address." > /etc/proxychains4.conf
echo "# on the plus side it doesn't do malloc/threads so it should be quite" > /etc/proxychains4.conf
echo "# compatible with complex, async-unsafe software." > /etc/proxychains4.conf
echo "# note that if you don't start proxychains4-daemon before using this," > /etc/proxychains4.conf
echo "# the process will simply hang." > /etc/proxychains4.conf
echo "#proxy_dns_daemon 127.0.0.1:1053" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# set the class A subnet number to use for the internal remote DNS mapping" > /etc/proxychains4.conf
echo "# we use the reserved 224.x.x.x range by default," > /etc/proxychains4.conf
echo "# if the proxified app does a DNS request, we will return an IP from that range." > /etc/proxychains4.conf
echo "# on further accesses to this ip we will send the saved DNS name to the proxy." > /etc/proxychains4.conf
echo "# in case some control-freak app checks the returned ip, and denies to" > /etc/proxychains4.conf
echo "# connect, you can use another subnet, e.g. 10.x.x.x or 127.x.x.x." > /etc/proxychains4.conf
echo "# of course you should make sure that the proxified app does not need" > /etc/proxychains4.conf
echo "# *real* access to this subnet." > /etc/proxychains4.conf
echo "# i.e. dont use the same subnet then in the localnet section" > /etc/proxychains4.conf
echo "#remote_dns_subnet 127" > /etc/proxychains4.conf
echo "#remote_dns_subnet 10" > /etc/proxychains4.conf
echo "remote_dns_subnet 224" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# Some timeouts in milliseconds" > /etc/proxychains4.conf
echo "tcp_read_time_out 15000" > /etc/proxychains4.conf
echo "tcp_connect_time_out 8000" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "### Examples for localnet exclusion" > /etc/proxychains4.conf
echo "## localnet ranges will *not* use a proxy to connect." > /etc/proxychains4.conf
echo "## note that localnet works only when plain IP addresses are passed to the app," > /etc/proxychains4.conf
echo "## the hostname resolves via /etc/hosts, or proxy_dns is disabled or proxy_dns_old used." > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## Exclude connections to 192.168.1.0/24 with port 80" > /etc/proxychains4.conf
echo "# localnet 192.168.1.0:80/255.255.255.0" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## Exclude connections to 192.168.100.0/24" > /etc/proxychains4.conf
echo "# localnet 192.168.100.0/255.255.255.0" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## Exclude connections to ANYwhere with port 80" > /etc/proxychains4.conf
echo "# localnet 0.0.0.0:80/0.0.0.0" > /etc/proxychains4.conf
echo "# localnet [::]:80/0" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## RFC6890 Loopback address range" > /etc/proxychains4.conf
echo "## if you enable this, you have to make sure remote_dns_subnet is not 127" > /etc/proxychains4.conf
echo "## you'll need to enable it if you want to use an application that" > /etc/proxychains4.conf
echo "## connects to localhost." > /etc/proxychains4.conf
echo "# localnet 127.0.0.0/255.0.0.0" > /etc/proxychains4.conf
echo "# localnet ::1/128" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## RFC1918 Private Address Ranges" > /etc/proxychains4.conf
echo "# localnet 10.0.0.0/255.0.0.0" > /etc/proxychains4.conf
echo "# localnet 172.16.0.0/255.240.0.0" > /etc/proxychains4.conf
echo "# localnet 192.168.0.0/255.255.0.0" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "### Examples for dnat" > /etc/proxychains4.conf
echo "## Trying to proxy connections to destinations which are dnatted," > /etc/proxychains4.conf
echo "## will result in proxying connections to the new given destinations." > /etc/proxychains4.conf
echo "## Whenever I connect to 1.1.1.1 on port 1234 actually connect to 1.1.1.2 on port 443" > /etc/proxychains4.conf
echo "# dnat 1.1.1.1:1234  1.1.1.2:443" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## Whenever I connect to 1.1.1.1 on port 443 actually connect to 1.1.1.2 on port 443" > /etc/proxychains4.conf
echo "## (no need to write :443 again)" > /etc/proxychains4.conf
echo "# dnat 1.1.1.2:443  1.1.1.2" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## No matter what port I connect to on 1.1.1.1 port actually connect to 1.1.1.2 on port 443" > /etc/proxychains4.conf
echo "# dnat 1.1.1.1  1.1.1.2:443" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## Always, instead of connecting to 1.1.1.1, connect to 1.1.1.2" > /etc/proxychains4.conf
echo "# dnat 1.1.1.1  1.1.1.2" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# ProxyList format" > /etc/proxychains4.conf
echo "#       type  ip  port [user pass]" > /etc/proxychains4.conf
echo "#       (values separated by 'tab' or 'blank')" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#       only numeric ipv4 addresses are valid" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#        Examples:" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#            	socks5	192.168.67.78	1080	lamer	secret" > /etc/proxychains4.conf
echo "#		http	192.168.89.3	8080	justu	hidden" > /etc/proxychains4.conf
echo "#	 	socks4	192.168.1.49	1080" > /etc/proxychains4.conf
echo "#	        http	192.168.39.93	8080" > /etc/proxychains4.conf	
echo "#" > /etc/proxychains4.conf	
echo "#" > /etc/proxychains4.conf
echo "#       proxy types: http, socks4, socks5, raw" > /etc/proxychains4.conf
echo "#         * raw: The traffic is simply forwarded to the proxy without modification." > /etc/proxychains4.conf
echo "#        ( auth types supported: "basic"-http  "user/pass"-socks )" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "[ProxyList]" > /etc/proxychains4.conf
echo "# add proxy here ..." > /etc/proxychains4.conf
echo "# meanwile" > /etc/proxychains4.conf
echo "# defaults set to "tor"" > /etc/proxychains4.conf
echo "#socks4 	127.0.0.1 9050" > /etc/proxychains4.conf # это для тор прокси
### добавили ниже
echo "http	128.199.202.122	3128" > /etc/proxychains4.conf ################# 1

# /etc/proxychains4.conf
proxychains4 curl ident.me  # Тут с прокси
#
#
##### Ставим пакеты для тор и прокси
}



#
#
#
#
### - 11 Убрать торификацию в Debian 12 
function ka() {
echo " Убрать торификацию в Debian 12 "
echo " Дефолтный файл /etc/proxychains4.conf "
#/etc/proxychains4.conf

echo "# proxychains.conf  VER 4.x" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#        HTTP, SOCKS4a, SOCKS5 tunneling proxifier with DNS." > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# The option below identifies how the ProxyList is treated." > /etc/proxychains4.conf
echo "# only one option should be uncommented at time," > /etc/proxychains4.conf
echo "# otherwise the last appearing option will be accepted" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#dynamic_chain" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "# Dynamic - Each connection will be done via chained proxies" > /etc/proxychains4.conf
echo "# all proxies chained in the order as they appear in the list" > /etc/proxychains4.conf
echo "# at least one proxy must be online to play in chain" > /etc/proxychains4.conf
echo "# (dead proxies are skipped)" > /etc/proxychains4.conf
echo "# otherwise EINTR is returned to the app" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "strict_chain" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "# Strict - Each connection will be done via chained proxies" > /etc/proxychains4.conf
echo "# all proxies chained in the order as they appear in the list" > /etc/proxychains4.conf
echo "# all proxies must be online to play in chain" > /etc/proxychains4.conf
echo "# otherwise EINTR is returned to the app" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#round_robin_chain" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "# Round Robin - Each connection will be done via chained proxies" > /etc/proxychains4.conf
echo "# of chain_len length" > /etc/proxychains4.conf
echo "# all proxies chained in the order as they appear in the list" > /etc/proxychains4.conf
echo "# at least one proxy must be online to play in chain" > /etc/proxychains4.conf
echo "# (dead proxies are skipped)." > /etc/proxychains4.conf
echo "# the start of the current proxy chain is the proxy after the last" > /etc/proxychains4.conf
echo "# proxy in the previously invoked proxy chain." > /etc/proxychains4.conf
echo "# if the end of the proxy chain is reached while looking for proxies" > /etc/proxychains4.conf
echo "# start at the beginning again." > /etc/proxychains4.conf
echo "# otherwise EINTR is returned to the app" > /etc/proxychains4.conf
echo "# These semantics are not guaranteed in a multithreaded environment." > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#random_chain" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "# Random - Each connection will be done via random proxy" > /etc/proxychains4.conf
echo "# (or proxy chain, see  chain_len) from the list." > /etc/proxychains4.conf
echo "# this option is good to test your IDS :)" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# Make sense only if random_chain or round_robin_chain" > /etc/proxychains4.conf
echo "#chain_len = 2" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# Quiet mode (no output from library)" > /etc/proxychains4.conf
echo "#quiet_mode" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## Proxy DNS requests - no leak for DNS data" > /etc/proxychains4.conf
echo "# (disable all of the 3 items below to not proxy your DNS requests)" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# method 1. this uses the proxychains4 style method to do remote dns:" > /etc/proxychains4.conf
echo "# a thread is spawned that serves DNS requests and hands down an ip" > /etc/proxychains4.conf
echo "# assigned from an internal list (via remote_dns_subnet)." > /etc/proxychains4.conf
echo "# this is the easiest (setup-wise) and fastest method, however on" > /etc/proxychains4.conf
echo "# systems with buggy libcs and very complex software like webbrowsers" > /etc/proxychains4.conf
echo "# this might not work and/or cause crashes." > /etc/proxychains4.conf
echo "proxy_dns" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# method 2. use the old proxyresolv script to proxy DNS requests" > /etc/proxychains4.conf
echo "# in proxychains 3.1 style. requires ``proxyresolv`` in $PATH" > /etc/proxychains4.conf
echo "# plus a dynamically linked `dig` binary." > /etc/proxychains4.conf
echo "# this is a lot slower than ``proxy_dns``, doesn't support .onion URLs," > /etc/proxychains4.conf
echo "# but might be more compatible with complex software like webbrowsers." > /etc/proxychains4.conf
echo "#proxy_dns_old" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# method 3. use proxychains4-daemon process to serve remote DNS requests." > /etc/proxychains4.conf
echo "# this is similar to the threaded ``proxy_dns`` method, however it requires" > /etc/proxychains4.conf
echo "# that proxychains4-daemon is already running on the specified address." > /etc/proxychains4.conf
echo "# on the plus side it doesn't do malloc/threads so it should be quite" > /etc/proxychains4.conf
echo "# compatible with complex, async-unsafe software." > /etc/proxychains4.conf
echo "# note that if you don't start proxychains4-daemon before using this," > /etc/proxychains4.conf
echo "# the process will simply hang." > /etc/proxychains4.conf
echo "#proxy_dns_daemon 127.0.0.1:1053" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# set the class A subnet number to use for the internal remote DNS mapping" > /etc/proxychains4.conf
echo "# we use the reserved 224.x.x.x range by default," > /etc/proxychains4.conf
echo "# if the proxified app does a DNS request, we will return an IP from that range." > /etc/proxychains4.conf
echo "# on further accesses to this ip we will send the saved DNS name to the proxy." > /etc/proxychains4.conf
echo "# in case some control-freak app checks the returned ip, and denies to" > /etc/proxychains4.conf
echo "# connect, you can use another subnet, e.g. 10.x.x.x or 127.x.x.x." > /etc/proxychains4.conf
echo "# of course you should make sure that the proxified app does not need" > /etc/proxychains4.conf
echo "# *real* access to this subnet." > /etc/proxychains4.conf
echo "# i.e. dont use the same subnet then in the localnet section" > /etc/proxychains4.conf
echo "#remote_dns_subnet 127" > /etc/proxychains4.conf
echo "#remote_dns_subnet 10" > /etc/proxychains4.conf
echo "remote_dns_subnet 224" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# Some timeouts in milliseconds" > /etc/proxychains4.conf
echo "tcp_read_time_out 15000" > /etc/proxychains4.conf
echo "tcp_connect_time_out 8000" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "### Examples for localnet exclusion" > /etc/proxychains4.conf
echo "## localnet ranges will *not* use a proxy to connect." > /etc/proxychains4.conf
echo "## note that localnet works only when plain IP addresses are passed to the app," > /etc/proxychains4.conf
echo "## the hostname resolves via /etc/hosts, or proxy_dns is disabled or proxy_dns_old used." > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## Exclude connections to 192.168.1.0/24 with port 80" > /etc/proxychains4.conf
echo "# localnet 192.168.1.0:80/255.255.255.0" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## Exclude connections to 192.168.100.0/24" > /etc/proxychains4.conf
echo "# localnet 192.168.100.0/255.255.255.0" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## Exclude connections to ANYwhere with port 80" > /etc/proxychains4.conf
echo "# localnet 0.0.0.0:80/0.0.0.0" > /etc/proxychains4.conf
echo "# localnet [::]:80/0" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## RFC6890 Loopback address range" > /etc/proxychains4.conf
echo "## if you enable this, you have to make sure remote_dns_subnet is not 127" > /etc/proxychains4.conf
echo "## you'll need to enable it if you want to use an application that" > /etc/proxychains4.conf
echo "## connects to localhost." > /etc/proxychains4.conf
echo "# localnet 127.0.0.0/255.0.0.0" > /etc/proxychains4.conf
echo "# localnet ::1/128" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## RFC1918 Private Address Ranges" > /etc/proxychains4.conf
echo "# localnet 10.0.0.0/255.0.0.0" > /etc/proxychains4.conf
echo "# localnet 172.16.0.0/255.240.0.0" > /etc/proxychains4.conf
echo "# localnet 192.168.0.0/255.255.0.0" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "### Examples for dnat" > /etc/proxychains4.conf
echo "## Trying to proxy connections to destinations which are dnatted," > /etc/proxychains4.conf
echo "## will result in proxying connections to the new given destinations." > /etc/proxychains4.conf
echo "## Whenever I connect to 1.1.1.1 on port 1234 actually connect to 1.1.1.2 on port 443" > /etc/proxychains4.conf
echo "# dnat 1.1.1.1:1234  1.1.1.2:443" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## Whenever I connect to 1.1.1.1 on port 443 actually connect to 1.1.1.2 on port 443" > /etc/proxychains4.conf
echo "## (no need to write :443 again)" > /etc/proxychains4.conf
echo "# dnat 1.1.1.2:443  1.1.1.2" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## No matter what port I connect to on 1.1.1.1 port actually connect to 1.1.1.2 on port 443" > /etc/proxychains4.conf
echo "# dnat 1.1.1.1  1.1.1.2:443" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "## Always, instead of connecting to 1.1.1.1, connect to 1.1.1.2" > /etc/proxychains4.conf
echo "# dnat 1.1.1.1  1.1.1.2" > /etc/proxychains4.conf
echo "" > /etc/proxychains4.conf
echo "# ProxyList format" > /etc/proxychains4.conf
echo "#       type  ip  port [user pass]" > /etc/proxychains4.conf
echo "#       (values separated by 'tab' or 'blank')" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#       only numeric ipv4 addresses are valid" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#        Examples:" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "#            	socks5	192.168.67.78	1080	lamer	secret" > /etc/proxychains4.conf
echo "#		http	192.168.89.3	8080	justu	hidden" > /etc/proxychains4.conf
echo "#	 	socks4	192.168.1.49	1080" > /etc/proxychains4.conf
echo "#	        http	192.168.39.93	8080" > /etc/proxychains4.conf	
echo "#" > /etc/proxychains4.conf	
echo "#" > /etc/proxychains4.conf
echo "#       proxy types: http, socks4, socks5, raw" > /etc/proxychains4.conf
echo "#         * raw: The traffic is simply forwarded to the proxy without modification." > /etc/proxychains4.conf
echo "#        ( auth types supported: "basic"-http  "user/pass"-socks )" > /etc/proxychains4.conf
echo "#" > /etc/proxychains4.conf
echo "[ProxyList]" > /etc/proxychains4.conf
echo "# add proxy here ..." > /etc/proxychains4.conf
echo "# meanwile" > /etc/proxychains4.conf
echo "# defaults set to tor" > /etc/proxychains4.conf
echo "socks4 	127.0.0.1 9050" > /etc/proxychains4.conf   

echo "" > /etc/proxychains4.conf
curl ident.me   # Тут без прокси
}



# Тут с прокси
function z() {
echo "Проверить мой прокси -- proxychains4 curl ident.me"
proxychains4 curl ident.me  # Тут с прокси
}

# Тут без прокси
function zz() {
echo "Проверить без прокси -- curl ident.me"
curl ident.me   # Тут без прокси
}


####################################################################
function mainn() {
echo " 1 - Установить обновления upgrade dist-upgrade  "

echo " 2 - Сохранить пакеты в ОС в файл     "

echo " 3 - Установить нужные пакеты из файла  "

echo " 4 - Сохранение в файл список подходящих файлов из РЕПОЗИТОРИЯ  "

echo " 5 - Exit  ****** "

echo " 6 - Внести стандартные репы Debian 12 Bookworm в файл ОС  "

echo " 7 - Внести стандартные репы Debian 13 Trixie в файл ОС  "

echo " 8 - Внести стандартные репы Debian 14 Forky  в файл ОС "
###
echo " 9 - Добавить репы Kali "
##
echo " 10 - Настроить tor proxychain торификацию в Debian 12 "

echo " 11 - Убрать торификацию в Debian 12 "
##
echo " 12 - Проверить мой прокси -- proxychains4 curl ident.me "

echo " 13 - Проверить без прокси -- curl ident.me "

####
echo "                Введите значение ... "

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

9) ia
;;

10) ja
;;

11) ka
;;

12) z
;;

13) zz
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
