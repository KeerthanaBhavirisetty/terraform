resource "aws_instance" "nodes" {
    count                       = var.INSTANCE_COUNT
    ami                         = data.aws_ami.myami.id
    instance_type               = var.INSTANCE_TYPE
    key_name                    = var.KEYPAIR_NAME
    subnet_id                   = element(var.PUBLIC_SUBNETS,count.index)
    vpc_security_group_ids      = [aws_security_group.allow_ec2.id]

    tags = {
        Name                    = "${var.PROJECT_NAME}-${var.PROJECT_ENV}-Instance-${count.index+1}"
        created_by              = "Terraform"
        PROJECT_NAME            = var.PROJECT_NAME
        ENVIRONMENT             = var.PROJECT_ENV
    }
}

resource "null_resource" "connect-to-ec2" {

    connection {
        type            = "ssh"
        user            = "centos"
        private_key     = file("/opt/devops.pem")
        host            = element(aws_instance.nodes.private_ip, 0)  
    }

    provisioner "file" {
        source          = "/opt/gitconnect.pem"
        destination     = "/home/centos/.ssh/id_rsa"
    }

    provisioner "remote-exec" {
      inline = [
          "sudo yum install git ansible -y",     
          "sudo chmod 600 /home/centos/.ssh/id_rsa",
          "ansible-pull --accept-host-key -U git@github.com:KeerthanaBhavirisetty/ansible-pull.git setup.yml"
      ]
  }
   
}