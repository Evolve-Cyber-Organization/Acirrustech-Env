---
- hosts: all
  become: yes
  become_method: sudo
  tasks:
  - name: install amazon-ssm-agent
    yum:
      name:  https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm
      state: present

  - name: start amazon ssm-agent
    systemd:
      state: restarted
      name: amazon-ssm-agent
      state: enable
      name: amazon-ssm-agent
      state: started
      name: amazon-ssm-agent
