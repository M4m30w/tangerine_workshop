#!/bin/bash -xe

RESOURCE_INDEX=$1
sudo yum -y update
sudo yum -y install httpd
IP=$(curl -s -H "Metadata-Flavor:Google" http://metadata/computeMetadata/v1/instance/network-interfaces/0/ip)
echo "Welcome to Resource ${RESOURCE_INDEX} - ${HOSTNAME} (${IP})" > /var/www/html/index.php
service httpd start
