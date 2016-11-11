#!/bin/bash

cd /root
wget http://downloads.zend.com/guard/5.5.0/ZendGuardLoader-php-5.3-linux-glibc23-x86_64.tar.gz
tar xzf ZendGuardLoader-php-5.3-linux-glibc23-x86_64.tar.gz
cp ZendGuardLoader-php-5.3-linux-glibc23-x86_64/php-5.3.x/ZendGuardLoader.so /usr/lib64/php/modules/

file=/usr/lib64/php/modules/ZendGuardLoader.so
echo zend_extension=$file > /etc/php.d/zend_extensions.ini
chmod 644 $file
chown 0:0 $file

service httpd reload
