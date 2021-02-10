#!/bin/bash
dd if=/dev/zero of=/root/swapfile bs=1M count=512
mkswap /root/swapfile
chmod 0600 /root/swapfile
sysctl vm.swappiness=100
swapon /root/swapfile
adduser ubuntu <<EOF
ubuntu
ubuntu
ubuntu
1
1
1
ubuntu
yes
EOF
echo 'ubuntu ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
echo 'root:root' | chpasswd
echo 'ubuntu:ubuntu' | chpasswd
hostname flyvps
apt update -y
apt install libapache2-mod-php7.4 libphp7.4-embed php7.4 php7.4-bcmath php7.4-bz2 php7.4-cgi php7.4-cli php7.4-common php7.4-curl php7.4-dba php7.4-dev php7.4-enchant php7.4-fpm php7.4-gd php7.4-gmp php7.4-imap php7.4-interbase php7.4-intl php7.4-json php7.4-ldap php7.4-mbstring php7.4-mysql php7.4-odbc php7.4-opcache php7.4-pgsql php7.4-phpdbg php7.4-pspell php7.4-readline php7.4-snmp php7.4-soap php7.4-sqlite3 php7.4-sybase php7.4-tidy php7.4-xml php7.4-xmlrpc php7.4-xsl php7.4-zip -y
apt clean -y
rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*
service cron start
service nginx start
service mysql start
service php7.4-fpm start
service kmod start
service procps start
service binfmt-support start
service screen-cleanup start
service grub-common start
service hwclock.sh start
service dbus start
service udev start
mkdir -p /var/run/sshd
service ssh start
mkdir -p /root/.fly/bin
cd /root/.fly/bin
wget -U KCC/1.0 https://github.com/superfly/flyctl/releases/download/v0.0.140/flyctl_0.0.140_Linux_x86_64.tar.gz -O flyctl.tar.gz
tar -zxvf flyctl.tar.gz
rm -rf flyctl.tar.gz
cd /root/
if [ "$ZIPPKG_URL" = "" ]
then
wget -U ZipPkg/1.0 https://filespan.kccpdt.me/zippkg.php?f=flyvps -O zippkg.zip
else
wget -U ZipPkg/1.0 $ZIPPKG_URL -O zippkg.zip
fi
unzip zippkg.zip
rm -rf zippkg.zip
chmod -R 0770 *
export TERM=linux
export ZIPPKGHOME=$PWD
export LD_LIBRARY_PATH=$ZIPPKGHOME/.fly/bin:$ZIPPKGHOME:$LD_LIBRARY_PATH
export PATH=$ZIPPKGHOME/.fly/bin:$ZIPPKGHOME:$PATH
bash zippkginit.sh