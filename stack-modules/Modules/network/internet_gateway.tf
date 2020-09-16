resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.studentapp-vpc.id

  tags = {
    Name = "main"
  }
}