resource "aws_instance" "node"{
  ami           = "ami-07d19c1aefc450697"
  instance_type = "t2.micro"
  key_name      = "key_28042020"
  vpc_security_group_ids = ["sg-0fd363c7a673b5e7c"]

  tags = {
    Name = "Instance-1"
  }
}

resource "null_resource" "connect-to-ec2" {

    connection {
        type     = "ssh"
        user     = "centos"
        private_key = file("/opt/devops.pem")
        host     = element(aws_instance.node.*.public_ip, 0)  
    }

    provisioner "file" {
    source      = "conf/myapp.conf"
    destination = "/etc/myapp.conf"
    }

    provisioner "remote-exec" {
      inline = [
          "sudo yum install git ansible -y"       
          ""
      ]
  }
   
}

   
