resource "aws_instance" "node1" {
  ami           = "ami-07d19c1aefc450697"
  instance_type = "t2.micro"
  key_name      = "devops"

  tags = {
    Name = "Instance1"
  }
}

resource "aws_instance" "node2" {
  ami           = "ami-07d19c1aefc450697"
  instance_type = "t2.micro"
  key_name      = "devops"

  tags = {
    Name = "Instance2"
  }
}