resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.studentapp-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = var.AZ[count]

  tags = {
    Name = "Main"
  }
}