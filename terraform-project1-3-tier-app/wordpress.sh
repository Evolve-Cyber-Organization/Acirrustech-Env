  provisioner "remote-exec" {
    connection {
      host          = self.public_ip
      type          = "ssh"
      user          = "centos"
      private_key   = file("~/.ssh/id_rsa")
      }
      inline = [
        "sudo yum install httpd -y && sudo yum install epel-release -y",
        "sudo yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y",
        "sudo yum-config-manager --enable remi-php70 && sudo yum install php php-gd php-mysql -y",
        "sudo yum install wget -y && sudo wget https://wordpress.org/latest.tar.gz",
        "sudo tar -xf latest.tar.gz && sudo cp -a wordpress/* /var/www/html && sudo chown -R apache:apache /var/www/html",
        "sudo sed -i 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/selinux/config && sudo setenforce 0",
        "sudo systemctl start httpd && sudo systemctl enable httpd",
        ]
      } 

  tags = {
    Name        = "${var.environment}"
  }
