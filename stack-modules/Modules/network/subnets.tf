resource "aws_subnet" "public-subnets" {
    count       = 4
    vpc_id      = aws_vpc.studentapp-vpc.id
    cidr_block  = cidrsubnet(var.VPC_CIDR, 3, count.index)
    availability_zone = element(var.AZ,count.index)

  tags = {
     Name = "public-subnet-${count.index}"
     PROJECT_NAME = var.PROJECT_NAME
     ENVIRONMENT  = var.PROJECT_ENV
     CREATED_BY   = Terraform
  }
}

resource "aws_subnet" "private-subnets" {
    count       = 4
    vpc_id      = aws_vpc.studentapp-vpc.id
    cidr_block  = cidrsubnet(var.VPC_CIDR, 3, count.index+4)
    availability_zone = element(var.AZ,count.index)

  tags = {
     Name = "private-subnet-${count.index}"
     PROJECT_NAME = var.PROJECT_NAME
     ENVIRONMENT  = var.PROJECT_ENV
     CREATED_BY   = Terraform
  }
}