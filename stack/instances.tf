resource "aws_instance" "node" {
  count         = 2
  ami           = "vars.ami"
  instance_type = "t2.micro"
  key_name      = "devops"
  subnet_id     = sort(data.aws_subnet_ids.subnets.ids)[count.index]

  tags = {
    Name = "Instance-${count.index+1}"
  }
}
