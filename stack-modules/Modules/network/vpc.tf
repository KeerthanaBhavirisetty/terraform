resource "aws_vpc" "studentapp-vpc" {
  cidr_block       = "10.0.0.0/21"
  instance_tenancy = "default"

  tags = {
    Name = "main"
  }
}