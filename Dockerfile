FROM ubuntu:20.04
MAINTAINER NiuShiSan "78002887+niushisan@users.noreply.github.com"
ENV TERM=linux
COPY init.sh /root/init.sh
RUN apt clean -y \
    && apt update -y \
    && apt upgrade -y \
    && apt autoremove -y \
    && apt install apt-utils -y \
    && apt install openvpn -y \
    && apt install openssh-server -y \
    && apt install wget -y \
    && apt install curl -y \
    && apt install git -y \
    && apt install nano -y \
    && apt install vim -y \
    && apt install tar -y \
    && apt install zip -y \
    && apt install unzip -y \
    && apt install screen -y \
    && apt install cron -y \
    && apt install nginx -y \
    && apt install apache2 -y \
    && apt install php -y \
    && apt install php-fpm -y \
    && apt install libapache2-mod-php -y \
    && apt install php-mysql -y \
    && apt install sqlite -y \
    && apt install php-sqlite3 -y \
    && apt install mysql-server -y \
    && apt install mysql-client -y \
    && apt install libmysqlclient-dev -y \
    && apt install busybox -y \
    && apt install python -y \
    && apt install python2 -y \
    && apt install nodejs -y \
    && apt install clang -y \
    && apt install golang -y \
    && apt install build-essential -y \
    && apt install qemu-system -y \
    && apt install inetutils-ping -y \
    && apt install net-tools -y \
    && apt install sudo -y \
    && apt install strace -y \
    && apt install rename -y \
    && apt install bash -y \
    && apt install linux-image-generic -y \
    && apt install kmod -y \
    && apt clean -y \
    && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/* \
    && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
    && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
    && chmod 0770 /root/init.sh


EXPOSE 80 443 22
CMD ["/root/init.sh"]
