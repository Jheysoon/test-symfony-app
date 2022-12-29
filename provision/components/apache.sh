#!/bin/bash

apt-get update
apt-get install -y apache2

# Copy the vhost config file
cp /var/www/html/provision/config/apache/vhosts/test-symfony.com.conf /etc/apache2/sites-available/test-symfony.com.conf

# Disable the default vhost file
#a2dissite 000-default

# Enable our custom vhost file
a2ensite test-symfony.conf

a2enmod rewrite

# Restart for the changes to take effect
systemctl restart apache2