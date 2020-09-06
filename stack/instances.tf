resource "aws_instance" "node" {
  count         = 2
  ami           = var.ami
  instance_type = "t2.micro"
  key_name      = "key_28042020"
  subnet_id     = sort(data.aws_subnet_ids.subnets.ids)[count.index]

  tags = {
    Name = "Instance-${count.index+1}"
  }
}
