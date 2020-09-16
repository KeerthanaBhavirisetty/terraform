resource "aws_subnet" "main" {
    count       = 4
    vpc_id      = aws_vpc.studentapp-vpc.id
    cidr_block  = cidrsubnet("10.0.0.0/21", 3, 2)
    availability_zone = var.AZ[count]

  tags = {
    Name = "Main"
  }
}