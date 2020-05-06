#!/bin/bash
# For centos 6
# sudo yum install mysql mysql-server -y    
# sudo service mysql start                  
# sudo chkconfig mysql on 

For centos 7
sudo yum install mariadb-server -y
sudo systemctl start mariadb
sudo systemctl enable mariadb
