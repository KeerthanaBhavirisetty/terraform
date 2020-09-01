resource "aws_instance" "web" {
  ami           = "ami-07d19c1aefc450697"
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}