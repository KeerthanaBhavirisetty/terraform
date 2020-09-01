resource "aws_instance" "node" {
  count         = 2
  ami           = "ami-07d19c1aefc450697"
  instance_type = "t2.micro"
  key_name      = "key_28042020"
  security_groups = "sg-a89c67f6"

  tags = {
    Name = "Instance"
  }
}
