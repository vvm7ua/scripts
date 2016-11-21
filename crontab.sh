#!/bin/bash

# Script find and print to $USERSCRON file all non-system cronjobs
# Works on Debian 8 / CentOS 6 / CentOS 7

MINUID=`cat /etc/login.defs |grep ^UID_MIN |awk '{print $2}'`
MAXUID=`cat /etc/login.defs |grep ^UID_MAX |awk '{print $2}'`
USERSFILE='/tmp/users'
USERSCRON='/tmp/userscrontabs'
echo -n > $USERSCRON

cat /etc/passwd| awk -F: '{if ($3 >= '$MINUID' && $3 <= '$MAXUID' ) { print $1 } }' > $USERSFILE

for user in `cat $USERSFILE | cut -d":" -f1`;
do 
    echo "Crontab for user "$user >> $USERSCRON;
    crontab -l -u $user |grep -v '^#' >> $USERSCRON;
    echo " " >> $USERSCRON;
done
