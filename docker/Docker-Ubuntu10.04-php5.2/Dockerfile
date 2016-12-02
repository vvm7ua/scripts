FROM ubuntu:10.04

ENV DEBIAN_FRONTEND noninteractive 

RUN locale-gen en_US.UTF-8 && dpkg-reconfigure locales 

RUN sed -i -e"s/archive/old\-releases/" /etc/apt/sources.list
RUN apt-get update
RUN whereis add-apt-repository
RUN apt-get install -y python-software-properties
RUN add-apt-repository ppa:txwikinger/php5.2
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 9CC59506
RUN apt-get update
RUN apt-get upgrade -y
COPY php /etc/apt/preferences.d/php
RUN apt-get install -y openssh-server apache2 supervisor
RUN mkdir -p /var/lock/apache2 /var/run/apache2 /var/run/sshd /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN apt-get install -y wget curl php5 php5-cli php5-common php5-gd php5-imap php5-mysql php5-dev php-pear php-soap php5-xmlrpc
RUN pear install Archive_Tar-1.3.11
RUN pear install Auth-1.6.4
RUN pear install Console_Getopt-1.3.1
RUN pear install DB-1.7.14
RUN pear install HTML_Template_IT-1.3.0
RUN pear install HTTP-1.4.1
RUN pear install HTTP_Download-1.1.4
RUN pear install Image_Barcode-1.1.1
RUN pear install Image_Canvas-0.3.3
RUN pear install Image_Graph-0.8.0
RUN pear install MDB2-2.4.1
RUN pear install MDB2_Driver_mysql-1.4.1
RUN pear install MIME_Type-1.3.0
RUN pear install Mail_Mime-1.8.2
RUN pear install Mail_Queue-1.2.7
RUN pear install Mail_mimeDecode-1.5.5
RUN pear install Net_SMTP-1.6.1
RUN pear install Net_UserAgent_Detect-2.5.2
RUN pear install OLE-1.0.0RC1
RUN pear install PEAR-1.9.4
RUN pear install Spreadsheet_Excel_Writer-0.9.2
RUN pear install XML_Parser-1.3.4
RUN pear install XML_RPC-1.5.5

VOLUME ["/var/www"]
EXPOSE 22 80
CMD ["/usr/bin/supervisord"]
