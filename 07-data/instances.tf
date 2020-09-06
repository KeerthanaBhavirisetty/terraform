resource "aws_instance" "node" {
  count         = 2
  ami           = "ami-07d19c1aefc450697"
  instance_type = "t2.micro"
  key_name      = "key_28042020"
  subnet_id     = "${data.aws_subnet_ids.subnets.index}"

  tags = {
    Name = "Instance-${count.index+1}"
  }
}
