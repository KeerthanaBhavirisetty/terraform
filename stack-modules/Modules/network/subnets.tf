resource "aws_subnet" "main" {
    count       = 4
    vpc_id      = aws_vpc.studentapp-vpc.id
    cidr_block  = cidrsubnet("10.0.0.0/21", 3, 2)

  tags = {
    Name = "Main"
  }
}