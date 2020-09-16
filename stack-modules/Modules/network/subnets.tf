resource "aws_subnet" "main" {
    count       = 4
    vpc_id      = aws_vpc.studentapp-vpc.id
    cidr_block  = cidrsubnet(var.VPC_CIDR, 3, count.index)

  tags = {
    Name = "Main"
  }
}