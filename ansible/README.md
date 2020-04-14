Fail2ban Service Installation on CentOS7 and Amazon-Linux

This playbook will Install and Configure Fail2ban Service on CentOS7 and Amazon-Linux

**** Fail2ban Service *****

fail2ban.yaml file

For the configuration part of the playbook input your IP/CIDR block on lines 48 and 60

THis playbook installs and configures Fail2ban Service on CentOS7

The requirement to install Fail2ban service is epel-release repository

It installs epel-release on CentOS7


Installs Fail2ban service on CentOS7

Enables Fail2ban Service

Creates configuration file on CentOS7

Configures Fail2ban service on CentOS7



Restarts Fail2ban service on CentOS7

**** Fail2ban Configuration" ****

Allows 3 retry

Allows 2 minutes to login

If failed to login, bans for 1 hour

Ignores school's CIDR block
