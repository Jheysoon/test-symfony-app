#!/bin/bash

sudo apt-get install software-properties-common
sudo LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install -y php8.1 php8.1-common php8.1-bcmath php8.1-bz2 php8.1-cli php8.1-curl php8.1-intl php8.1-mbstring php8.1-opcache php8.1-soap php8.1-xml php8.1-xsl php8.1-zip libapache2-mod-php8.1 php8.1-mysql php8.1-imap php8.1-gd openssl git unzip

sed -i 's/max_execution_time = .*/max_execution_time = 1000/' /etc/php/8.1/apache2/php.ini
sed -i 's/post_max_size = .*/post_max_size = 64M/' /etc/php/8.1/apache2/php.ini
sed -i 's/upload_max_filesize = .*/upload_max_filesize = 1G/' /etc/php/8.1/apache2/php.ini
sed -i 's/memory_limit = .*/memory_limit = 512M/' /etc/php/8.1/apache2/php.ini
sed -i 's/;extension=imap = .*/extension=imap/' /etc/php/8.1/apache2/php.ini
sed -i 's/;extension=gd2 = .*/extension=gd2/' /etc/php/8.1/apache2/php.ini
sed -i 's/;date.timezone = .*/date.timezone = UTC/' /etc/php/8.1/apache2/php.ini

sudo a2enmod php8.1

sudo service apache2 restart

curl -Ss https://getcomposer.org/installer | php

sudo mv composer.phar /usr/bin/composer
