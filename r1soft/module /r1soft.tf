data "aws_ami" "amazon" {
  most_recent = true
  owners      = ["137112412989"]

  filter {
    name   = "state"
    values = ["available"]
  }

}

resource "aws_instance" "r1soft"         {
  depends_on                  = ["aws_key_pair.r1soft"]
  instance_type               = "${var.instance_type}"
  ami                         = "${data.aws_ami.amazon.id}"
  key_name                    = "${var.key_name}"
  associate_public_ip_address = "true"
  security_groups             = ["allow_ssh_and_r1soft"]


  provisioner "file" {
   connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "${var.user}"
      private_key = "${file(var.ssh_key_location)}"
    }

    source      = "~/.ssh"
    destination = "/tmp/"
  }



  provisioner "file" {
   connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "${var.user}"
      private_key = "${file(var.ssh_key_location)}"
    }

    source      = "./module/r1soft.repo"
    destination = "/tmp/r1soft.repo"
  }






  provisioner "remote-exec" {
    connection {
      host        = "${self.public_ip}"
      type        = "ssh"
      user        = "${var.user}"
      private_key = "${file(var.ssh_key_location)}"
    }
    

    inline = [
	"sudo cp /tmp/r1soft.repo /etc/yum.repos.d/",          
        "sudo  yum install r1soft-cdp-enterprise-server -y",
        "sudo r1soft-setup --user admin --pass p@ssw4rd --http-port 80",
        "sudo systemctl restart cdp-server",
    ]
  }


  tags = {
    Name = "r1soft"                     
  }
}