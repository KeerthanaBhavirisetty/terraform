resource "aws_instance" "web" {
  ami           = data.aws_ami.myami.id
  instance_type = "t2.micro"

  tags = {
    Name = "HelloWorld"
  }
}